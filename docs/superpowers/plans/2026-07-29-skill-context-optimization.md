# Skill Context Optimization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reduce the context loaded by `enforcing-flutter-standards` through
selective references and progressive inspector output without weakening its
Flutter decisions or adding consumption telemetry.

**Architecture:** Keep `SKILL.md` as a compact router with universal gates,
move domain decisions from the monolithic engineering reference into seven
independent thematic references, and compose exactly one general workflow:
Superpowers when its applicable route is available or the standalone workflow
otherwise. Extend the read-only Dart inspector with an explicit summary format
and repeatable section selection while preserving its current full text and
JSON interfaces.

**Tech Stack:** Agent Skills Markdown, Dart SDK using only `dart:convert` and
`dart:io`, optional Superpowers composition, fresh-context skill evaluations,
Git.

## Global Constraints

- Work from
  `<repo-root>`.
- Preserve the unrelated untracked file
  `docs/superpowers/plans/2026-07-29-repository-health-audit-b1.md`; never stage,
  edit, delete, or include it in a commit.
- Keep the deployable skill under
  `.agents/skills/enforcing-flutter-standards/`.
- Keep the skill portable and its runtime instructions in English; reports and
  questions remain in the user's language.
- Do not add or update dependencies.
- Do not add GraphRAG, RAG, embeddings, vector stores, prompt caching, model
  changes, telemetry, dashboards, persistent token metrics, or billing APIs.
- Static size counts are verification evidence for this implementation only;
  do not persist a metrics history.
- Preserve `--format text` as the inspector default and preserve the complete
  existing text and JSON inventory when no `--section` is supplied.
- Keep inspector output deterministic and read-only.
- Keep every reference one level below `SKILL.md`; thematic references must
  not require one another.
- A focused task must load only the general workflow and Flutter references
  selected by observable predicates.
- Superpowers and `standalone-workflow.md` are mutually exclusive for a given
  request.
- Preserve audit read-only behavior, explicit implementation approval, exact
  asset handling, dependency approval, secret-safe reporting, TDD predicates,
  direct-dependent verification, and canonical changelog behavior.
- Treat skill-document changes as test-first behavior changes: capture the
  current routing failure before changing the deployable skill.
- Update the existing root `CHANGELOG.md` after fresh verification; do not bump
  a version.
- Use `apply_patch` for manual file edits and keep commits scoped to the task
  that produced them.

## File Map

### Deployable orchestrator

- Modify:
  `.agents/skills/enforcing-flutter-standards/SKILL.md` — universal gates,
  mode selection, workflow composition, inspector summary invocation, and the
  complete observable-predicate routing table.

### Thematic Flutter decisions

- Create:
  `.agents/skills/enforcing-flutter-standards/references/architecture-and-state.md`
  — architecture, domain purity, Cubit/Bloc, Freezed, barrels, and file
  responsibility.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/packages-and-integrations.md`
  — local packages, dependency direction, SDK adapters, lifecycle, and
  dependency approval.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/networking-and-errors.md`
  — HTTP clients, DTO mapping, exceptions, failures, and typed results.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/persistence.md`
  — preferences, secure local values, Hive, Drift, ObjectBox, and migrations.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/navigation.md`
  — Navigator, declarative routing, deep links, URL state, and redirects.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/security-and-environments.md`
  — observability boundaries, redaction, secrets, flavors, and typed
  configuration.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/quality-and-delivery.md`
  — Flutter-specific test predicates, coverage, changelog, packages/direct
  dependents, and verification matrix.
- Delete after migration:
  `.agents/skills/enforcing-flutter-standards/references/engineering-standards.md`.

### Mode and reporting contracts

- Modify:
  `.agents/skills/enforcing-flutter-standards/references/audit-contract.md` —
  retain audit scope, severity, finding fields, safe-secret rules, batch
  fields, and approval; remove illustrative output.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/audit-report-template.md`
  — the complete finding and summary examples loaded only while formatting an
  audit report.
- Modify:
  `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`
  — remain the full fallback process and point reporting to the extracted
  template.
- Modify:
  `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`
  — own only availability, route mapping, and mutual exclusion.
- Modify:
  `.agents/skills/enforcing-flutter-standards/references/ui-implementation.md`
  — retain UI-specific rules and remove any duplicated general delivery rule.

### Progressive inspector

- Modify:
  `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart`
  — add `summary`, repeatable `--section`, projection, and validation.
- Modify:
  `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart`
  — RED/GREEN coverage for summary, projections, invalid combinations, and
  read-only compatibility.

### Behavioral evaluation and public documentation

- Modify:
  `skill-evals/enforcing-flutter-standards/behavior-scenarios.md` — add
  selective-loading scenarios.
- Modify:
  `skill-evals/enforcing-flutter-standards/scorecard.md` — record RED and GREEN
  routing evidence without adding an operational metrics system.
- Modify: `README.md` — document thematic references and progressive inspector
  usage.
- Modify: `CHANGELOG.md` — add one concise optimization entry under
  `[Unreleased]`.

---

### Task 1: Establish selective-loading RED evidence

**Files:**

- Modify:
  `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- Modify: `skill-evals/enforcing-flutter-standards/scorecard.md`

**Interfaces:**

