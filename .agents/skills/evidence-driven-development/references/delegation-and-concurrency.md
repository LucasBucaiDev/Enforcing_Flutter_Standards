# Delegation and concurrency

Use this reference only after selecting the route and loading any justified
current-phase contract. If none applies yet, this may be the first reference.
Delegation distributes bounded work inside that phase; it never advances or
parallelizes phases. The coordinator retains the route record, root-cause
synthesis, plan and revisions, approval interaction, contradiction resolution,
diff integration, final verification, and report.

## Decide whether to delegate

Delegate only when agent capacity is available and at least two independent lines
have an expected benefit greater than their coordination cost. Otherwise work
locally. Prefer read-only inspections, hypothesis discriminators, alternative or
impact research, and independent non-mutating verification gates.

Create every handoff with this complete contract:

```text
Task: stable identifier
Phase: current phase
Purpose: one bounded question or outcome
Access: read-only | mutation
Scope: exact files, symbols, systems or commands
Required evidence: reproducible facts and return artifacts
Dependencies: task identifiers or none
Prohibited actions: explicit boundaries
Stop conditions: conflicts, ambiguity or missing authority
Return: observations, commands/results, conflicts and missing evidence
```

A subagent cannot expand scope, infer approval, decide the definitive root cause,
integrate work, or report completion. It must not redelegate unless the task
contract explicitly authorizes it. Mark returned facts as delegated evidence and
preserve their task identity, commands, results, conflicts, and missing evidence.

## Apply phase boundaries

- Inspect: distribute independent architecture, test, configuration, dependency,
  and convention discovery; synthesize once in the coordinator.
- Diagnose: distribute hypothesis discriminators; contradictory results remain
  unresolved evidence until the coordinator obtains a new discriminating fact.
- Design: distribute read-only alternative or impact analysis; the coordinator
  authors one revisioned plan.
- Approve: only the coordinator records user approval.
- Implement: retain separate RED–GREEN–REFACTOR evidence for each behavior.
- Verify: distribute only independent non-mutating gates; the coordinator reviews
  provenance, the aggregated diff, and all critical results.
- Report: only the coordinator synthesizes the outcome.

## Protect mutations and integration

Permit parallel mutation only with demonstrated isolation: separate worktrees or
proven disjoint boundaries with no shared files, APIs, generated outputs, lockfiles,
or mutable systems. Treat shared lockfiles or generated outputs as non-isolated.
Without that evidence, serialize mutations in the integration order.

Serialize formatting, code generation, dependency resolution, and other
mutation-capable gates. After each integration or mutating gate, review the
aggregated diff. Any later change invalidates affected gates; rerun them before
completion. Contradictory results are evidence gaps, not majority decisions.

Stop a delegated task on a boundary conflict, ambiguous ownership, missing
authority, unexpected dependency, overlapping mutation, or evidence that makes
its assumptions stale. The coordinator resolves the conflict or returns to the
appropriate earlier gate without broadening approval.
