---
name: enforcing-flutter-standards
description: Use when auditing, creating, refactoring, debugging, reviewing, or completing Flutter and Dart work where architecture, Bloc or Cubit state, Freezed models, packages, integrations, persistence, navigation, environments, UI fidelity, tests, code generation, or verification need domain-specific engineering standards.
compatibility: Requires evidence-driven-development; sources are validated against the Flutter 3.44.7 documentation snapshot and version-scoped in the source catalog.
---

# Enforcing Flutter Standards

## Domain extension contract

Apply explicit user and repository instructions first. Use
`evidence-driven-development` as the required process skill for every Flutter
audit, review, diagnosis, plan, approval, implementation, or completion task.
Consume its current mode, scenario, phase, approval boundary, and process
reference; do not recreate or load its process contracts here.

If `evidence-driven-development` is unavailable, report the missing required
skill and stop the general workflow. Do not substitute a local audit, test-first,
verification, or reporting fallback. A `theme-only` response is allowed only
for a read-only Flutter technical decision that does not inspect existing code
or a diff, propose a refactor, diagnose a bug, plan implementation, or claim
completion.

Let the process skill own scope, mutation gates, findings, approvals,
test-first sequencing, diff review, completion, changelog, and report forms.
This skill owns only Flutter discovery, domain decisions, applicable test types,
and Dart/Flutter commands.

## Source and compatibility contract

Use `references/source-catalog.json` to distinguish official Flutter guidance
from repository-owned policy. Each active reference declares a provenance
marker whose IDs apply to every normative decision in that file unless a
narrower inline marker overrides it. Treat `not-version-bound` as an explicit
classification that requires a justification in the catalog, not as missing
version evidence. Revalidate affected entries when their documented Flutter
version, URL, authority, or applicable policy changes.

## Discover Flutter evidence

Inspect applicable instructions, Git state and relevant diff, `pubspec.yaml`
and lockfiles, analysis configuration, architecture documentation, `lib/` and
`test/`, local packages and dependency edges, CI commands, generated-file
policy, assets, flavors, and existing conventions.

When Dart and filesystem access are available, start read-only discovery with:

```text
dart run <skill-directory>/scripts/inspect_flutter_project.dart \
  --root <project-directory> --format summary
```

Treat counts as mechanical evidence, not findings. Confirm relevant facts in
source and request focused JSON sections when needed, for example:

```text
dart run <skill-directory>/scripts/inspect_flutter_project.dart \
  --root <project-directory> --format json \
  --section packageEdges --section cycles
```

When the inspector cannot run, perform the same discovery manually and record
what was unavailable. Never expose a secret value; report only its kind,
location, exposure path, and required authorized action.

## Route Flutter references

Load every reference supported by current observable request, repository,
diff, import, configuration, or command evidence, and none merely because a
future process phase will need it. Keep Flutter references outside the process
skill's `process_now`; update its route record before expanding domain context.

| Evidence | Load |
|---|---|
| architecture, models, state, Bloc/Cubit, Freezed, barrels, large files | `references/architecture-and-state.md` |
| packages, dependency graph, SDK/plugin, lifecycle, dependency decision | `references/packages-and-integrations.md` |
| HTTP, API, DTO mapping, exceptions, failures, typed results | `references/networking-and-errors.md` |
| preferences, secure local values, Hive, Drift, ObjectBox, migration | `references/persistence.md` |
| routes, Navigator, deep links, URL state, redirects | `references/navigation.md` |
| logging, crash reporting, secrets, flavors, configuration | `references/security-and-environments.md` |
| approved implementation/completion, or explicit tests, codegen, coverage, Dart/Flutter gates | `references/flutter-quality.md` |
| screen, widget, responsive, accessibility, screenshot, exact asset | `references/ui-implementation.md` |

References are independent and one level deep. Do not load one to decide
whether another applies. Preserve coherent architecture and keep unrelated
debt outside the current approved boundary. During audit or diagnosis, the
mere presence of Freezed, a widget, tests, or possible future code generation
does not activate `flutter-quality.md`.

## Contribute to the active process phase

For diagnosis, supply Flutter boundary and runtime evidence. For design, supply
domain semantics, dependency direction, lifecycle, asset, persistence, and
generated-file decisions. For approved implementation, supply the applicable
unit, widget, or integration test shape and code-generation commands. For
verification, supply exact repository-defined Dart/Flutter gates for every
modified package and affected direct dependent.

Do not claim visual fidelity without comparing the rendered result to the
exact source. Never invent or approximate a missing custom asset; block only
its dependent fragment. Do not add/update dependencies or perform a technology
or data migration without the separate comparison, plan, and approval owned by
the process skill.