- Consumes: the current committed deployable skill, before any routing change.
- Produces: scenarios `R1` through `R4` and scorecard rows that later tasks use
  as the behavioral acceptance contract.

- [ ] **Step 1: Add four fresh-context routing scenarios**

Append this exact section to `behavior-scenarios.md`:

```markdown
## Selective-reference routing

Run each route in a fresh context. Give the evaluator access to the current
deployable skill and the stated Superpowers availability. Capture every skill
or reference file it reads before answering. A route fails when it reads a
forbidden reference, skips a required reference, loads both general workflows,
or weakens the requested decision.

### R1 — Focused networking bug with Superpowers

Superpowers systematic debugging, TDD, and verification skills are available.
An existing Flutter repository has a focused bug: one API mapper lets a vendor
HTTP exception escape instead of returning the project's typed failure. Inspect
and propose the smallest test-first fix. Before the proposal, list every
enforcing-flutter-standards reference loaded.

Required Flutter references after optimization:
- `superpowers-integration.md`
- `networking-and-errors.md`
- `quality-and-delivery.md`

Forbidden Flutter references:
- `architecture-and-state.md`
- `packages-and-integrations.md`
- `persistence.md`
- `navigation.md`
- `security-and-environments.md`
- `ui-implementation.md`
- `standalone-workflow.md`

### R2 — Focused UI audit with Superpowers

Superpowers is available. Audit only a changed Flutter screen against a
screenshot. The screen has a missing exact custom SVG and a responsive overflow
at narrow width; no data, networking, persistence, navigation, package,
environment, or logging change is present. Before reporting, list every
enforcing-flutter-standards reference loaded.

Required Flutter references after optimization:
- `superpowers-integration.md`
- `audit-contract.md`
- `ui-implementation.md`
- `audit-report-template.md`, loaded only when formatting the report

Forbidden Flutter references:
- `architecture-and-state.md`
- `packages-and-integrations.md`
- `networking-and-errors.md`
- `persistence.md`
- `navigation.md`
- `security-and-environments.md`
- `standalone-workflow.md`

### R3 — Persistence feature with Superpowers

Superpowers brainstorming, planning, TDD, and verification skills are
available. A touched feature in an existing app needs one new Hive field and
query. No other architecture, networking, navigation, UI, environment,
observability, or package change is requested. Decide the storage direction
and approval boundary. Before answering, list every
enforcing-flutter-standards reference loaded.

Required Flutter references after optimization:
- `superpowers-integration.md`
- `persistence.md`
- `quality-and-delivery.md`

Forbidden Flutter references:
- `architecture-and-state.md`
- `packages-and-integrations.md`
- `networking-and-errors.md`
- `navigation.md`
- `security-and-environments.md`
- `ui-implementation.md`
- `standalone-workflow.md`

### R4 — Standalone architecture review

No Superpowers skill is discoverable. Review a changed Freezed state and Cubit
whose event semantics may require Bloc. No networking, persistence, navigation,
UI, package, environment, or logging concern is present. Before reporting,
list every enforcing-flutter-standards reference loaded.

Required Flutter references after optimization:
- `standalone-workflow.md`
- `audit-contract.md`
- `architecture-and-state.md`
- `audit-report-template.md`, loaded only when formatting the report

Forbidden Flutter references:
- `superpowers-integration.md`
- `packages-and-integrations.md`
- `networking-and-errors.md`
- `persistence.md`
- `navigation.md`
- `security-and-environments.md`
- `ui-implementation.md`
```

- [ ] **Step 2: Add pending routing rows to the scorecard**

Insert this table before `## Representative audit coverage`:

```markdown
## Selective-reference routing

| ID | Required behavior | RED result | GREEN result | Notes |
|---|---|---|---|---|
| R1 | Loads Superpowers integration, networking/errors, and quality; excludes standalone and unrelated domains | Pending | Pending | Capture exact files read. |
| R2 | Loads Superpowers integration, audit, and UI, deferring the report template until formatting; avoids unrelated domains | Pending | Pending | Capture exact files read. |
| R3 | Loads Superpowers integration, persistence, and quality; retains Hive and excludes standalone | Pending | Pending | Capture exact files read. |
| R4 | Loads standalone, audit, architecture/state, and the deferred report template; excludes Superpowers integration | Pending | Pending | Capture exact files read. |
```

- [ ] **Step 3: Run each scenario against the current skill**

Use four fresh agents or threads with no conversation history. Give each only
its scenario and this skill path:

```text
<repo-root>/.agents/skills/enforcing-flutter-standards
```

Expected RED: every route reads
`references/engineering-standards.md` because current `SKILL.md` marks it
mandatory; record that exact failure in the `RED result` and `Notes` cells.
Do not expose the optimization design or expected answer beyond the scenario.

- [ ] **Step 4: Verify that RED is caused by the current routing rule**

Run:

```bash
rg -n 'Always read `references/engineering-standards.md`' \
  .agents/skills/enforcing-flutter-standards/SKILL.md
```

Expected: one match at the current load-reference rule, confirming the
mandatory monolith caused the selective-loading failure.

- [ ] **Step 5: Review and commit the RED contract**

Run:

