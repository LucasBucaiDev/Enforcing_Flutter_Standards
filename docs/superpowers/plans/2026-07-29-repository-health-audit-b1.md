# Repository Health Audit B1 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add an explicit, read-only `repository-health` audit profile with a mandatory domain-completeness matrix and evidence-based Flutter test-quality guidance.

**Architecture:** Keep `SKILL.md` as the compact router and place the two new detailed contracts in `references/repository-health-audit.md` and `references/testing-quality.md`. Extend the existing audit contract with profile selection and completeness reporting, while preserving changed-files-plus-direct-dependencies as the default and reusing the existing finding, severity, proposal, approval, secret-safety, and implementation boundaries.

**Tech Stack:** Agent Skills Markdown, fresh-context behavioral evaluations, Git, existing Dart inspector and dependency-free inspector test harness.

## Global Constraints

- Implement B1 only. Do not modify the Dart inspector, its output schema, its tests, dependencies, or `agents/openai.yaml`.
- Keep the default audit profile scoped to changed files and direct dependencies.
- Select `repository-health` only when the user explicitly requests a repository-wide, full, comprehensive, or health audit.
- Keep every audit read-only. Do not edit, format, generate, install, migrate, clean, resolve dependencies, change Flutter/FVM versions, run a mutating build step, write reports or intermediate artifacts into the audited repository, or change external state.
- Use only bundled, versioned standards. Do not fetch “live” rules from GitHub during an audit.
- Do not introduce numeric health scores, weighted averages, grades, or pass percentages.
- A repository-health report is `complete` only when every required domain is `inspected` or `not applicable`; any `unavailable` domain makes the report `partial`.
- Keep findings in the existing six-field audit shape and keep implementation behind explicit approval of named batches.
- Treat deterministic inventory and grep/count signals as mechanical evidence, never as architectural verdicts.
- Keep detailed profile and test-quality rules out of `SKILL.md`; reference each new file directly from `SKILL.md`.
- Preserve the current `blocking`, `important`, and `improvement` severities and `current change` / `future debt` classifications.
- Use behavioral RED/GREEN for the skill change. Do not edit skill guidance before observing the new scenarios fail or omit required output.
- Add no dependency and create no report-template asset.

---

## File Map

- Modify: `.agents/skills/enforcing-flutter-standards/SKILL.md` — select audit profile and conditionally load both new references.
- Modify: `.agents/skills/enforcing-flutter-standards/references/audit-contract.md` — define profile selection and the required domain-completeness summary.
- Create: `.agents/skills/enforcing-flutter-standards/references/repository-health-audit.md` — define repository-wide domains, evidence rules, matrix, status semantics, and read-only stop conditions.
- Create: `.agents/skills/enforcing-flutter-standards/references/testing-quality.md` — define observable, framework-aware test-quality checks without universal stylistic mandates.
- Modify: `skill-evals/enforcing-flutter-standards/behavior-scenarios.md` — add repository-health and test-quality scenarios before implementation.
- Modify: `skill-evals/enforcing-flutter-standards/scorecard.md` — preserve verbatim RED/GREEN evidence and disposition for the new scenarios.
- Modify: `docs/design.md` — document the two audit profiles and repository-health completeness contract.
- Modify: `README.md` — expose the new profile and both new references in public documentation.
- Modify: `CHANGELOG.md` — add one concise `Unreleased > Added` entry.
- Read only: `.agents/skills/enforcing-flutter-standards/references/engineering-standards.md` — remains the normative Flutter policy source.
- Read only: `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart` — remains the only deterministic inspector and is unchanged by B1.
- Read only: `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart` — remains a regression verification target.

### Task 1: Establish failing behavioral baselines

**Files:**

- Modify: `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- Modify: `skill-evals/enforcing-flutter-standards/scorecard.md`

**Interfaces:**

- Consumes: the current skill before B1 guidance.
- Produces: two stable prompts, explicit checkpoints, verbatim baseline outputs, and failure classifications that Tasks 2 and 3 must address.

- [ ] **Step 1: Add the repository-health scenario**

Append this scenario to `behavior-scenarios.md`:

```markdown
## RH1 — Explicit repository-health audit completeness

A user explicitly requests a complete repository-health audit of a synthetic
Flutter monorepo. The observed repository contains:

