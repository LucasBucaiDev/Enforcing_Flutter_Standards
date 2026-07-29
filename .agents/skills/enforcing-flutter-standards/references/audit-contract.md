# Flutter audit contract

Use this contract for Flutter and Dart audits, refactor proposals, and reviews.
Apply the repository instructions and
`references/engineering-standards.md` before classifying findings.

## Audit boundary and scope

An audit is read-only. Inspection may read files, Git history and diffs, run
read-only inventory or validation commands, and collect reproducible evidence.
It must not edit, generate, format, stage, commit, install, migrate, rotate,
revoke, or otherwise change project or external state.

Unless the user explicitly defines another scope, inspect:

1. changed files; and
2. their direct dependencies.

Direct dependencies include the immediate code, public APIs, local packages,
configuration, tests, generated inputs or outputs, and consumers needed to
evaluate the changed files without expanding into a repository-wide review.
A full audit is allowed only when the user explicitly requests it. If the
requested boundary is ambiguous in a way that could materially expand the
audit, stop and ask for a scope decision.

Classify every finding with exactly one of these values:

- `current change`: the issue is introduced, modified, relied on, or required
  for safe completion by the scoped change.
- `future debt`: the issue is observed outside the necessary current-change
  correction and is not authorization to modify it.

Do not convert future debt into implementation scope. A touched file does not
automatically authorize unrelated cleanup within that file.

## Severity

Use exactly these severities:

- `blocking`: implementation or delivery must not proceed because the current
  change would violate a mandatory rule, lacks evidence required for safe
  completion, exposes sensitive data, or can produce incorrect behavior. A
  missing test for new or changed behavior is always `blocking`.
- `important`: a material architecture, maintainability, lifecycle, security,
  reliability, or testability problem needs a planned correction, but the
  available evidence does not make it a blocker for the current change.
- `improvement`: a bounded, evidence-backed enhancement would improve the
  result but is not required for correctness or compliance.

Severity and scope classification are independent. For example, an important
finding may be either `current change` or `future debt`. Do not label
speculative risks as findings; state what additional evidence is needed.

## Required finding shape

Every finding must contain all of these fields:

```text
Severity: blocking | important | improvement
Location: exact file and line, symbol, dependency edge, or command scope
Evidence: directly observed fact and its reproducible source
Impact: concrete technical, product, security, or delivery consequence
Recommendation: smallest compliant correction or decision
Scope classification: current change | future debt
```

`Location` should use an exact path and line when available. `Evidence` must
distinguish tool inventory from the agent's architectural judgment and cite the
relevant import, declaration, configuration, diff, command, or test result.
`Impact` must explain why the observation matters. `Recommendation` must be
specific enough to become a named proposal batch without silently authorizing
implementation.

Do not include generic praise, filler, or unsupported assertions. If no finding
is supported, report the scope and evidence inspected and state that no finding
was identified in that scope; do not replace evidence with “looks good.”

## Secret-safe findings

Never reproduce, partially reveal, transform, or place a detected potential
secret value in output. A potential secret finding must report:

- file and exact location;
- secret kind, such as API key, token, credential, signed URL, or webhook;
- required response action, such as remove from versioned content, redact the
  log source, and coordinate authorized rotation or revocation.

The normal six finding fields remain mandatory. Describe only the secret kind,
location, exposure path, and action. Rotation, revocation, deletion from remote
history, or any other external or destructive response requires separate
explicit authorization.

## Proposals and approval

After the findings, propose small, named batches that are independently
approvable, implementable, testable, and reversible where practical. Each
batch must name:

- findings addressed and exact scope;
- files or boundaries expected to change;
- behavior tests or characterization tests required;
- dependency, migration, design, security, or external-action decisions that
  need separate approval;
- relevant verification and changelog work;
- dependencies on other proposed batches.

Every proposed batch must contain every field below explicitly:

```text
Batch: <name>
Findings and exact scope: <exact finding IDs and current-change or future-debt
  scope>
Files/boundaries: <exact list>
Tests/characterization: <specific RED, characterization, or no-test predicate
  and coverage>
Separate decisions/approvals: <each dependency, migration, technology,
  security or external action, design, package extraction, or exception
  decision, or none>
Verification: <applicable format, analysis, codegen, tests, coverage,
  generated consistency, build, package, and direct-dependent gates>
Changelog: <canonical path and planned entry/category, or the evidence-backed
  reason no entry applies>
Dependencies on batches: <named batches or none>
```

A batch is invalid if any field is omitted. Do not infer a field from another
batch or from the general report. Do not combine unrelated future-debt
findings merely because they share severity or lie outside the current change;
keep persistence migration, observability or secret remediation, and
environment configuration in separate approval boundaries unless one is an
observed prerequisite of another.

When a finding or batch addresses missing or unsafe environment configuration
or a silent production fallback, its recommendation or output is incomplete
unless it explicitly names `development`, `staging`, and `production`; typed
configuration and selection; startup validation that fails actionably; and
tests for missing, invalid, and valid values. This conditional completeness
rule does not add environment fields to unrelated findings or batches.

Order batches by blocking risk and dependency direction, then important work,
then optional improvements. Do not combine unrelated current-change work and
future debt to make approval all-or-nothing.

Implementation begins only after the user gives explicit approval for one or
more named batches. General urgency, “fix everything,” prior implementation
effort, or approval to perform the audit is not implementation approval. Until
approval is recorded, remain read-only.

## Complete finding example

The following is illustrative and shows the required shape without asserting
that these files exist in the audited project:

```text
Severity: blocking
Location: packages/api_client/pubspec.yaml:18 and
  packages/auth_repository/pubspec.yaml:21; dependency edges
  api_client → auth_repository → api_client
Evidence: The read-only inspector reported the directed cycle
  ["api_client", "auth_repository", "api_client"]. The two cited path
  dependencies reproduce those edges, and auth_repository is already consumed
  by api_client for token access.
Impact: Neither package is a lower stable boundary. The cycle prevents a
  directed package architecture, couples HTTP infrastructure upward to the
  auth repository, and makes isolated resolution, testing, and replacement
  unsafe.
Recommendation: Introduce a small token/session provider contract at a lower
  stable boundary. Let auth_repository implement it and inject it into
  api_client, then remove the api_client → auth_repository edge and rerun the
  package-cycle check plus tests for both packages and their direct dependents.
  Treat any new package extraction as a separately named package decision.
Scope classification: current change
```

## Example audit summary and implementation order

```text
Audit scope: changed package manifests and their direct dependents.
Evidence sources: scoped Git diff, the two manifests named above, and the
read-only package-graph inventory.
Findings: 1 blocking, 0 important, 0 improvement.
Current change: the blocking package cycle.
Future debt: none supported by the inspected evidence.

Proposed implementation order:
1. B1 — Restore acyclic token dependency direction.
   Scope: the lower token/session contract, auth_repository implementation,
   api_client injection, affected manifests, focused boundary tests, direct
   dependent tests, cycle verification, and the existing canonical changelog.
   Approval needed: explicit approval of B1; separate approval if the contract
   requires a new package or dependency.

Implementation status: not started. The audit remains read-only while waiting
for explicit approval of B1.
```
