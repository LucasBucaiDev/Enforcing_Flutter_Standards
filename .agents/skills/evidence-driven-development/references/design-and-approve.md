# Design and approval

Use this reference when evidence supports choosing a direction, bounding work,
or obtaining approval. Do not implement in this phase.

## Define the smallest design

State the requested outcome, current evidence, expected observable behavior,
files or boundaries likely to change, direct dependencies, tests, verification
impact, and excluded work. Preserve coherent project architecture and reuse
existing abstractions when suitable.

Compare alternatives only when a real decision exists. Evaluate them against
the observed problem, dependency direction, operational risk, maintenance,
reversibility, and project convention. A new dependency, technology or data
migration, destructive action, external action, or broad restructure requires
its own evidence-backed comparison and explicit approval.

Define responsibilities, public boundaries, data and control flow, failure
semantics, lifecycle ownership, compatibility, and migration only to the
degree demanded by the scoped evidence. Do not turn unrelated debt into the
current design.

## Propose approvable batches

Create small named batches that can be reviewed and approved independently.
Each batch must state:

```text
Batch: stable name
Outcome and exact scope: behavior or structure delivered
Files/boundaries: exact expected locations
Tests/characterization: RED, characterization, or exact no-test predicate
Separate decisions/approvals: dependencies, migrations, exceptions,
  destructive/external actions, or none
Verification: applicable project gates and direct dependents
Changelog: canonical path and planned entry/category, or disposition
Dependencies on batches: names or none
Excluded/future debt: explicit boundary
```

Order batches by blocking prerequisites and dependency direction. Do not
combine unrelated work to make approval all-or-nothing.

## Approval gate

Record explicit approval by batch name and translate it into an exact mutation
boundary. Audit approval, urgency, authority, prior effort, or “fix everything”
does not approve implementation. Separate approvals remain required for every
dependency, migration, exception, destructive action, or external action.

Stop when scope is materially ambiguous, the design lacks required evidence,
the proposal omits a field, or a separate decision remains unresolved. Load
test-first guidance only after an implementation batch is explicitly approved.