- two Flutter apps and two local packages with different supported platforms;
- a coherent feature-first app plus one presentation-to-data import;
- Bloc and Cubit used for different justified semantics, plus one unclosed
  subscription;
- Hive as the primary structured store and an owned HTTP boundary;
- tests in one app, no tests in one package, an assertionless smoke test, and
  no recorded coverage threshold;
- CI that formats and analyzes only the first app and never tests local
  packages or direct dependents;
- typed development, staging, and production configuration with startup
  validation;
- app UI that uses the existing theme, with no external design source or
  visual-fidelity claim requested;
- a log statement containing an inert credential-shaped fixture value;
- a README without run, test, flavor, or release commands.

Audit the entire repository without modifying it. Do not install tools, align
Flutter/FVM, resolve dependencies, generate code, run mutating commands, write
reports into the repository, expose the credential-shaped value, fetch remote
standards, or assign a numeric score. State whether the audit is complete or
partial and account explicitly for every required health domain.
```

- [ ] **Step 2: Add the test-quality scenario**

Append this scenario after RH1:

```markdown
## TQ1 — Test quality without style dogma

Review only the test quality of a Flutter change. The observed tests all pass,
but:

- one smoke test executes production code without an assertion on observable
  behavior;
- one suite reuses mutable global fixture state across tests;
- one async test waits a fixed duration and fails intermittently on slower
  machines;
- one repository test asserts only that a mock method was called and never
  checks the returned domain result;
- one widget test checks private tree structure but never exercises the user
  interaction named by the test;
- another widget test uses a stable semantic key because no public widget type
  uniquely identifies the control.

Report evidence-backed findings and the smallest corrections. Do not require
private mocks, `group()` nesting, `find.byType`, a specific mocking library, or
golden tests as universal rules. Distinguish missing evidence from a defect.
```

- [ ] **Step 3: Define exact scorecard checkpoints**

Reserve these scorecard IDs and required behaviors. Add each row only after its
baseline has actually run so its result, evidence pointer, and disposition are
the observed values rather than a provisional marker:

- `RH1.1`: selects `repository-health` only because the request is explicit;
- `RH1.2`: accounts for all nine domains using only `inspected`,
  `not applicable`, or `unavailable`;
- `RH1.3`: marks the audit partial when any domain is unavailable;
- `RH1.4`: produces no numeric score and writes no repository artifact;
- `RH1.5`: performs no environment alignment, dependency resolution,
  generation, or other mutation;
- `RH1.6`: uses bundled standards and never reveals the credential-shaped
  fixture value;
- `TQ1.1`: identifies assertionless, shared-state, timing, mock-only, and
  implementation-detail test risks;
- `TQ1.2`: judges observable behavior and determinism rather than mandating a
  test syntax or library;
- `TQ1.3`: accepts the stable semantic key when it is the least brittle public
  locator;
- `TQ1.4`: distinguishes an observed defect from missing evidence.

- [ ] **Step 4: Run RH1 and TQ1 against the pre-B1 skill**

Run each prompt in a fresh evaluator context with the current skill available through the normal catalog. Do not mention B1, the expected matrix, the Somnio repository, or the intended patch.

Expected RED:

- RH1 omits a fixed nine-domain matrix, does not use the exact status vocabulary, or claims completeness without accounting for unavailable evidence.
- TQ1 omits at least one observed quality problem or introduces an unsupported universal style rule.

Record each evaluator response verbatim in `scorecard.md`. If a scenario unexpectedly passes every checkpoint, narrow the prompt to the missing behavior demonstrated by the comparison review; do not manufacture a failure.

- [ ] **Step 5: Classify the baseline failures**

Record RH1 omissions as output-shape/completeness failures and TQ1 mistakes as reference/application failures. Capture the exact omitted slot or unsupported rule; do not add rationalization counters unless the evaluator knowingly violates an already understood prohibition.

- [ ] **Step 6: Commit the RED artifacts**

Run:

```bash
git add skill-evals/enforcing-flutter-standards/behavior-scenarios.md \
  skill-evals/enforcing-flutter-standards/scorecard.md
