# Report contracts

Load this reference only to render a formal audit report or final
implementation report in the report phase, after evidence, classifications,
implementation, verification, and changelog disposition applicable to the
task are complete. A normal response from any earlier phase does not activate
this reference. Use the user's language and observed results only.

## Audit or review report

Present actionable findings first, ordered by severity and dependency. Use the
exact finding fields defined by the audit phase. Then report:

```markdown
## Scope and evidence

Inspected boundary, direct dependencies, commands, unavailable evidence.

## Findings

Complete findings, or an evidence-backed statement that none were identified.

## Proposed batches

Independently approvable named batches with every required field.

## Approval status

Read-only disposition and exact batches awaiting approval.

## Future debt

Observations outside current-change scope, or None when supported.
```

Do not imply that audit approval authorizes implementation.

## Implementation report

Use these headings in order:

```markdown
## Outcome

Complete, partial, or blocked; observable result.

## Approved scope implemented

Named batches, exact files/boundaries, and approved exception records.

## Tests written and observed RED

Behavior: test, exact RED command/reason, GREEN and refactor result.
Refactor: passing pre/post characterization evidence, without invented RED.
No-test: exact predicate and alternative validation.

## Commands executed and actual results

Each command, scope, exit status, result, package/dependent coverage.

## Changelog entry

Canonical path, category and exact entry, or approved disposition.

## Skipped validation with reason

Every relevant skipped gate and concrete reason; None only when supported.

## Remaining approved or future debt

Separate unfinished approved work, future debt, and unapproved proposals;
None only when inspected evidence supports it.
```

Do not claim completion without fresh applicable verification. Keep the final
report concise while retaining every required evidence slot.
