# Standalone Flutter workflow

Use this workflow when Superpowers is unavailable. It preserves the Flutter
audit, approval, TDD, verification, security, and changelog gates without
depending on a particular agent runtime.

## Canonical gate sequence

Follow this sequence exactly:

```text
discover → scope → inspect → diagnose → design → propose → approve → RED → GREEN → REFACTOR → review diff → verify → changelog → report
```

Do not merge, reorder, or silently skip gates. An audit-only request remains
read-only, reports its evidence and proposals, and stops at `approve` unless
the user explicitly approves named implementation batches. For an allowed
no-test exception, keep the `RED` gate and record the applicable predicate
rather than removing the gate.

## Gate contracts

### discover

- **Entry condition:** A user request and a candidate repository or project
  context are available.
- **Evidence/output:** Identify applicable instructions, repository root,
  Flutter and Dart roots, package manager and lockfiles, architecture
  documentation, analysis configuration, CI or project commands, tests,
  generated-file policy, changelogs, current Git state, and relevant project
  conventions. Record unavailable evidence.
- **Stop condition:** Stop before proposing a solution when the repository
  root is unresolved, applicable instructions cannot be determined, or a
  missing project decision could materially change the work.

### scope

- **Entry condition:** Discovery evidence identifies the project and governing
  instructions.
- **Evidence/output:** State the requested outcome, changed files, direct
  dependencies, excluded work, expected behavior, and approval boundaries.
  Default an audit to changed files plus direct dependencies. Record whether
  the user explicitly requested a full audit.
- **Stop condition:** Stop and ask when material scope is ambiguous. Do not
  infer a repository-wide audit or unrelated modernization.

### inspect

- **Entry condition:** The scope boundary is explicit enough to inspect without
  expanding it.
- **Evidence/output:** Perform read-only inspection of scoped files, diffs,
  imports, package edges, tests, configurations, commands, changelogs, and
  direct dependents. Separate mechanical inventory from architectural
  judgment, and preserve secret values from disclosure.
- **Stop condition:** Stop when necessary evidence cannot be read or when an
  inspection action would modify files or external state. If an unexpected
  modification occurs, stop and report it before continuing.

### diagnose

- **Entry condition:** Inspection produced reproducible observations.
- **Evidence/output:** Explain the behavior, dependency path, violated
  predicate, and technical impact. For a bug, reproduce the symptom and
  establish its root cause before proposing a fix. For other work, identify
  the concrete need rather than relying on preference.
- **Stop condition:** A bug fix cannot proceed while root cause remains
  unknown. Stop on contradictory evidence or when diagnosis requires access or
  a product decision that is unavailable.

### design

- **Entry condition:** The diagnosis is evidence-backed and the current-change
  boundary is known.
- **Evidence/output:** Define the smallest compliant design, responsibilities,
  public boundaries, state semantics, lifecycle ownership, data flow,
  dependency direction, migration or UI decisions, test strategy, and
  verification impact. Preserve coherent existing architecture.
- **Stop condition:** Stop when the design depends on an unresolved material
  decision, missing exact design asset, unapproved dependency comparison,
  unapproved migration, or unsupported exception.

### propose

- **Entry condition:** A bounded design and its evidence are available.
- **Evidence/output:** Present findings using `audit-contract.md`, then create
  small named batches that are independently approvable. Each batch names its
  scope, files or boundaries, tests, verification, changelog impact,
  dependencies on other batches, and any separate approval or external action.
  Keep future debt separate.
- **Stop condition:** Stop and refine a proposal that is unbounded, combines
  unrelated work, lacks evidence, or cannot be approved independently.

### approve

- **Entry condition:** Named proposal batches and their consequences have been
  presented.
- **Evidence/output:** Record the user's explicit approval by batch name,
  including any approved dependency, migration, exception, design deviation,
  destructive action, or external action. Translate the approval into an exact
  implementation boundary.
- **Stop condition:** Do not implement without explicit approval of a named
  batch. Audit approval, urgency, authority, sunk cost, and “fix everything”
  are not sufficient. An audit-only request reports and waits here.

### RED

- **Entry condition:** A named implementation batch is explicitly approved and
  its intended behavior or allowed no-test predicate is defined.
- **Evidence/output:** For new or changed behavior, remove the entire untested
  behavior implementation from the working tree and every deployable or
  repository path before RED; do not retain, copy, stash, comment it out, or
  use it as an implementation reference. Then write one focused test and run
  the exact command to observe failure for the expected missing-behavior
  reason. Before an uncovered refactor, write and run characterization tests
  that lock down existing behavior. For generated code, documentation,
  configuration without logic, or a purely visual change without testable
  behavior, record that exact exception predicate and the applicable non-test
  validation.