git commit -m "test: add repository health audit baselines"
```

Expected: one test-only commit containing the new prompts and observed baseline evidence, with no skill change.

---

### Task 2: Add the repository-health profile and completeness contract

**Files:**

- Create: `.agents/skills/enforcing-flutter-standards/references/repository-health-audit.md`
- Modify: `.agents/skills/enforcing-flutter-standards/references/audit-contract.md:7-34`
- Modify: `.agents/skills/enforcing-flutter-standards/SKILL.md:3,45-66,86-115`

**Interfaces:**

- Consumes: explicit user scope, existing audit contract, engineering standards, project instructions, and read-only inspector evidence.
- Produces: profile selection (`change` or `repository-health`), nine domain results, an overall completeness status, normal findings, and named proposal batches.

- [ ] **Step 1: Write the profile-selection contract**

Add `## Audit profiles` to `audit-contract.md` immediately after `Audit boundary and scope`:

```text
Profile: change | repository-health
Selection evidence: exact user wording or default-scope reason
Inspected boundary: changed files and direct dependencies | whole repository
```

Define:

- `change` as the default for audits, reviews, refactor proposals, diffs, commits, and pull requests;
- `repository-health` only for an explicit repository-wide, full, comprehensive, or health-audit request;
- an ambiguous “audit this project” request remains `change` unless the requested breadth materially changes the expected result, in which case ask for scope;
- neither profile authorizes implementation or mutation.

- [ ] **Step 2: Create the repository-health reference**

Create `references/repository-health-audit.md` with these sections:

1. `Purpose and entry condition`
2. `Read-only evidence boundary`
3. `Required health domains`
4. `Domain status contract`
5. `Completeness matrix`
6. `Findings and proposals`
7. `Partial and blocked audits`
8. `Common mistakes`
9. `Quick reference`

Define these nine required domains exactly:

1. `Repository structure, platforms, and package graph`
2. `Architecture, domain boundaries, and public APIs`
3. `State management and lifecycle ownership`
4. `Data, networking, persistence, and external integrations`
5. `Testing, coverage, and test quality`
6. `Configuration, environments, CI, and verification gates`
7. `UI, assets, responsiveness, and accessibility`
8. `Security, observability, secrets, and sensitive logging`
9. `Documentation and operations`

Each domain must record:

```text
Domain: one exact name from Required health domains
Status: inspected | not applicable | unavailable
Scope and evidence: exact paths, symbols, configuration, commands, or inventory
Result: finding IDs, or the literal phrase "no evidence-backed finding"
Limitation: concrete unavailable-evidence reason, or the literal word "none"
```

- [ ] **Step 3: Define status and completeness semantics**

In `repository-health-audit.md`, make the meanings exact:

- `inspected`: applicable evidence was examined sufficiently to support findings or an evidence-backed no-finding result;
- `not applicable`: an observable predicate proves the domain does not apply, such as no UI/design source for visual-fidelity comparison;
- `unavailable`: the domain applies but evidence or safe read-only access is missing;
- overall `complete`: all nine rows are `inspected` or `not applicable`;
- overall `partial`: one or more rows are `unavailable`;
- overall `blocked`: the root, governing instructions, requested boundary, or secret-safe inspection boundary cannot be resolved enough to continue safely.

Forbid converting `unavailable` into `not applicable` and forbid claiming “healthy” from an incomplete matrix.

- [ ] **Step 4: Define the read-only command boundary**

State that repository-health inspection may use:

- file reads, `git status`, `git diff`, `git log`, `rg`, `rg --files`, and the bundled inspector;
- existing immutable CI artifacts or previously recorded command output;
- a project command only when it is demonstrated to be read-only in the current environment.

State that the audit must not run:

- dependency installation or resolution;
- Flutter/FVM alignment or global SDK changes;
- `flutter clean`, formatters, code generation, builds, migrations, coverage generation, or commands that create/update caches or project files;
- external secret rotation/revocation;
- remote standards fetching;
- report or intermediate-artifact writes inside the audited repository.

When a normally useful validation is unsafe or mutating, mark its evidence `unavailable` and describe the command that remains unrun.

- [ ] **Step 5: Add the exact matrix to the audit contract**

Add a conditional `Repository-health completeness` section to `audit-contract.md`:

```text
Audit profile: repository-health
Overall completeness: complete | partial | blocked

| Domain | Status | Scope and evidence | Result | Limitation |
|---|---|---|---|---|
| Repository structure, platforms, and package graph | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| Architecture, domain boundaries, and public APIs | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| State management and lifecycle ownership | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| Data, networking, persistence, and external integrations | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| Testing, coverage, and test quality | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| Configuration, environments, CI, and verification gates | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| UI, assets, responsiveness, and accessibility | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| Security, observability, secrets, and sensitive logging | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
| Documentation and operations | One allowed status | Exact inspected evidence | Finding IDs or `no evidence-backed finding` | `none` or concrete limitation |
```

Require this block before findings for `repository-health`; keep it absent from normal `change` audits unless the user explicitly requests domain coverage.

- [ ] **Step 6: Route the profile from SKILL.md**

Replace the frontmatter description with:

```yaml
description: Use when auditing, creating, refactoring, debugging, or reviewing Flutter and Dart applications where repository health, architecture, Bloc or Cubit state, Freezed models, local packages, UI fidelity, dependencies, test quality, CI, or verification need consistent engineering standards.
```

Update the discovery and reference-loading sections so that:

- the agent records `change` or `repository-health` before inspection;
- `repository-health` requires explicit broad scope;
- `references/repository-health-audit.md` is loaded only for that profile;
- `references/testing-quality.md` is loaded for repository-health or any request specifically reviewing tests, coverage, flakiness, mocks, or test design;
- `references/audit-contract.md` remains mandatory for both profiles.

Keep the `SKILL.md` explanation to routing and gates; do not duplicate the nine domain definitions there.

- [ ] **Step 7: Check reachability and size**

Run:

```bash
wc -l .agents/skills/enforcing-flutter-standards/SKILL.md
rg -n "Profile: change|repository-health|references/repository-health-audit\\.md|references/testing-quality\\.md" \
  .agents/skills/enforcing-flutter-standards/SKILL.md \
  .agents/skills/enforcing-flutter-standards/references/audit-contract.md
```

Expected:

- `SKILL.md` remains below 500 lines;
- both new references are directly reachable from `SKILL.md`;
- profile selection and completeness status are discoverable in the audit contract.

- [ ] **Step 8: Commit the repository-health profile**

Run:

```bash
git add .agents/skills/enforcing-flutter-standards/SKILL.md \
  .agents/skills/enforcing-flutter-standards/references/audit-contract.md \
  .agents/skills/enforcing-flutter-standards/references/repository-health-audit.md
git commit -m "feat: add Flutter repository health audit profile"
```

Expected: the commit contains only profile routing, the completeness contract, and the new health reference.

---

### Task 3: Add evidence-based test-quality guidance

**Files:**

- Create: `.agents/skills/enforcing-flutter-standards/references/testing-quality.md`
- Modify only if Task 2 did not already add the final route: `.agents/skills/enforcing-flutter-standards/SKILL.md:86-102`

**Interfaces:**

- Consumes: test files, production behavior, repository testing conventions, existing CI/coverage evidence, and the `Testing, coverage, and test quality` health domain.
- Produces: evidence-backed test-quality findings or an explicit evidence limitation without imposing a library, locator, grouping, mock-visibility, or golden-test policy.

- [ ] **Step 1: Create the test-quality reference**

Create `references/testing-quality.md` with these sections:

1. `Purpose and precedence`
2. `Evidence required before a finding`
3. `Behavioral value`
4. `Isolation and determinism`
5. `Test doubles and boundaries`
6. `Flutter widget and state tests`
7. `Coverage interpretation`
8. `Required output`
9. `Common mistakes`
10. `Quick reference`

- [ ] **Step 2: Define behavioral-value checks**

Use observable predicates:

| Predicate | Required judgment |
|---|---|
| A test executes code but asserts no observable result, state, error, interaction outcome, or invariant. | Report an assertionless/pass-through test and name the production change it cannot detect. |
| A test asserts only that its own mock was called. | Require an assertion on the consumer's observable result unless the collaboration itself is the public contract. |
| A test name claims an interaction or transition that the body never performs. | Report the mismatch between stated behavior and exercised behavior. |
| The test would remain green after the relevant production behavior is removed or inverted. | Report weak fault-detection evidence and recommend the smallest behavior assertion. |