```bash
git diff --check
git diff -- skill-evals/enforcing-flutter-standards/behavior-scenarios.md \
  skill-evals/enforcing-flutter-standards/scorecard.md
git status --short
```

Stage only the two evaluation files, then commit:

```bash
git add skill-evals/enforcing-flutter-standards/behavior-scenarios.md \
  skill-evals/enforcing-flutter-standards/scorecard.md
git commit -m "test: capture selective skill routing baseline"
```

---

### Task 2: Add progressive inspector output with TDD

**Files:**

- Modify:
  `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart`
- Modify:
  `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart`

**Interfaces:**

- Consumes: inventory schema version `1` with keys
  `flutterRoots`, `packageEdges`, `cycles`, `largeDartFiles`, `barrels`,
  `featureLayers`, `tests`, `changelogs`, `analysisOptions`, and
  `projectCommands`.
- Produces:
  `--format summary`, repeatable `--section SECTION`, `_Options.sections`, and
  projected text/JSON inventories that always retain `schemaVersion` and
  `root`.

- [ ] **Step 1: Add RED tests for summary output**

Add a test after the existing output-mode test:

```dart
passed += await _runTest(
  'summary mode catches full inventories used for initial discovery',
  () async {
    final summary = await Process.run(Platform.resolvedExecutable, [
      'run',
      inspector.path,
      '--root',
      fixtureRoot.path,
      '--format',
      'summary',
    ], workingDirectory: repositoryRoot.path);
    _expectEqual(summary.exitCode, 0, 'Summary mode must succeed.');
    final output = summary.stdout as String;
    _expect(
      output.startsWith('Flutter project inventory summary (schema 1)\n'),
      'Summary header is missing.',
    );
    for (final section in const [
      'flutterRoots',
      'packageEdges',
      'cycles',
      'largeDartFiles',
      'barrels',
      'featureLayers',
      'tests',
      'changelogs',
      'analysisOptions',
      'projectCommands',
    ]) {
      _expect(
        RegExp('^$section: [0-9]+\$', multiLine: true).hasMatch(output),
        'Summary must report the count for $section.',
      );
    }
    _expect(
      output.contains('Expand: --format text --section <name>'),
      'Summary must explain progressive expansion.',
    );
    _expect(
      !output.contains('lib/at_threshold.dart'),
      'Summary must not print inventory records.',
    );
  },
);
```

- [ ] **Step 2: Add RED tests for repeatable section projection**

Add this test immediately after the summary test:

```dart
passed += await _runTest(
  'section selection catches unrelated inventory emitted during expansion',
  () async {
    final result = await Process.run(Platform.resolvedExecutable, [
      'run',
      inspector.path,
      '--root',
      fixtureRoot.path,
      '--format',
      'json',
      '--section',
      'packageEdges',
      '--section',
      'cycles',
    ], workingDirectory: repositoryRoot.path);
    _expectEqual(result.exitCode, 0, 'Selected JSON sections must succeed.');
    final inventory =
        jsonDecode(result.stdout as String) as Map<String, dynamic>;
    _expectEqual(
      inventory.keys.toList(),
      ['schemaVersion', 'root', 'packageEdges', 'cycles'],
      'Projected JSON must contain metadata and requested sections only.',
    );
    _expect(
      (inventory['packageEdges'] as List<dynamic>).isNotEmpty,
      'Selected package edges must retain their records.',
    );
  },
);
```

- [ ] **Step 3: Add RED validation tests**

Extend the existing argument-validation test with:

```dart
final invalidSection = await Process.run(Platform.resolvedExecutable, [
  'run',
  inspector.path,
  '--section',
  'unknown',
], workingDirectory: repositoryRoot.path);
_expectEqual(
  invalidSection.exitCode,
  64,
  'Unknown sections must use EX_USAGE (64).',
);
_expect(
  (invalidSection.stderr as String).contains('Unknown section: unknown'),
  'Unknown sections must be actionable.',
);

final summarySection = await Process.run(Platform.resolvedExecutable, [
  'run',
  inspector.path,
  '--format',
  'summary',
  '--section',
  'tests',
], workingDirectory: repositoryRoot.path);
_expectEqual(
  summarySection.exitCode,
  64,
  'Summary plus section must use EX_USAGE (64).',
);
_expect(
  (summarySection.stderr as String).contains(
    '--section cannot be combined with --format summary',
  ),
  'Invalid summary combinations must explain the correction.',
);
```

- [ ] **Step 4: Run the inspector suite and observe RED**

Run:

```bash
dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected: FAIL in the new summary test because `summary` is not an accepted
format. Confirm the failure is not a Dart syntax error.

- [ ] **Step 5: Add the canonical section list and CLI contract**

At the top of `inspect_flutter_project.dart`, replace the usage constant and
add:

```dart
const _inventorySections = <String>[
  'flutterRoots',
  'packageEdges',
  'cycles',
  'largeDartFiles',
  'barrels',
  'featureLayers',
  'tests',
  'changelogs',
  'analysisOptions',
  'projectCommands',
];

const _usage =
    'Usage: dart run inspect_flutter_project.dart '
    '--root DIRECTORY [--format json|text|summary] [--section NAME]...';
```

Extend `_Options` to expose:

```dart
const _Options(this.root, this.format, this.sections);

