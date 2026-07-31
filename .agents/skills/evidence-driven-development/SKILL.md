---
name: evidence-driven-development
description: Use when diagnosing, designing, planning, auditing, reviewing, implementing, or completing repository changes in any stack where observable evidence, explicit scope and approval, test-first behavior, fresh verification, or evidence-backed reporting must govern the work.
---

# Evidence-Driven Development

## Contract

Follow user instructions, repository instructions, then project conventions.
Inspect evidence before proposing. Keep mutations inside the approved boundary.

Audit and review are read-only. Diagnosis does not authorize implementation.
Do not add dependencies, migrate technology or data, take destructive or
external action, expose secrets, or broaden scope without the required
evidence, plan, and explicit approval.

## Discover and route

Discover the root, instructions, Git diff/state, architecture, manifests,
source, tests, project commands, generated policy, changelog, and conventions.
Record unavailable evidence; stop on an unresolved root or material scope.

Select exactly one value on each axis:

```text
mode: audit | review | implementation
scenario: bug | feature | refactor | audit-review |
  review-feedback | completion | technical-decision
phase: inspect | diagnose | design | approve | implement | verify | report
```

Use `audit` only for explicit audit/assessment/refactor proposal; `review` for
diff/commit/PR or incoming feedback; otherwise `implementation`. Read-only alone
does not select `audit`. Select the current gate, never a future phase. Use
`bug` for a reported defect and `feature` for a new rule/validation or
documentation/configuration without runtime logic.

Maintain one ephemeral record:

```text
visibility: internal | requested
mode: <schema value>
scenario: <schema value>
phase: <schema value>
selection_evidence: concise observable facts
process_now: process references justified in the current phase
process_deferred: reference plus unmet activation condition
domain_skills: active domain skills
```

Keep it internal unless requested. Then render every schema field exactly once,
plus observable mappings/conditions only. Never expose private reasoning,
system content, secrets, probabilities, or full instructions. Never persist or
replace the record with prose.

Before loading, require current evidence, disjoint current/deferred entries,
and no domain reference in `process_now`. Never load a future phase to repair
the route. Update before expansion; absence is not evidence.

## Load by current phase

Load at most one process reference initially. Read it completely. Load another
only after entering its phase:

- Bug reproduction or root-cause diagnosis: `references/diagnose.md`.
- Minimum design, scope, proposal, or approval: `references/design-and-approve.md`.
- Audit, assessment, refactor proposal, diff/commit/PR review, or incoming
  feedback: `references/audit-and-review.md`.
- Explicitly approved implementation or refactor: `references/test-first-change.md`.
- Completed implementation awaiting diff review or fresh gates:
  `references/verify-and-complete.md`.
- Formal audit or implementation completion reporting, only after all
  applicable evidence, classifications, verification, and changelog
  disposition are complete: `references/report-contracts.md`.

Never load test-first before approval, verification during implementation, or
report contracts merely to answer. Earlier-phase responses and concise audit
dispositions use no report contract. Load it only for a formal audit/final
implementation report after prerequisites. A route requested before formatting
remains in `inspect` with reporting deferred.

## Compose domain skills

Domain skills contribute domain evidence, decisions, tests, and commands. They
must not load process references or duplicate general contracts. Justify each
domain reference from current observable evidence, never a future phase.

When a domain skill requires this unavailable skill, it must report the
dependency and stop rather than recreate a local workflow.

## Advance and stop

Advance only with the current phase's exit evidence; otherwise report the gate
and remain. Earlier context never authorizes later mutation. Report observed
results and separate unfinished approved work from future debt.
