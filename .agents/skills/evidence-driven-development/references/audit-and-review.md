# Audit and review

Use this reference for audits, assessments, refactor proposals, code review,
or incoming review feedback. Remain read-only: do not edit, generate, format,
stage, commit, install, migrate, rotate, revoke, or change external state.

## Scope and evidence

Unless the user defines another boundary, inspect changed files and their
direct dependencies: immediate APIs, configuration, tests, generated inputs or
outputs, local packages, and consumers needed to judge the change. A full
repository audit requires an explicit request. Keep unrelated observations as
future debt.

Evaluate review feedback against code and runtime evidence, not authority.
Distinguish mechanical inventory from architectural judgment. Never reproduce
or transform a secret value; report only kind, location, exposure path, and
recommended authorized action.

Treat explicit user-supplied diff or command facts as supplied evidence and
label them as such. Do not claim independent verification, but do not discard
those facts merely because the synthetic or remote artifact is not mounted.

Classify scope exactly as `current change` or `future debt`. Use severities:

- `blocking`: unsafe or incorrect delivery, mandatory-rule violation, missing
  evidence, secret exposure, or missing tests for changed behavior;
- `important`: material architecture, lifecycle, security, reliability,
  maintenance, or testability issue not proven blocking;
- `improvement`: bounded evidence-backed enhancement not required for safety.

## Required finding

Every finding must contain:

```text
Severity: blocking | important | improvement
Location: exact path/line, symbol, edge, or command scope
Evidence: observed fact and reproducible source
Impact: concrete technical, product, security, or delivery consequence
Recommendation: smallest compliant correction or decision
Scope classification: current change | future debt
```

Do not report speculation as a finding. State additional evidence needed.
Do not infer behavior behind an
opaque callback, uninspected consumer, or missing direct dependency; record
the absent evidence as an explicit limitation.
An uninspected lifecycle owner or callback consumer is a limitation, not
evidence of missing cleanup or cancellation.
When no finding is supported, name the inspected scope and sources rather than
substituting generic praise.

After evidence is complete, proposals use the named-batch contract from the
design phase and await explicit approval. Do not mutate from review feedback
until its technical validity, impact, and approved correction boundary are
established.

Keep report formatting deferred until findings and classifications are
complete. Stop on ambiguous scope, unreadable required evidence, contradictory
facts, or any action that would violate the read-only boundary.

## Completeness closure

Contrast each in-scope file with every applicable rule.
Do not stop after the first finding. Track each applicable area to a
supported finding, supported absence, or explicit limitation; missing evidence
is a limitation, not an absence. Recompute coverage when inspected evidence
activates another rule. Do not declare the scope resolved while any
material verification remains pending.
One finding may cover multiple applicable areas only when its
evidence, impact, and recommendation dispose each area; otherwise separate them.