final String root;
final String format;
final List<String> sections;
```

Replace `_parseArguments` with:

```dart
_Options? _parseArguments(List<String> arguments) {
  var root = '.';
  var format = 'text';
  final sections = <String>[];
  var index = 0;

  while (index < arguments.length) {
    final argument = arguments[index];
    if (!const {'--root', '--format', '--section'}.contains(argument)) {
      _usageError('Unknown argument: $argument');
      return null;
    }
    if (index + 1 >= arguments.length) {
      _usageError('Missing value for $argument');
      return null;
    }

    final value = arguments[index + 1];
    if (argument == '--root') {
      if (value.isEmpty) {
        _usageError('Root directory must not be empty.');
        return null;
      }
      root = value;
    } else if (argument == '--format') {
      if (!const {'json', 'text', 'summary'}.contains(value)) {
        _usageError('Format must be "json", "text", or "summary".');
        return null;
      }
      format = value;
    } else {
      if (!_inventorySections.contains(value)) {
        _usageError('Unknown section: $value');
        return null;
      }
      if (!sections.contains(value)) sections.add(value);
    }
    index += 2;
  }

  if (format == 'summary' && sections.isNotEmpty) {
    _usageError('--section cannot be combined with --format summary.');
    return null;
  }
  return _Options(root, format, List<String>.unmodifiable(sections));
}
```

This preserves the first occurrence order while ignoring duplicate valid
sections.

- [ ] **Step 6: Implement summary and projection**

Add these methods to `_InspectorCli`:

```dart
Map<String, Object> _selectSections(
  Map<String, Object> inventory,
  List<String> sections,
) {
  if (sections.isEmpty) return inventory;
  return <String, Object>{
    'schemaVersion': inventory['schemaVersion']!,
    'root': inventory['root']!,
    for (final section in sections) section: inventory[section]!,
  };
}

void _printSummary(Map<String, Object> inventory) {
  stdout.writeln(
    'Flutter project inventory summary '
    '(schema ${inventory['schemaVersion']})',
  );
  stdout.writeln('Root: ${inventory['root']}');
  for (final section in _inventorySections) {
    stdout.writeln('$section: ${(inventory[section]! as List<Object>).length}');
  }
  stdout.writeln('Available sections: ${_inventorySections.join(', ')}');
  stdout.writeln('Expand: --format text --section <name>');
}
```

In `run`, render summary directly. Otherwise project the inventory before
calling `jsonEncode` or `_printText`:

```dart
if (options.format == 'summary') {
  _printSummary(inventory);
  return;
}
final selected = _selectSections(inventory, options.sections);
if (options.format == 'json') {
  stdout.writeln(jsonEncode(selected));
} else {
  _printText(selected);
}
```

Change `_printText` to iterate only over the canonical sections present in the
projected map:

```dart
for (final key in _inventorySections.where(inventory.containsKey)) {
  final values = inventory[key]! as List<Object>;
  stdout.writeln('$key (${values.length}):');
  for (final value in values) {
    stdout.writeln('  ${value is String ? value : jsonEncode(value)}');
  }
}
```

- [ ] **Step 7: Verify GREEN and compatibility**

Run:

```bash
dart format .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart \
  skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected: `PASS: 10 tests`. The existing full text/JSON equality test and
read-only snapshot test must remain green.

- [ ] **Step 8: Review and commit the inspector**

Run:

```bash
git diff --check
git diff -- .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart \
  skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
git status --short
```

Stage only the inspector and its test, then commit:

```bash
git add .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart \
  skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
git commit -m "feat: add progressive inspector output"
```

---

### Task 3: Create focused thematic references

**Files:**

- Create:
  `.agents/skills/enforcing-flutter-standards/references/architecture-and-state.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/packages-and-integrations.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/networking-and-errors.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/persistence.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/navigation.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/security-and-environments.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/quality-and-delivery.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/audit-report-template.md`
- Modify:
  `.agents/skills/enforcing-flutter-standards/references/audit-contract.md`

**Interfaces:**

- Consumes: the twenty numbered sections of
  `references/engineering-standards.md` and the examples at
  `audit-contract.md:149-195`.
- Produces: eight independently loadable references with no thematic
  cross-loading; keeps `engineering-standards.md` temporarily as the source
  comparison until Task 4.

- [ ] **Step 1: Create the seven thematic files from the canonical sections**

Use this exact source mapping:

```text
architecture-and-state.md
  ← sections 2, 3, 4, 5, 6

packages-and-integrations.md
  ← sections 7, 8, 9

networking-and-errors.md
  ← sections 10, 11

persistence.md
  ← section 12

navigation.md
  ← section 13

security-and-environments.md
  ← sections 14, 15

quality-and-delivery.md
  ← sections 16, 17, 18
```

Preserve every observable-predicate table row from those sections. Remove the
numeric prefixes from headings because each new file owns its topic. Start
each file with one sentence defining its loading predicate; for example:

```markdown
# Flutter architecture and state

Load this reference for architecture, domain boundaries, Cubit or Bloc,
Freezed, barrels, imports, or file-responsibility decisions supported by
observable project evidence.
```