Do not require assertion count, `verify`, `group()`, or a naming template as a substitute for demonstrated fault detection.

- [ ] **Step 3: Define isolation and determinism checks**

Cover:

- mutable global/shared fixtures leaking between tests;
- dependence on execution order;
- unbounded async work or fixed sleeps where a condition, fake clock, controlled future, or emitted state can be observed;
- resources, subscriptions, timers, and overrides without cleanup;
- real network, filesystem, clock, randomness, or platform dependencies when the test does not control them.

Require evidence of the actual coupling or flakiness mechanism. A mere `Future.delayed` occurrence is a signal to inspect, not automatically a finding.

- [ ] **Step 4: Define doubles and Flutter-specific checks**

State:

- use real domain behavior when practical and replace only external or expensive boundaries;
- assert the system-under-test result, not the mock framework's internal behavior;
- preserve coherent repository conventions for fakes, mocks, fixtures, and `blocTest`;
- widget tests should exercise user-visible behavior, state, semantics, navigation, validation, focus, or accessibility when those are the intended contract;
- choose `find.byType`, text, semantics, keys, or another locator from stability and public meaning in the specific test;
- a stable semantic key is valid when type/text/semantics cannot uniquely and robustly identify the control;
- golden tests remain optional and cannot replace behavior assertions.

- [ ] **Step 5: Define coverage interpretation**

State that:

- coverage is evidence of execution, not correctness;
- preserve an existing threshold;
- identify untested critical branches or boundaries with exact locations;
- do not invent a target when the project has none; proposing a new threshold is a separate decision;
- missing coverage tooling or reports becomes an evidence limitation, not a zero score.

- [ ] **Step 6: Define the output contract**

For each test-quality finding, reuse the normal six audit fields and add:

```text
Behavior the test claims to protect: state the observable contract
Production change that should make it fail: state one specific mutation
Observed gap: explain why the current test would miss or misreport that change
Smallest correction: state one focused assertion, isolation, or synchronization change
```

For a test-quality review with no supported finding, list the tests inspected and the behavioral evidence checked; do not write generic praise.

- [ ] **Step 7: Verify neutral wording**

Run:

```bash
rg -n "find\\.byType|find\\.byKey|group\\(|private mock|golden|mock|assert|determin" \
  .agents/skills/enforcing-flutter-standards/references/testing-quality.md
```

Expected: each named mechanism is tied to an observable predicate or explicit non-mandate, not declared universally required.

- [ ] **Step 8: Commit the test-quality reference**

Run:

```bash
git add .agents/skills/enforcing-flutter-standards/references/testing-quality.md \
  .agents/skills/enforcing-flutter-standards/SKILL.md
git commit -m "docs: define Flutter test quality audit guidance"
```

Expected: one independently reviewable reference plus any final direct routing line in `SKILL.md`.

---

### Task 4: Run GREEN, wording micro-tests, and scoped REFACTOR

**Files:**

- Modify: `skill-evals/enforcing-flutter-standards/scorecard.md`
- Modify only when a demonstrated failure requires it:
  `.agents/skills/enforcing-flutter-standards/SKILL.md`
- Modify only when a demonstrated failure requires it:
  `.agents/skills/enforcing-flutter-standards/references/audit-contract.md`
- Modify only when a demonstrated failure requires it:
  `.agents/skills/enforcing-flutter-standards/references/repository-health-audit.md`
- Modify only when a demonstrated failure requires it:
  `.agents/skills/enforcing-flutter-standards/references/testing-quality.md`

**Interfaces:**

- Consumes: RH1, TQ1, the completed B1 guidance, and neighboring existing scenarios.
- Produces: fresh-context GREEN evidence, wording-variance evidence, minimal refinements, and regression evidence for existing audit behavior.

- [ ] **Step 1: Run RH1 and TQ1 with the completed skill**

Run each scenario in a fresh context through normal skill discovery. Do not name the skill in the prompt or reveal expected answers.

Expected:

- RH1.1-RH1.6 pass;
- TQ1.1-TQ1.4 pass;
- outputs contain exact evidence and no unsupported repository-health score.

Record responses verbatim and update each scorecard row.

- [ ] **Step 2: Micro-test the completeness matrix wording**