- **Stop condition:** Do not enter GREEN if the behavior test passes
  unexpectedly, fails for the wrong reason, was not run, or an uncovered
  refactor lacks passing characterization coverage.

### GREEN

- **Entry condition:** The expected RED failure was observed, characterization
  coverage protects the refactor, or an allowed no-test predicate was recorded.
- **Evidence/output:** Implement only the minimum approved change required to
  satisfy the test or documented non-behavior contract. Run the focused tests
  and record their actual result.
- **Stop condition:** Stop when the focused test does not pass, the change
  requires scope beyond the approved batch, or new evidence invalidates the
  design.

### REFACTOR

- **Entry condition:** Focused tests are green, or the approved no-test change
  satisfies its documented validation.
- **Evidence/output:** Improve only structure, naming, or duplication needed
  within the approved scope. Preserve behavior and rerun the focused tests or
  applicable non-behavior validation after each material refactor.
- **Stop condition:** Stop and return to GREEN when behavior changes, a check
  fails, or cleanup would expand into future debt or an unapproved batch.

### review diff

- **Entry condition:** GREEN and scoped REFACTOR work are complete.
- **Evidence/output:** Inspect the full scoped diff and status. Confirm every
  changed file belongs to an approved batch; expected generated outputs and
  lifecycle changes are present; unrelated cleanup, debug output, secret
  values, and accidental dependency or version changes are absent. Record any
  approved exception with its rule, observation, reason and impact, and
  approval.
- **Stop condition:** Do not verify while the diff contains unexplained,
  unsafe, unrelated, or unapproved changes. Return to the appropriate earlier
  gate.

### verify

- **Entry condition:** The reviewed implementation diff is scoped and
  explainable.
- **Evidence/output:** Run fresh repository-defined format, analysis or lint,
  code generation, affected tests, full suite, coverage, generated-file
  consistency, and relevant build gates. Repeat applicable gates in modified
  local packages and every direct dependent. Record exact commands, scopes,
  exit status, counts or thresholds, and actual results; state every skipped
  validation and its reason.
- **Stop condition:** Do not claim completion when a required gate fails,
  evidence is stale, a direct dependent was omitted, or a skipped validation
  lacks a reason. Any later implementation change invalidates verification and
  returns the work to `review diff`.

### changelog

- **Entry condition:** Fresh verification supports the reviewed
  implementation, and no implementation file has changed afterward.
- **Evidence/output:** Add one concise observable entry to the existing
  canonical changelog in its language, format, and category. Use a package
  changelog only for an independently released package or established
  convention. Record path, category, and exact entry.
- **Stop condition:** Do not create a missing changelog or bump a version
  without explicit approval. If either decision is unresolved, stop and
  request it. If adding the entry reveals or causes an implementation change,
  return to `review diff` and obtain fresh verification.

### report

- **Entry condition:** Approved scope is implemented, fresh verification
  remains valid, the changelog decision is resolved, and remaining work is
  classified.
- **Evidence/output:** Produce the exact implementation report contract below
  in the user's language, backed only by observed results.
- **Stop condition:** Do not report completion if any required heading,
  command result, applicable behavior-change RED evidence, pre-refactor
  characterization result, or allowed no-test exception is missing, or if the
  changelog disposition, skipped-validation reason, or remaining-debt
  classification is missing.

## Exact implementation report contract

Use exactly these headings in this order and do not rename or omit them:

```markdown
## Outcome

State complete, partial, or blocked and describe the observable result without
claiming more than the evidence proves.

## Approved scope implemented

List the explicitly approved named batches, exact files or boundaries changed,
and any exception record with rule, observation, technical reason and impact,
and approval.

## Tests written and observed RED

Report the applicable evidence without fabricating a RED result:

- Behavior changes: list each test, its exact RED command, the observed expected
  failure reason, and its GREEN/REFACTOR results.
- Uncovered refactors: list each characterization test, its exact pre-refactor
  command and passing result that locks down existing behavior, followed by the
  post-refactor rerun. Do not claim RED unless a separate behavior change
  actually observed it.
- Allowed no-test predicates: state the exact predicate and non-test validation
  instead of claiming RED.

## Commands executed and actual results

List each exact command, scope, exit status, and actual result. Identify the
fresh completion verification and package/direct-dependent coverage.

## Changelog entry

Give the canonical path, category, and exact concise entry, or the approved
disposition when no canonical changelog exists.

## Skipped validation with reason

List every relevant validation not run and its concrete reason. Write `None`
only when no relevant validation was skipped.

## Remaining approved or future debt

Separate unfinished approved work from future debt and unapproved proposals.
Write `None` only when the inspected scope supports that statement.
```