If a resulting reference exceeds 100 lines, add a compact table of contents
immediately after its loading predicate. The table of contents lists only that
file's H2 headings and does not link to another thematic reference.

- [ ] **Step 2: Distribute pressure counters without duplicating them**

Move the section 19 rationalization rows to their owning references:

```text
architecture-and-state.md:
  modular folders/package graph
  senior mandates Cubit
  Stream therefore Bloc

packages-and-integrations.md:
  single consumer cannot be a package
  preferred dependency is mandatory

persistence.md:
  touched Hive feature authorizes Drift

quality-and-delivery.md:
  obvious problems/deadline skips audit
  tests afterward/sunk cost
  generic no-ship verdict is sufficient

ui-implementation.md in Task 4:
  visually similar Material icon
```

Place the four-slot combined-pressure completion contract in
`quality-and-delivery.md` because it is a delivery-output contract. Do not copy
the global-policy list from section 1 or the quick-reference table from
section 20; their decisions already exist in the detailed topic tables and the
new `SKILL.md` router will replace their navigation purpose.

- [ ] **Step 3: Extract audit examples**

Create `audit-report-template.md` with:

```markdown
# Flutter audit report template

Load this reference only after audit evidence and classifications are complete
and the report is ready to be formatted. The binding audit rules remain in
`audit-contract.md`.

## Complete finding example
```

Move the current complete finding example and example audit summary from
`audit-contract.md:149-195` under that heading without altering their example
facts. Remove those example sections from `audit-contract.md`.

- [ ] **Step 4: Make the audit contract reference-neutral**

Replace its opening dependency on the monolith:

```markdown
Apply repository instructions and every thematic Flutter reference selected
from observable evidence before classifying findings.
```

At the end of its proposal rules, add:

```markdown
When the evidence and classifications are complete, load
`audit-report-template.md` to format examples without reloading unrelated
engineering guidance.
```

This is a discovery pointer, not a command to load the template at audit start.

- [ ] **Step 5: Verify reference ownership**

Run:

```bash
rg -n '^## [0-9]+\\.' \
  .agents/skills/enforcing-flutter-standards/references/architecture-and-state.md \
  .agents/skills/enforcing-flutter-standards/references/packages-and-integrations.md \
  .agents/skills/enforcing-flutter-standards/references/networking-and-errors.md \
  .agents/skills/enforcing-flutter-standards/references/persistence.md \
  .agents/skills/enforcing-flutter-standards/references/navigation.md \
  .agents/skills/enforcing-flutter-standards/references/security-and-environments.md \
  .agents/skills/enforcing-flutter-standards/references/quality-and-delivery.md
```

Expected: no matches; numeric monolith numbering is gone.

Run:

```bash
rg -n 'references/(architecture-and-state|packages-and-integrations|networking-and-errors|persistence|navigation|security-and-environments|quality-and-delivery)\\.md' \
  .agents/skills/enforcing-flutter-standards/references/*.md
```

Expected: no thematic reference requires another thematic reference. Ignore
future matches in `SKILL.md`, which is not part of this command.

- [ ] **Step 6: Compare canonical decision coverage**

Use the headings and tables in the old monolith as the checklist:

```bash
rg -n '^## |^\\| Observable predicate|^\\| Rationalization' \
  .agents/skills/enforcing-flutter-standards/references/engineering-standards.md
rg -n '^## |^\\| Observable predicate|^\\| Rationalization' \
  .agents/skills/enforcing-flutter-standards/references/{architecture-and-state,packages-and-integrations,networking-and-errors,persistence,navigation,security-and-environments,quality-and-delivery}.md
```

Expected: sections 2-18 and every domain-owned rationalization have exactly
one destination. Section 1's precedence and exception record remain scheduled
for `SKILL.md`; section 20 is intentionally replaced rather than copied.

- [ ] **Step 7: Review and commit the references**

Run:

```bash
git diff --check
git diff -- .agents/skills/enforcing-flutter-standards/references
git status --short
```

Stage only the eight new references and `audit-contract.md`, then commit:

```bash
git add \
  .agents/skills/enforcing-flutter-standards/references/architecture-and-state.md \
  .agents/skills/enforcing-flutter-standards/references/packages-and-integrations.md \
  .agents/skills/enforcing-flutter-standards/references/networking-and-errors.md \
  .agents/skills/enforcing-flutter-standards/references/persistence.md \
  .agents/skills/enforcing-flutter-standards/references/navigation.md \
  .agents/skills/enforcing-flutter-standards/references/security-and-environments.md \
  .agents/skills/enforcing-flutter-standards/references/quality-and-delivery.md \
  .agents/skills/enforcing-flutter-standards/references/audit-report-template.md \
  .agents/skills/enforcing-flutter-standards/references/audit-contract.md
git commit -m "refactor: split Flutter engineering references"
```

---

### Task 4: Replace mandatory loading with the compact router

**Files:**

- Modify:
  `.agents/skills/enforcing-flutter-standards/SKILL.md`
- Modify:
  `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`
- Modify:
  `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`
- Modify:
  `.agents/skills/enforcing-flutter-standards/references/ui-implementation.md`
- Delete:
  `.agents/skills/enforcing-flutter-standards/references/engineering-standards.md`

**Interfaces:**

