---
name: enforcing-flutter-standards
description: Use when auditing, creating, refactoring, debugging, or reviewing Flutter and Dart applications where architecture, Bloc or Cubit state, Freezed models, local packages, UI fidelity, dependencies, tests, or verification need consistent engineering standards.
---

# Enforcing Flutter Standards

## Overview

Use this skill as the portable orchestrator for evidence-backed Flutter and
Dart audits, proposals, implementations, refactors, debugging, and reviews.
Apply project instructions and coherent existing conventions before these
standards, keep detailed decisions in the bundled references, and respond in
the user's language.

## Non-negotiable gates

- Inspect the project and relevant scope before proposing any solution.
- Audit mode is read-only: do not edit, generate, format, stage, commit,
  install, migrate, rotate, revoke, or otherwise change project or external
  state.
- Enter implementation mode only after explicit approval of the exact requested
  scope or named proposal batches. Approval to audit or review is not approval
  to implement.
- For new or changed behavior, observe a focused test fail for the expected
  missing-behavior reason (RED) before writing behavior implementation or
  entering GREEN. For an uncovered refactor, establish passing
  characterization tests first; do not call that RED unless changed behavior
  actually failed. For generated code, documentation, configuration without
  logic, or purely visual work without testable behavior, record the applicable
  no-test predicate and its non-test validation before GREEN.
- Never invent, draw, generate, approximate, or silently substitute a UI asset.
  A missing exact custom asset blocks only its dependent fragment.
- Never add or update a dependency without presenting a comparison required by
  the engineering standards and obtaining explicit approval.
- Never claim completion without fresh, applicable verification evidence.
- For approved implementation, update the existing canonical changelog with one
  concise entry following project convention. Do not create a missing changelog
  unless explicitly approved or required by an applicable project rule.
- Never expose, reproduce, transform, or partially reveal a detected secret
  value; report only its kind, location, exposure path, and recommended action.

## Discover the project

Before scoping or proposing, inspect applicable instructions, repository root,
Git status and relevant diff or commits, `pubspec.yaml` files and lockfiles,
`analysis_options.yaml`, architecture documentation, `lib/`, `test/`,
`packages/`, CI and project command sources, generated-file policy, assets,
flavors, changelogs, validation commands, and established conventions.

When filesystem and Dart access are available, run the bundled read-only
inspector:

```text
dart run <skill-directory>/scripts/inspect_flutter_project.dart --root <project-directory> --format json
```

Treat its deterministic inventory as mechanical evidence, not an architectural
verdict. Confirm relevant observations in source. When filesystem or Dart
access is unavailable, perform the same discovery manually and read-only from
the evidence available; record what could not be inspected. Stop before a
proposal when the root, governing instructions, material scope, or required
evidence remains unresolved.

Default an audit to changed files and their direct dependencies. A repository-
wide audit requires an explicit request.

## Select the operating mode

- **Audit:** Use for audits, assessments, and refactor proposals. Inspect and
  report only; never mutate. End with independently approvable named batches
  and wait for explicit approval.
- **Implementation:** Use only when the user explicitly requests a concrete
  implementation scope or approves named batches. Restrict changes to that
  approved boundary and return to approval if new scope, a dependency,
  migration, design deviation, exception, destructive action, or external
  action becomes necessary.
- **Review:** Use for diffs, commits, pull requests, or review feedback. Inspect
  and report only; never mutate. If the user asks to apply feedback, first
  establish explicit implementation approval and switch to Implementation
  mode.

Ambiguous requests remain read-only until the mode and approval boundary are
explicit. Audit or Review mode cannot transition itself into mutation.

## Load references

Load only the detailed guidance needed for the current request:

1. Always read `references/engineering-standards.md`.
2. For an audit, refactor proposal, or review, also read
   `references/audit-contract.md`.
3. For any UI or design task, also read
   `references/ui-implementation.md`.
4. Discover whether Superpowers is actually available. When it is discoverable,
   read `references/superpowers-integration.md` and use only the mapped skills
   confirmed available. If Superpowers is absent, or an applicable mapped skill
   is missing, read and follow `references/standalone-workflow.md` for the whole
   request.

The Flutter gates in this skill and `references/engineering-standards.md`
remain binding in either process.

## Audit mode

