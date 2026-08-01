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
Plan revision: immutable identifier
User-visible objective: observable result
Current evidence: facts supporting the design
Observable acceptance criteria: numbered completion predicates
Implementation map: location/symbol, exact change, and reason
Execution sequence: ordered steps and dependencies
Execution topology:
  coordinator: owner
  delegated tasks: identifiers or none
  isolation: evidence or serial
  integration order: ordered task identifiers
  final verification owner: coordinator
Test matrix: behavior, test, baseline, RED/GREEN or no-test predicate
Verification: project gates and direct dependents
Risks and recovery: concrete risk and safe response
Separate decisions/approvals: dependencies, migrations, exceptions,
  destructive/external actions, or none
Excluded/future debt: explicit boundary
Changelog: canonical entry/category or disposition
```

Order batches by blocking prerequisites and dependency direction. Do not
combine unrelated work to make approval all-or-nothing. A material unknown
blocks requesting approval.

A material change modifies the objective, acceptance criteria, implementation
map or boundaries, sequence, test strategy, dependencies, risks and recovery,
or exclusions. Increment the plan revision and invalidate its prior approval.
Non-material details may clarify the approved text only when they do not alter
behavior or expand its mutation boundary.

## Approval gate

Record explicit approval as `Batch + Plan revision` and translate the approved
implementation map into the exact mutation boundary. Approval by batch name
alone, audit approval, urgency, authority, prior effort, or “fix everything”
does not approve implementation. Separate approvals remain required for every
dependency, migration, exception, destructive action, or external action.

Stop when scope is materially ambiguous, the design lacks required evidence,
the proposal omits a field, or a separate decision remains unresolved. Load
test-first guidance only after an implementation batch and its exact plan
revision are explicitly approved.