- Consumes: thematic references from Task 3 and inspector
  `--format summary`/`--section` from Task 2.
- Produces: one compact `SKILL.md` router, mutually exclusive workflow
  selection, and no remaining runtime reference to
  `engineering-standards.md`.

- [ ] **Step 1: Rewrite `SKILL.md` around universal gates**

Keep the existing frontmatter unchanged. Replace the body with these sections,
in this order:

```markdown
# Enforcing Flutter Standards

## Core contract
## Discover and select a mode
## Compose one workflow
## Route Flutter references
## Audit and review
## Approved implementation
## Completion
```

`Core contract` must retain these exact decisions in concise form:

- repository and nested instructions outrank the skill;
- inspect before proposing;
- audit and review are read-only;
- implementation requires explicit requested scope or approved named batches;
- behavior uses observed RED, uncovered refactors use passing characterization
  tests, and allowed non-behavior work records its predicate;
- never invent or substitute a custom asset;
- dependencies and migrations require comparison and explicit approval;
- never reveal secret values;
- completion requires fresh applicable verification and the existing canonical
  changelog;
- an exception record names rule, observation, technical reason, impact, and
  approval.

- [ ] **Step 2: Use progressive inspector discovery**

In `Discover and select a mode`, use:

```text
dart run <skill-directory>/scripts/inspect_flutter_project.dart \
  --root <project-directory> --format summary
```

State that summary counts are mechanical evidence, not architectural findings.
Expand only relevant sections with repeatable arguments:

```text
--format json --section packageEdges --section cycles
```

Preserve manual read-only discovery when filesystem or Dart access is absent.

- [ ] **Step 3: Add the complete reference router**

Use one table with these observable predicates and files:

```markdown
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
```

Add: load every row supported by evidence, none merely because it exists.
References are independent and one level deep.

- [ ] **Step 4: Make workflow composition exclusive**

`Compose one workflow` must say:

```markdown
Discover the available Superpowers skills without assuming them. If every
skill required by the applicable scenario is available, load
`references/superpowers-integration.md` and follow only that composition. If
any required skill is absent, load `references/standalone-workflow.md` for the
whole request. Never combine the standalone workflow with a partial
Superpowers route.
```

Keep `superpowers-integration.md` limited to its availability rule, scenario
mapping, and statement that Flutter references own domain decisions. Remove
generic RED/GREEN/verification explanations already owned by Superpowers.

Keep `standalone-workflow.md` complete, but replace any pointer that treats
audit examples as always loaded with:

```markdown
Use `audit-contract.md` while collecting and classifying evidence. Load
`audit-report-template.md` only when the audit report is ready to format.
```

- [ ] **Step 5: Remove duplicated UI delivery guidance**

Keep responsive, exact-asset, accessibility, widget-test, rendering, and
fidelity rules in `ui-implementation.md`. Replace general completion/TDD text
already owned by `quality-and-delivery.md` with a single UI-specific
completion predicate: do not claim visual fidelity beyond the compared
viewports, states, platforms, and exact assets actually verified.

- [ ] **Step 6: Delete the migrated monolith**

After confirming Tasks 3 and 4 contain every canonical rule, delete:

```text
.agents/skills/enforcing-flutter-standards/references/engineering-standards.md
```

Run:

```bash
rg -n 'engineering-standards\\.md' \
  .agents/skills/enforcing-flutter-standards README.md \
  skill-evals/enforcing-flutter-standards
```

Expected before README work: matches are allowed only in source/history
evaluation prose that explicitly describes the old baseline. There must be no
runtime instruction requiring the deleted file.

- [ ] **Step 7: Check compactness and structure**

Run:

```bash
wc -w -c .agents/skills/enforcing-flutter-standards/SKILL.md
find .agents/skills/enforcing-flutter-standards/references -maxdepth 1 \
  -type f -name '*.md' -print | sort
```

Expected:

- `SKILL.md` has at most 1,000 words and is materially below the current 1,462
  words;
- every routed reference exists;
- `engineering-standards.md` is absent;
- no reference is nested deeper than `references/<file>.md`.

- [ ] **Step 8: Run focused structural checks**

Run:

```bash
rg -n 'references/(architecture-and-state|packages-and-integrations|networking-and-errors|persistence|navigation|security-and-environments|quality-and-delivery|ui-implementation|audit-contract|audit-report-template|standalone-workflow|superpowers-integration)\\.md' \
  .agents/skills/enforcing-flutter-standards/SKILL.md
rg -n 'Never combine the standalone workflow|Never combine.*partial Superpowers' \
  .agents/skills/enforcing-flutter-standards/SKILL.md
```

Expected: all twelve reference paths are discoverable from `SKILL.md`, and the
exclusive workflow rule is present.

- [ ] **Step 9: Review and commit the router**

Run:

```bash
git diff --check
git diff -- .agents/skills/enforcing-flutter-standards
git status --short
```

Stage only the five task paths, including the deletion, then commit:

```bash
git add .agents/skills/enforcing-flutter-standards/SKILL.md \
  .agents/skills/enforcing-flutter-standards/references/standalone-workflow.md \
  .agents/skills/enforcing-flutter-standards/references/superpowers-integration.md \
  .agents/skills/enforcing-flutter-standards/references/ui-implementation.md \
  .agents/skills/enforcing-flutter-standards/references/engineering-standards.md
git commit -m "refactor: route Flutter guidance progressively"
```