Keep every inspection action read-only and distinguish inspector inventory from
architectural judgment. Use `references/audit-contract.md` exactly: classify
scope as current change or future debt, use its severities, and include every
required finding field with reproducible evidence. For a suspected secret,
never include its value.

End with small named batches that state findings addressed, boundaries or files,
tests or characterization coverage, verification, changelog work, dependencies
between batches, and every separate decision or approval needed. Do not turn
future debt into scope. Stop and wait for explicit approval of named batches.

## Implementation mode

Restate the explicitly approved boundary and preserve coherent project
architecture. Diagnose before changing a bug; define the smallest compliant
design before editing. Resolve applicable Flutter outputs explicitly, including
owned vendor boundaries, exact design-asset disposition, retained primary
persistence and migration approval, state semantics, lifecycle ownership, and
acyclic dependency direction.

Follow the discovered Superpowers composition or the full gate sequence in
`references/standalone-workflow.md`. For behavior, observe RED, implement the
minimum GREEN change, then REFACTOR while green. For uncovered refactors, keep
characterization tests passing before and after. For an allowed no-test
predicate, record it and perform the applicable non-test validation. Review the
complete diff and status before verification; stop if any change is unexplained,
unsafe, unrelated, or unapproved.

If implementation reveals missing evidence or an approval boundary, stop,
report it, and return to the relevant earlier gate instead of expanding scope.

## Review mode

Apply `references/audit-contract.md` to the requested diff, commit, pull
request, or feedback and its direct dependencies. Report actionable findings
first with exact locations, observed evidence, impact, smallest correction, and
current-change or future-debt classification. Verify claims with available
read-only commands and identify missing evidence.

Do not edit while reviewing. If a correction is requested, present or confirm
the named implementation boundary, obtain explicit approval, then switch to
Implementation mode and apply its RED/characterization/no-test and verification
gates.

## Verification and reporting

Run fresh project-defined gates applicable to the approved scope: format,
analysis or lint, code generation, affected tests, full suite, coverage,
generated-file consistency, and relevant builds. Repeat applicable gates in
every modified local package and affected direct dependent. A partial check is
not evidence that an unrun gate passed; state every skipped validation and its
reason. Any later implementation change invalidates earlier verification.

After fresh verification, update the existing canonical changelog concisely as
required by project convention. If none exists, report that fact and obtain
explicit approval before creating one; never bump versions automatically.

Report in the user's language with the applicable contract from
`references/audit-contract.md` or `references/standalone-workflow.md`. Include
approved scope, tests and observed RED or the precise characterization/no-test
predicate, exact commands and actual results, changelog disposition, skipped
validations with reasons, exceptions with approval, and remaining approved work
versus future debt. Do not overstate visual fidelity or completion.

## Red flags

Each phrase below has exactly one correction:

| Pressure or rationalization from the baseline | Correction |
|---|---|
| “The problems are obvious,” “refactor everything immediately,” or “a release slot in 40 minutes.” | Stop; return to the Audit and approval gates; obtain scoped evidence and explicit approval for named batches. |
| “It works,” “Working,” “I manually verified it,” or manual inspection is enough under release pressure. | Stop; return to the RED and Verification gates; obtain the missing observed test and fresh command evidence. |
| “Deleting working code is wasteful,” “keep it as reference,” or the existing effort is a sunk cost. | Stop; return to the RED gate; obtain the required observed RED, or passing characterization/no-test predicate evidence as applicable. |
| “A senior developer mandates Cubit because Bloc is too verbose,” or senior approval makes the shortcut safe. | Stop; return to the evidence and approval gates; obtain observable state-semantics evidence and explicit approval for any expanded migration. |
| “A visually similar Material icon exists” or use it “temporarily.” | Stop; return to the exact-asset gate; obtain the original custom SVG or explicit approval for a material design change. |
| Import the vendor SDK from both Cubits because it is the “quickest change” or the manager wants the “fastest implementation.” | Stop; return to the architecture and approval gates; obtain evidence and approval for the owned adapter/package boundary and acyclic dependency direction. |
| Add Drift “only for this feature,” follow another team's preference, or take another unreviewed dependency or persistence shortcut. | Stop; return to the dependency and persistence approval gates; obtain the full comparison and explicit technology or migration approval. |