Use one no-B1-guidance control and the completed B1 guidance as two variants. Run each variant five times in a fresh context against a compact repository-health prompt containing one intentionally unavailable domain.

Score each response for:

1. all nine exact domains present;
2. only `inspected`, `not applicable`, or `unavailable`;
3. overall status is `partial`;
4. no numeric score;
5. no invented evidence.

Read every match manually. Treat different domain names, omitted rows, or inconsistent completeness status as variance failures even if the prose is otherwise reasonable.

- [ ] **Step 3: Run regression scenarios**

Run `S1`, `A1`, and a narrow changed-files audit in fresh contexts.

Expected:

- S1 remains read-only and waits for batch approval;
- A1 retains all existing finding and proposal fields;
- the narrow audit selects `change`, does not load or print the nine-domain matrix, and does not expand to the whole repository.

- [ ] **Step 4: Verify audit-time filesystem immutability**

For RH1, create a temporary synthetic workspace using inert credential-shaped data. Before evaluation, record paths, file hashes, sizes, and nanosecond timestamps. After evaluation, require an identical manifest.

Also require:

- no `reports/` or hidden artifact directory was created;
- no `.dart_tool/`, `build/`, generated file, dependency lock change, or SDK/FVM configuration change appeared;
- no fixture value appears in the evaluator output.

Delete only the temporary workspace after the evidence has been recorded.

- [ ] **Step 5: Apply only demonstrated refinements**

Classify each failure:

- omitted matrix field or domain: structural contract change;
- wrong profile selection: observable routing predicate;
- mutation despite understanding the rule: prohibition plus a rationalization counter;
- unsupported test-style mandate: conditional predicate or explicit neutral selection rule;
- missing reference retrieval: direct SKILL.md route.

Patch only the responsible file, rerun the failed scenario, and rerun one neighboring passing scenario. Do not add hypothetical rules.

- [ ] **Step 6: Commit verified refinements**

Run:

```bash
git add .agents/skills/enforcing-flutter-standards \
  skill-evals/enforcing-flutter-standards/scorecard.md
git commit -m "test: verify repository health audit behavior"
```

Expected: verbatim evaluation evidence plus only refinements justified by observed failures.

---

### Task 5: Update documentation and validate B1

**Files:**

- Modify: `docs/design.md:94-115,158-179,737-805`
- Modify: `README.md:45-87,192-228`
- Modify: `CHANGELOG.md:3-10`
- Validate: `.agents/skills/enforcing-flutter-standards/`
- Validate: `skill-evals/enforcing-flutter-standards/`

**Interfaces:**

- Consumes: verified B1 behavior and final file paths.
- Produces: accurate public/internal documentation, canonical changelog entry, structural validation, regression evidence, and a reviewable final diff.

- [ ] **Step 1: Update the design document**

Add a focused subsection defining:

- `change` as the default audit profile;
- `repository-health` as explicit-only;
- the nine-domain matrix and its three statuses;
- `complete`, `partial`, and `blocked`;
- no scores, remote rules, repository artifacts, or mutating environment setup;
- conditional loading of `testing-quality.md`.

Do not rewrite unrelated architecture decisions.

- [ ] **Step 2: Update the public README**

In the operating-modes section, distinguish:

- scoped change audit;
- explicit repository-health audit with a completeness matrix.

In the skill anatomy table, add links for:

- `references/repository-health-audit.md`;
- `references/testing-quality.md`.

In the evaluation section, mention RH1 and TQ1 without claiming perfect or universal behavior.

- [ ] **Step 3: Update the canonical changelog**

Under `Unreleased > Added`, add exactly:

```markdown
- Added an explicit repository-health audit profile with domain completeness and Flutter test-quality guidance.
```

Do not bump a version and do not create a changelog inside the skill.

- [ ] **Step 4: Validate Agent Skill structure**

Run:

```bash
python3 <skill-creator-root>/scripts/quick_validate.py \
  .agents/skills/enforcing-flutter-standards
```

Expected: exit `0`. If the helper cannot run because its own interpreter lacks an existing requirement, do not install anything silently; record the limitation and run:

```bash
test -f .agents/skills/enforcing-flutter-standards/SKILL.md
test -f .agents/skills/enforcing-flutter-standards/references/repository-health-audit.md
test -f .agents/skills/enforcing-flutter-standards/references/testing-quality.md
rg -n '^name: enforcing-flutter-standards$' \
  .agents/skills/enforcing-flutter-standards/SKILL.md
rg -n '^description: Use when .+' \
  .agents/skills/enforcing-flutter-standards/SKILL.md
```

- [ ] **Step 5: Verify reference reachability and compactness**

Run:

```bash
wc -l .agents/skills/enforcing-flutter-standards/SKILL.md
rg -n "references/(engineering-standards|audit-contract|repository-health-audit|testing-quality|ui-implementation|standalone-workflow|superpowers-integration)\\.md" \
  .agents/skills/enforcing-flutter-standards/SKILL.md
test "$(find .agents/skills/enforcing-flutter-standards -name README.md \
  -o -name CHANGELOG.md -o -name INSTALLATION_GUIDE.md | wc -l | tr -d ' ')" = "0"
```

Expected:

- `SKILL.md` is below 500 lines;
- all seven references are directly reachable;
- no auxiliary documentation was added inside the deployable skill.

- [ ] **Step 6: Run existing deterministic regression checks**

Run:

```bash
dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
git diff --check
```

Expected:

- inspector suite exits `0` with all cases passing;
- whitespace validation exits `0`;
- no Dart source changed.

- [ ] **Step 7: Review scope and content integrity**

Run:

```bash
git status --short
git diff --stat
git diff -- .agents/skills/enforcing-flutter-standards \
  skill-evals/enforcing-flutter-standards \
  docs/design.md README.md CHANGELOG.md
rg -n "score|weighted|FVM|flutter clean|pub get|live GitHub|reports/" \
  .agents/skills/enforcing-flutter-standards/references/repository-health-audit.md \
  .agents/skills/enforcing-flutter-standards/references/testing-quality.md
```

Expected:

- only the B1 source, evaluation evidence, documentation, changelog, and this plan differ;
- forbidden mechanisms appear only in explicit rejection/read-only boundary language;
- no inspector, dependency, generated output, or `agents/openai.yaml` change exists.

- [ ] **Step 8: Request independent review**

Have a fresh reviewer perform two passes:

1. compare the diff against this B1 plan and the existing audit contract;
2. review skill clarity, progressive disclosure, trigger coverage, and potential contradictions.

Fix only evidence-backed findings and rerun the affected scenario plus Steps 4-7.

- [ ] **Step 9: Commit documentation and release-ready B1**

Run:

```bash
git add README.md CHANGELOG.md docs/design.md \
  docs/superpowers/plans/2026-07-29-repository-health-audit-b1.md
git commit -m "docs: document repository health audit profile"
```

Expected: a documentation-only final commit after the behavioral commits, with no push or publication.

## Acceptance Criteria

- An ordinary audit still defaults to changed files and direct dependencies.
- An explicit full/health request selects `repository-health`.
- Every repository-health audit reports all nine domains with one allowed status and an evidence/limitation record.
- Any unavailable domain makes the audit partial; unresolved root/scope/safe-inspection boundaries make it blocked.
- Repository-health audits never assign a numeric score.
- Audits do not modify the project, write artifacts into it, fetch remote standards, align SDKs, install/resolve dependencies, generate, format, clean, build, migrate, or expose secrets.
- Test-quality reviews identify demonstrated weak fault detection, nondeterminism, shared state, mock-only assertions, and implementation-detail coupling without imposing universal syntax or libraries.
- Existing audit findings, severities, scope classifications, proposal batches, approvals, and secret-safe output remain unchanged.
- RH1, TQ1, S1, A1, and the narrow change-audit regression have fresh recorded results.
- The existing inspector suite and structural validation pass.
- README, design documentation, and changelog match the implemented behavior.

## Plan Self-Review

- B1 is one coherent subsystem: audit-profile routing plus the domain and test-quality contracts it needs.
- B2 inspector expansion and machine-readable evaluation manifests are absent.
- Every production skill edit follows an observed behavioral RED.
- The nine domain names and three status names are identical in every task.
- The plan preserves progressive disclosure by adding two conditional references instead of expanding `SKILL.md` with detailed rules.
- Every created or modified file has one explicit responsibility.
- No placeholder, dependency change, hidden migration, score, or mutating audit step remains.