---

### Task 5: Verify GREEN behavior and close routing gaps

**Files:**

- Modify:
  `skill-evals/enforcing-flutter-standards/scorecard.md`
- Modify only when a failed evaluation proves a gap:
  `.agents/skills/enforcing-flutter-standards/SKILL.md`
- Modify only when a failed evaluation proves a topic-specific gap:
  the single owning file under
  `.agents/skills/enforcing-flutter-standards/references/`

**Interfaces:**

- Consumes: scenarios `S1`-`S6`, `A1`, `CP1`-`CP5`, and `R1`-`R4`; optimized
  deployable skill.
- Produces: recorded GREEN routing evidence and behavior results with each
  correction applied only to its canonical owner.

- [ ] **Step 1: Validate the Agent Skill structure**

Run:

```bash
python3 <skill-creator-root>/scripts/quick_validate.py \
  .agents/skills/enforcing-flutter-standards
```

Expected: validation success with the existing skill name and description.

- [ ] **Step 2: Run the four routing scenarios in fresh contexts**

Use the same isolation and prompts as Task 1, now against the optimized skill.
Record exact files read in the `GREEN result` and `Notes` cells.

Expected:

- R1 loads networking/errors and quality, plus its available Superpowers route;
- R2 loads audit and UI, then the report template only at formatting;
- R3 loads persistence and quality, plus its available Superpowers route;
- R4 loads standalone, audit, architecture/state, then the report template,
  with no Superpowers integration.

Any unrelated thematic reference or both workflows is a failure.

- [ ] **Step 3: Re-run the six discipline scenarios**

Run S1-S6 in fresh contexts using the exact prompts already stored in
`behavior-scenarios.md`. Record results in the existing scorecard rows.

Expected decisions:

```text
S1 → audit only, small batches, wait for approval
S2 → Bloc from event/concurrency semantics
S3 → exact SVG required; only dependent fragment blocked
S4 → owned SDK boundary and acyclic token contract
S5 → remove untested implementation and observe RED
S6 → extend Hive; migration requires separate approval
```

- [ ] **Step 4: Re-run representative audit A1**

Use the exact A1 prompt in a fresh context. Verify every A1.1-A1.9 row and the
A1.P1 batch-shape contract. The report template must not be read until the
evaluator starts formatting findings and batches.

Expected: no secret value is reproduced, all conditional environment fields
are present when applicable, Shared Preferences structured-data correction is
not omitted, and every proposed batch has all required fields.

- [ ] **Step 5: Close only observed gaps**

For each failed row:

1. quote the exact omission or incorrect file load in `scorecard.md`;
2. identify its canonical owner from the router;
3. patch only that owner with a positive output contract or observable
   condition;
4. rerun the failed scenario in a fresh context;
5. record the repetition result.

Do not add a rule to `SKILL.md` when it belongs to one thematic reference. Do
not restore the monolith or make a thematic reference mandatory for every
route.

- [ ] **Step 6: Review and commit evaluation results**

Run:

```bash
git diff --check
git diff -- skill-evals/enforcing-flutter-standards/scorecard.md \
  .agents/skills/enforcing-flutter-standards
git status --short
```

Stage the scorecard and only the canonical instruction files changed by proven
gaps, then commit:

```bash
git add skill-evals/enforcing-flutter-standards/scorecard.md \
  .agents/skills/enforcing-flutter-standards/SKILL.md \
  .agents/skills/enforcing-flutter-standards/references
git commit -m "test: verify progressive Flutter skill routing"
```

Before committing, inspect `git diff --cached --name-only` and unstage every
instruction file that did not actually change.

---

### Task 6: Update public documentation and changelog

**Files:**

- Modify: `README.md`
- Modify: `CHANGELOG.md`
- Modify:
  `docs/superpowers/specs/2026-07-29-skill-context-optimization-design.md`

**Interfaces:**

- Consumes: final file structure and inspector CLI from Tasks 2-5.
- Produces: accurate public documentation, approved spec status, and one
  canonical changelog entry.

- [ ] **Step 1: Mark the specification approved**

Change its status line to:

```markdown
**Estado:** aprobado para implementación el 29 de julio de 2026.
```

- [ ] **Step 2: Update the skill anatomy in README**

Replace the monolithic engineering-reference row with rows for the seven
thematic references. Add `audit-report-template.md` and explain that it loads
only when formatting a report. Keep Superpowers described as optional and
mutually exclusive with the standalone workflow for each request.

- [ ] **Step 3: Document progressive inspector commands**

Keep the existing full text and JSON commands. Add:

```bash
dart run .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart \
  --root /ruta/a/tu/proyecto \
  --format summary
```

and:

```bash
dart run .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart \
  --root /ruta/a/tu/proyecto \
  --format json \
  --section packageEdges \
  --section cycles
```

Explain that summary reports counts and available expansions without printing
records, while repeated sections return only requested evidence plus schema
and root metadata.

- [ ] **Step 4: Update the repository tree**

Show the seven thematic references and audit report template under
`references/`. Remove `engineering-standards.md` from every current-structure
description. Historical design documents may still name the old source.

