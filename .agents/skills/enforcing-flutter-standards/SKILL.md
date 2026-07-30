---
name: enforcing-flutter-standards
description: Use when auditing, creating, refactoring, debugging, or reviewing Flutter and Dart applications where architecture, Bloc or Cubit state, Freezed models, local packages, UI fidelity, dependencies, test-first fixes to legacy or untested code, or verification need consistent engineering standards.
---

# Enforcing Flutter Standards

## Core contract

Follow explicit user instructions. Repository and nested directory
instructions, then coherent existing project conventions, outrank this skill.
Inspect relevant evidence before proposing a solution.

- Audit and Review modes are read-only: do not edit, generate, format, stage,
  commit, install, migrate, rotate, revoke, or change project or external
  state.
- Implementation requires an explicitly requested concrete scope or explicit
  approval of named proposal batches. Audit or review approval is not
  implementation approval.
- New or changed behavior requires an observed focused RED failure for the
  expected missing-behavior reason. An uncovered refactor requires passing
  characterization tests first. Allowed non-behavior work records its exact
  predicate and applicable non-test validation.
- Never invent, draw, generate, approximate, or silently substitute a custom
  asset. A missing exact asset blocks only its dependent fragment.
- Adding or updating a dependency, or performing a technology or data
  migration, requires an evidence-backed comparison and explicit approval.
- Never reveal, reproduce, transform, or partially expose a secret value.
  Report only its kind, location, exposure path, and recommended action.
- Completion requires fresh applicable verification and one concise entry in
  the existing canonical changelog. Do not create a missing changelog or bump
  a version without explicit approval.
- Every exception record names the rule, observation, technical reason, impact,
  and explicit approval.

## Discover and select a mode

Before scoping, inspect applicable instructions, repository root, Git state and
relevant diff, package manifests and lockfiles, analysis configuration,
architecture documentation, source, tests, local packages, CI and project
commands, generated-file policy, assets, flavors, changelogs, validation
commands, and established conventions.

When filesystem and Dart access are available, start with the bundled read-only
inspector:

```text
dart run <skill-directory>/scripts/inspect_flutter_project.dart \
  --root <project-directory> --format summary
```

Summary counts are mechanical evidence, not architectural findings. Confirm
relevant observations in source and expand only evidence-supported sections;
section arguments are repeatable:

```text
dart run <skill-directory>/scripts/inspect_flutter_project.dart \
  --root <project-directory> --format json \
  --section packageEdges --section cycles
```

When filesystem or Dart access is absent, perform the same discovery manually
and read-only from available evidence, and record what could not be inspected.

Select exactly one mode:

- **Audit:** assess or propose refactors; report only and wait for approval.
- **Review:** inspect a diff, commit, pull request, or feedback; report only.
- **Implementation:** change only the explicitly requested scope or approved
  named batches.

Concrete implementation preparation takes precedence over generic assessment
phrasing. A request naming a new or changed field, query, behavior, or focused
bug boundary remains Implementation preparation even when it asks only for a
direction, smallest-fix proposal, or approval boundary. Its proposal stage
remains read-only; follow the applicable Bug or New feature composition and
load `references/quality-and-delivery.md` plus only evidence-supported
thematic references. Formal Audit routing requires an explicit audit, broad
assessment, refactor proposal, or review request.

Treat a focused technical or architecture choice as read-only Implementation
preparation when the user does not request inspection or assessment of
existing code, a diff, or a refactor. Load only the thematic references
directly supported by that decision.

Ambiguous requests remain read-only. Default Audit and Review to changed files
and their direct dependencies; inspect the whole repository only when
explicitly requested.

## Compose one workflow

Discover the available Superpowers skills without assuming them. If every
skill required by the applicable scenario is available, load
`references/superpowers-integration.md` and follow only that composition. If
any required skill is absent, load `references/standalone-workflow.md` for the
whole request. Never combine the standalone workflow with a partial
Superpowers route.

## Route Flutter references

Load every row supported by observable task or project evidence, and load none
merely because it exists. References are independent and one level deep.

| Observable task or evidence | Load |
|---|---|
| audit, assessment, refactor proposal, diff/commit/PR review | `references/audit-contract.md`; defer `references/audit-report-template.md` until formatting |
| architecture, domain, Cubit/Bloc, Freezed, barrels, imports, large files | `references/architecture-and-state.md` |
| packages, dependency graph, SDK/plugin, lifecycle, dependency proposal | `references/packages-and-integrations.md` |
| HTTP, API, DTO mapping, exceptions, failures, typed results | `references/networking-and-errors.md` |
| preferences, secure local values, Hive, Drift, ObjectBox, migration | `references/persistence.md` |
| Navigator, routes, deep links, URL state, redirects | `references/navigation.md` |
| logging, crash reporting, secrets, flavors, configuration | `references/security-and-environments.md` |
| implementation, refactor, tests, coverage, verification, delivery | `references/quality-and-delivery.md` |
| screen, widget, screenshot, Figma, responsive, accessibility, asset | `references/ui-implementation.md` |

## Audit and review

Apply `references/audit-contract.md` and all evidence-supported thematic
references without mutation. Distinguish mechanical inventory from
architectural judgment, classify current change versus future debt, and use
the required finding fields and secret-safe reporting.

End an Audit with small independently approvable named batches and wait for
explicit approval. Review actionable findings first with exact locations,
evidence, impact, and the smallest correction. Applying a correction requires
an explicit Implementation boundary before any mutation. Load
`references/audit-report-template.md` only when the evidence and
classifications are complete and the report is ready to format.

## Approved implementation

Restate the explicit boundary and preserve coherent project architecture.
Diagnose bugs before changing them; define the smallest compliant design before
editing. Resolve applicable Flutter decisions through the routed references,
including state semantics, owned integration boundaries and lifecycle,
acyclic dependency direction, exact assets, and retained persistence or
approved migration.

Follow only the selected workflow. For behavior, observe RED, implement the
minimum GREEN change, and refactor while green. Keep characterization tests
passing before and after uncovered refactors. For an allowed no-test predicate,
record it and run its non-test validation. Review the complete diff and status
before verification. If evidence or approval is missing, stop and return to
the relevant gate instead of expanding scope.

## Completion

Run fresh project-defined gates applicable to the approved scope, including
format, analysis or lint, code generation, affected tests, full suite,
coverage, generated consistency, and relevant builds. Repeat applicable gates
in every modified local package and each affected direct dependent. State every
unrun validation and its reason; later implementation changes invalidate prior
verification.

After verification, update the existing canonical changelog following project
convention. Report in the user's language with approved scope, RED,
characterization, or exact no-test evidence; exact commands and actual results;
changelog disposition; skipped validations; approved exceptions; and remaining
approved work versus future debt. Do not overstate visual fidelity or
completion.