- [ ] **Step 5: Add the changelog entry**

Under `## [Unreleased]` → `### Added`, append:

```markdown
- Optimized skill context loading with thematic references and progressive inspector output.
```

- [ ] **Step 6: Validate documentation**

Run:

```bash
for path in \
  .agents/skills/enforcing-flutter-standards/SKILL.md \
  .agents/skills/enforcing-flutter-standards/references/architecture-and-state.md \
  .agents/skills/enforcing-flutter-standards/references/packages-and-integrations.md \
  .agents/skills/enforcing-flutter-standards/references/networking-and-errors.md \
  .agents/skills/enforcing-flutter-standards/references/persistence.md \
  .agents/skills/enforcing-flutter-standards/references/navigation.md \
  .agents/skills/enforcing-flutter-standards/references/security-and-environments.md \
  .agents/skills/enforcing-flutter-standards/references/quality-and-delivery.md \
  .agents/skills/enforcing-flutter-standards/references/audit-report-template.md \
  skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
do
  test -e "$path" || exit 1
done
```

Expected: exit code `0`.

Run both new inspector commands against this repository and confirm their
output matches the README descriptions.

- [ ] **Step 7: Review and commit documentation**

Run:

```bash
git diff --check
git diff -- README.md CHANGELOG.md \
  docs/superpowers/specs/2026-07-29-skill-context-optimization-design.md
git status --short
```

Stage only these three files, then commit:

```bash
git add README.md CHANGELOG.md \
  docs/superpowers/specs/2026-07-29-skill-context-optimization-design.md
git commit -m "docs: describe progressive skill loading"
```

---

### Task 7: Run final verification and review

**Files:**

- Verify all changed files from Tasks 1-6.
- Do not create a metrics artifact.

**Interfaces:**

- Consumes: the complete optimized skill, evaluator records, inspector, tests,
  README, and changelog.
- Produces: fresh command evidence, one-time before/after size comparison, and
  a reviewed final diff ready for integration.

- [ ] **Step 1: Verify formatting without changing files**

Run:

```bash
dart format --output=none --set-exit-if-changed \
  .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart \
  skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected: exit code `0` and no formatting changes.

- [ ] **Step 2: Run static analysis**

Run:

```bash
dart analyze .agents/skills/enforcing-flutter-standards/scripts
dart analyze skill-evals/enforcing-flutter-standards
```

Expected: both commands report `No issues found!`.

- [ ] **Step 3: Run the complete inspector suite**

Run:

```bash
dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected: all ten tests pass, including full-format compatibility,
progressive output, argument validation, and read-only snapshots.

- [ ] **Step 4: Revalidate the skill**

Run:

```bash
python3 <skill-creator-root>/scripts/quick_validate.py \
  .agents/skills/enforcing-flutter-standards
```

Expected: validation success.

- [ ] **Step 5: Perform the one-time size comparison**

Run:

```bash
wc -w -c \
  .agents/skills/enforcing-flutter-standards/SKILL.md \
  .agents/skills/enforcing-flutter-standards/references/*.md
```

Compare the result with the approved baseline:

```text
SKILL.md: 1,462 words / 10,842 characters
engineering-standards.md: 6,817 words / 47,709 characters
all prior runtime Markdown: 12,691 words / 91,005 characters
```

Record the command output in the completion report only. Do not add it to a
metrics file. Acceptance requires `SKILL.md <= 1,000 words` and no focused
route requiring all thematic references.

- [ ] **Step 6: Check deleted and routed references**

Run:

```bash
test ! -e .agents/skills/enforcing-flutter-standards/references/engineering-standards.md
rg -n 'engineering-standards\\.md' \
  .agents/skills/enforcing-flutter-standards
```

Expected: the `test` succeeds and `rg` returns no runtime matches.

- [ ] **Step 7: Inspect the complete repository state**

Run:

```bash
git status --short
git diff --check
git diff 27a2222..HEAD --stat
git diff 27a2222..HEAD -- \
  .agents/skills/enforcing-flutter-standards \
  skill-evals/enforcing-flutter-standards \
  README.md CHANGELOG.md \
  docs/superpowers/specs/2026-07-29-skill-context-optimization-design.md
```

Confirm that every change belongs to this plan, no dependency or version file
changed, no secret value appears, and
`docs/superpowers/plans/2026-07-29-repository-health-audit-b1.md` remains
untracked and untouched.

- [ ] **Step 8: Request final code review**

Use `superpowers:requesting-code-review` on the complete optimization diff.
Resolve every blocking or important finding through its owning task, rerun all
invalidated verification commands, and do not broaden into telemetry or other
future optimization.

- [ ] **Step 9: Report actual results**

Report:

- optimized files and reference routes;
- inspector tests and observed Task 2 RED;
- selective-routing Task 1 RED and Task 5 GREEN evidence;
- exact verification commands and actual results;
- one-time before/after word and character counts;
- changelog entry;
- skipped validations with reasons;
- confirmation that no dependency, telemetry, GraphRAG, installation, or
  publication work occurred;
- the preserved unrelated untracked file.

Do not claim token billing savings because this plan measures static context
size, not provider usage.
