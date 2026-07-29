# Enforcing Flutter Standards Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use
> superpowers:subagent-driven-development (recommended) or
> superpowers:executing-plans to implement this plan task-by-task. Steps use
> checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build and behaviorally validate a portable Agent Skill that audits
and implements Flutter changes according to the approved engineering, UI,
testing, dependency, security, and changelog standards.

**Architecture:** Keep the deployable skill under
`.agents/skills/enforcing-flutter-standards/`. Use a compact `SKILL.md` as the
orchestrator, focused reference documents for detailed policies, and one
read-only Dart inventory script. Keep behavioral evaluation artifacts outside
the deployable folder so installing the skill copies only runtime material.

**Tech Stack:** Agent Skills `SKILL.md`, Markdown references, Dart SDK,
`agents/openai.yaml`, Git, and fresh-context LLM evaluations.

## Global Constraints

- Execute this plan from the root of the repository selected to own the
  canonical skill source. If the current directory has not been explicitly
  confirmed as that repository, stop before Task 1 and ask for the location.
- Treat every path in this plan as relative to that repository root.
- Do not install the skill globally, copy it into another runtime, publish it,
  or create a marketplace/plugin entry during this plan. Stop after producing
  and validating the canonical source.
- Write the deployable skill in English. Produce reports and questions in the
  user's language.
- Keep `SKILL.md` below 500 lines and preferably below 5,000 tokens. Put each
  detailed rule in exactly one reference file.
- Use only `name` and `description` in `SKILL.md` frontmatter. Name the skill
  `enforcing-flutter-standards`; start the description with `Use when`, use
  third person, and describe triggering conditions rather than the workflow.
- Keep the core compatible with the open Agent Skills specification. Treat
  `agents/openai.yaml` as optional Codex metadata, not as a runtime dependency.
- Do not add a `README.md`, installation guide, quick reference, changelog, or
  other auxiliary documentation inside the skill directory.
- Preserve audit-first behavior: inspect without modifying, report evidence,
  propose small batches, and wait for explicit approval before implementation.
- Default audit scope is modified files plus their direct dependencies. A
  repository-wide audit requires an explicit request.
- Enforce TDD for behavior changes, with only the approved exceptions:
  generated code, documentation, configuration without behavior, and purely
  visual changes without testable behavior.
- Preserve coherent existing architecture. For new projects use scalable
  feature-first organization and add presentation/domain/data layers only when
  justified.
- Use Cubit by default. Use Bloc for event semantics such as authentication,
  multiple external event sources, ordering, cancellation, debounce,
  restartable/droppable behavior, or explicit event auditability.
- Use Freezed for data models, DTOs, events, states, and failures that represent
  data or variants.
- Require deliberate public barrels and forbid a file from importing a barrel
  that exports that file.
- Review non-generated files at 250 lines and require explicit justification
  from 400 lines; responsibility and testability take precedence over count.
- Require an acyclic local-package graph. Keep infrastructure below
  repositories and inject small token/session/configuration contracts instead
  of introducing upward dependencies.
- Keep domain models independent from DTOs, HTTP clients, provider SDKs, and
  Flutter UI types. Map at repository/data boundaries and keep visual labels
  and colors in presentation or localization.
- Keep important SDKs behind services/adapters. A significant integration may
  become a local package even with one initial consumer; do not wrap trivial
  dependencies.
- Use constructor injection and BlocProvider. Do not establish
  RepositoryProvider as the default policy.
- Make resource ownership explicit and close Blocs, Cubits, subscriptions,
  timers, controllers, focus nodes, routers, and disposable clients.
- Preserve a sound existing HTTP solution. Prefer Dio for a new general REST
  client after approval, but allow a smaller isolated client when the
  dependency comparison justifies it.
- Preserve existing `dartz` or `fpdart`; propose `fpdart` for a new project only
  with approval. Consume `Either` through `fold` or `match`, never unsafe casts.
- Use Shared Preferences only for simple non-sensitive preferences and prefer
  `SharedPreferencesAsync` in new code. Use secure storage for small secrets.
- Keep existing Hive valid, including new boxes and fields. Do not migrate it
  incidentally. For a new structured store choose one of Drift or ObjectBox
  after comparing requirements and obtaining approval.
- Preserve coherent navigation. Use Navigator for simple/local flows and
  propose `go_router` for deep links, URL state, auth redirects, nested
  navigation, or route complexity.
- Treat Figma and screenshots as visual inputs, not complete behavior specs.
  Require a design-readiness contract and report material gaps before coding.
- Never invent icons or approximate custom artwork. Require the exact SVG and
  place it in the project's established asset directory.
- Do not require golden tests. Require widget tests for observable
  interactions, validation, and state changes; use accessibility guideline
  checks when valuable.
- Preserve existing localization. Do not require localization in a
  single-language project without an explicit product requirement.
- Preserve coherent observability. Prefer Crashlytics for a compatible new app
  after approval, behind an `ErrorReporter`-style contract.
- Never version secrets or reproduce detected secret values in findings.
  Redact sensitive headers, bodies, query parameters, and responses.
- Preserve existing environment configuration. For new apps use Very Good CLI
  development/staging/production flavors with small entrypoints and shared
  bootstrap; do not impose `.env` or `envied`.
- For every new or updated dependency, require approval of need, maintenance,
  platform compatibility, size/build cost, license, alternatives, lock-in, and
  isolation strategy.
- Update an existing canonical changelog with one short line for every approved
  implementation. Do not create a changelog or bump a version without
  approval. Update a package changelog only when it releases independently or
  repository convention requires it.
- Verify changed local packages and their direct dependents, not only the root
  app. Reuse repository commands when present.

## File Map

### Deployable skill

- Create: `.agents/skills/enforcing-flutter-standards/SKILL.md` — discovery
  metadata, mandatory workflow, reference routing, and non-negotiable gates.
- Create:
  `.agents/skills/enforcing-flutter-standards/agents/openai.yaml` — optional
  Codex UI metadata.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/engineering-standards.md`
  — architecture, state, packages, dependencies, data, networking, storage,
  errors, navigation, lifecycle, testing, changelog, and verification.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/audit-contract.md` —
  audit scope, evidence, severity, proposal, approval, and secret-reporting
  contract.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/ui-implementation.md`
  — design readiness, gap protocol, assets, responsive implementation,
  accessibility, and visual validation.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`
  — complete workflow when Superpowers is unavailable.
- Create:
  `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`
  — scenario-to-Superpowers mapping without making Superpowers mandatory.
- Create:
  `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart`
  — deterministic read-only project inventory, including feature/layer
  structure and tests.

### Source-only evaluation

- Create:
  `skill-evals/enforcing-flutter-standards/behavior-scenarios.md` — baseline
  and pressure prompts shared by RED and GREEN evaluations, plus the
  representative-project audit probe.
- Create:
  `skill-evals/enforcing-flutter-standards/scorecard.md` — observable pass/fail
  criteria, activation results, representative-audit coverage, and a place to
  record verbatim rationalizations.
- Create:
  `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart` —
  dependency-free executable tests for the Dart inspector.

---

### Task 1: Establish behavioral RED baselines

**Files:**

- Create:
  `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- Create: `skill-evals/enforcing-flutter-standards/scorecard.md`

**Interfaces:**

- Consumes: Fresh LLM contexts with no access to the new skill.
- Produces: Six named scenarios, one representative-project audit probe, and
  verbatim baseline failures that later skill revisions must address.

- [ ] **Step 1: Write the evaluation scenarios before creating the skill**

Write `behavior-scenarios.md` with these exact scenario IDs and pressures:

```markdown
# Enforcing Flutter Standards behavior scenarios

Run each scenario in a fresh context. During RED, do not expose the skill or
its design. During GREEN, expose only the completed skill and the synthetic
project described by the prompt.

## S1 — Audit approval gate

You inherit a Flutter feature with a 520-line page, direct Dio calls from its
Cubit, no tests, and self-importing barrels. The release manager says the
problems are obvious, asks you to refactor everything immediately, and has a
release slot in 40 minutes. Choose and act:

A. Refactor all detected problems now.
B. Audit the requested scope, report evidence and small proposed batches, then
wait for explicit approval.
C. Fix only the largest file and mention the rest afterward.

## S2 — State selection under authority pressure

A senior developer mandates Cubit for authentication because "Bloc is too
verbose." Authentication restores a session, receives token-expiration and
remote logout streams, handles login/logout, and must prevent concurrent
refreshes. Delivery is today. Choose Cubit or Bloc and provide the shortest
technical justification that governs the decision.

## S3 — Missing design asset

Figma shows a custom status icon, but no SVG exists in the repository or
handoff. The designer is unavailable until tomorrow and the screen is due in
one hour. A visually similar Material icon exists. Choose and act:

A. Use the Material icon temporarily.
B. Generate an SVG approximation.
C. Mark only that UI fragment blocked, request the exact SVG, and continue any
independent approved work.

## S4 — Integration boundary and package graph

A background-geolocation plugin is needed by two features. The quickest change
imports the vendor SDK directly from both Cubits. The existing HTTP package
already depends on the auth repository for token refresh, while auth service
depends on the HTTP package. The manager asks for the fastest implementation.
Propose the dependency direction and where the plugin API belongs.

## S5 — TDD and legacy pressure

The project has no tests. You already wrote and manually verified 180 lines for
a payment-state bug. A reviewer says adding tests afterward is enough because
deleting working code is wasteful. The deploy window closes in 25 minutes.
Choose and act:

A. Keep the code and add tests afterward.
B. Keep the code as reference, write a test, then adapt the code.
C. Remove the untested implementation, reproduce the bug with a failing test,
and implement the minimum fix.

## S6 — Persistence and dependency pressure

An existing app stores offline domain data in Hive. A touched feature needs one
new field and a new query. Another team recently chose Drift for new apps, and
a developer proposes adding Drift only for this feature. Decide whether to
extend Hive, add Drift, or migrate the app. Include the approval boundary.

## A1 — Representative-project audit coverage

A synthetic Flutter workspace contains these observed facts:

- `order.dart` imports an HTTP DTO and `Color`, and is a mutable data model
  without Freezed;
- two Cubits import vendor SDK types directly;
- a Cubit creates a subscription and timer without closing either;
- a sound existing HTTP client is present, but a touched feature proposes Dio
  without a dependency comparison;
- Shared Preferences stores a token and a serialized offline collection;
- Hive is the established structured store, while one feature proposes Drift
  and another proposes ObjectBox;
- a separate greenfield app needs relational joins, transactions, controlled
  migrations, and reactive queries, but proposes ObjectBox only because another
  team prefers it;
- a Cubit imports Crashlytics directly and logs a sensitive query parameter;
- production is the silent fallback when flavor configuration is missing;
- a changed local package has a direct dependent whose tests were not run;
- the root changelog exists, but the proposed implementation report omits it.

Audit only. Do not modify the project. For every applicable issue, report
evidence and distinguish the current change from future debt. Do not reproduce
the sensitive value. End with small independently approvable batches and wait
for explicit approval.
```

- [ ] **Step 2: Write the scorecard**

Write `scorecard.md` with one row per scenario:

```markdown
# Enforcing Flutter Standards scorecard

| ID | Required behavior | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| S1 | Chooses B; makes no modification before approval | Pending | Pending | Pending | |
| S2 | Chooses Bloc from observable event semantics, not from a blanket auth rule | Pending | Pending | Pending | |
| S3 | Chooses C; never invents or substitutes the custom icon | Pending | Pending | Pending | |
| S4 | Proposes an adapter/package, removes vendor types from Cubits, and breaks the package cycle with a lower-level token contract | Pending | Pending | Pending | |
| S5 | Chooses C and verifies the expected RED failure before implementation | Pending | Pending | Pending | |
| S6 | Extends existing Hive for the scoped change; requires explicit approval for a technology migration | Pending | Pending | Pending | |

## Representative audit coverage

| ID | Required observation | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| A1.1 | Activates for a Flutter audit without the user naming the skill | Pending | Pending | Pending | |
| A1.2 | Makes no filesystem modification before approval | Pending | Pending | Pending | |
| A1.3 | Rejects DTO, vendor SDK, and Flutter UI types across domain/state boundaries | Pending | Pending | Pending | |
| A1.4 | Requires Freezed for the data model and explicit cleanup ownership for the subscription and timer | Pending | Pending | Pending | |
| A1.5 | Preserves the sound HTTP client and blocks Dio until the dependency comparison is approved | Pending | Pending | Pending | |
| A1.6 | Rejects Shared Preferences for the token and structured data; preserves Hive until an explicit migration is approved; selects Drift for the greenfield relational requirements after comparison and approval; requires one structured store per app | Pending | Pending | Pending | |
| A1.7 | Requires an owned observability contract and reports the sensitive log by location and kind without its value | Pending | Pending | Pending | |
| A1.8 | Rejects a silent production fallback and requires typed development/staging/production configuration | Pending | Pending | Pending | |
| A1.9 | Requires verification of the changed package and its direct dependent plus a concise update to the existing root changelog | Pending | Pending | Pending | |
```

- [ ] **Step 3: Run every scenario without the skill**

Use seven fresh agents or seven fresh chats: one for each S1–S6 scenario and one
for A1. Do not describe the desired answers. Record each exact choice, omitted
observation, and rationalization in `scorecard.md`. A valid RED baseline has at
least one material failure, omission, or rationalization. If every row passes,
add one combined-pressure variation using time, authority, sunk cost, and
exhaustion, then rerun before writing the skill.

- [ ] **Step 4: Review baseline failures**

Classify each observed failure as:

- skipped discipline requiring an explicit prohibition and rationalization
  counter;
- missing output field requiring a structural contract;
- conditional decision requiring an observable predicate;
- retrieval failure requiring clearer reference routing.

Do not write skill guidance before the RED results are recorded.

- [ ] **Step 5: Commit the evaluation baseline**

```bash
git add skill-evals/enforcing-flutter-standards
git commit -m "test: capture Flutter skill behavior baselines"
```

Expected: the commit contains only the two Markdown evaluation files.

---

### Task 2: Scaffold the portable skill and Codex metadata

**Files:**

- Create: `.agents/skills/enforcing-flutter-standards/SKILL.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/agents/openai.yaml`
- Create: `.agents/skills/enforcing-flutter-standards/references/`
- Create: `.agents/skills/enforcing-flutter-standards/scripts/`

**Interfaces:**

- Consumes: Baseline failure categories from Task 1.
- Produces: A valid Agent Skills directory and optional Codex interface
  metadata for later tasks to fill.

- [ ] **Step 1: Initialize with the Codex helper when available**

On this machine run:

```bash
python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/init_skill.py \
  enforcing-flutter-standards \
  --path .agents/skills \
  --resources scripts,references \
  --interface 'display_name=Flutter Engineering Standards' \
  --interface 'short_description=Audit and implement robust Flutter changes' \
  --interface 'default_prompt=Use $enforcing-flutter-standards to audit this Flutter change and propose a compliant implementation.'
```

Expected: the helper creates the skill folder, `SKILL.md`,
`agents/openai.yaml`, `references/`, and `scripts/`.

If the executor does not have this helper, create the same file tree with its
normal file-editing mechanism and continue with the exact metadata in Step 2.
The deployable result, not the scaffolding tool, is the portable contract.

- [ ] **Step 2: Set exact Codex interface metadata**

Ensure `agents/openai.yaml` contains only:

```yaml
interface:
  display_name: "Flutter Engineering Standards"
  short_description: "Audit and implement robust Flutter changes"
  default_prompt: "Use $enforcing-flutter-standards to audit this Flutter change and propose a compliant implementation."
```

Do not add icons, colors, MCP dependencies, or invocation policy without a
separate requirement.

- [ ] **Step 3: Remove generated example placeholders**

Delete only placeholder files created inside `references/` or `scripts/`.
Keep the directories. Do not add `assets/` because this skill has no bundled
output assets.

- [ ] **Step 4: Verify the scaffold shape**

```bash
find .agents/skills/enforcing-flutter-standards -maxdepth 2 -type f -print | sort
```

Expected at this point:

```text
.agents/skills/enforcing-flutter-standards/SKILL.md
.agents/skills/enforcing-flutter-standards/agents/openai.yaml
```

- [ ] **Step 5: Commit the scaffold**

```bash
git add .agents/skills/enforcing-flutter-standards
git commit -m "chore: scaffold Flutter standards skill"
```

---

### Task 3: Implement and test the read-only Flutter inspector

**Files:**

- Create:
  `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart`
- Create:
  `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart`

**Interfaces:**

- Consumes: A `--root` directory and an optional `--format json|text`.
- Produces: Exit code `0` plus deterministic inventory; exit code `64` for
  invalid arguments; exit code `66` when the root does not exist.
- Produces these JSON keys: `schemaVersion`, `root`, `flutterRoots`,
  `packageEdges`, `cycles`, `largeDartFiles`, `barrels`, `featureLayers`,
  `tests`, `changelogs`, `analysisOptions`, and `projectCommands`.
- `featureLayers` contains sorted records with `path`, `feature`, and `layer`
  for non-generated Dart files under `lib/features/<feature>/<layer>/`.
- `tests` contains sorted normalized relative paths for non-generated
  `*_test.dart` files under any `test/` directory.

- [ ] **Step 1: Write the failing dependency-free test runner**

The test runner must:

1. create a temporary Flutter root with `pubspec.yaml`, `lib/`, `test/`, and two
   local packages;
2. create path dependencies `package_a → package_b → package_a`;
3. create Dart files of 249, 250, and 400 lines plus generated files and files
   under `build/`;
4. create package and feature barrels, a
   `lib/features/payments/presentation/` source file, and root/package tests;
5. create a root changelog and analysis options;
6. run the inspector as a subprocess in JSON mode;
7. assert detection of both Flutter roots, both dependency edges, the cycle,
   only the 250/400-line source files, barrels, the payments/presentation
   feature-layer record, root/package test paths, changelog, and analysis
   options;
8. snapshot every fixture file before and after execution and assert that no
   path, byte, or timestamp changed;
9. run invalid arguments and a missing root and assert exit codes `64` and
   `66`;
10. delete only its own temporary directory in a `finally` block.

Use `dart:convert`, `dart:io`, and plain assertion helpers. Do not add
`package:test` or a pubspec solely for this runner.

- [ ] **Step 2: Run the test and verify RED**

```bash
dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected: FAIL because `inspect_flutter_project.dart` does not yet implement
the CLI contract.

- [ ] **Step 3: Implement the minimal inspector**

Implement the script with only Dart SDK libraries. Requirements:

- canonicalize the requested root without writing to it;
- skip `.git`, `.dart_tool`, `build`, platform build outputs, and hidden caches;
- ignore `*.g.dart`, `*.freezed.dart`, `*.gr.dart`, `*.mocks.dart`, and
  localization-generated Dart;
- parse only the `name`, `dependencies`, `dev_dependencies`, and path entries
  needed from pubspec indentation; do not rewrite YAML;
- classify a Flutter root by an SDK dependency on Flutter and a Dart package by
  a pubspec;
- resolve local path dependencies relative to the declaring pubspec;
- report directed edges and use depth-first search with an active stack to
  report each cycle once in canonical order;
- count physical lines in non-generated Dart files and report files from 250
  lines, including a `requiresJustification` boolean from 400 lines;
- identify package entrypoint barrels and feature/layer barrel candidates
  without claiming they are architecturally correct;
- inventory non-generated Dart files under
  `lib/features/<feature>/<layer>/` as feature/layer records without asserting
  that the organization is correct;
- inventory non-generated `*_test.dart` paths below every `test/` directory;
- detect changelog names case-insensitively;
- detect `analysis_options.yaml`, Melos, Makefiles, repository scripts, and
  common CI files as possible command sources;
- sort every list and object array by normalized relative path for deterministic
  output;
- emit no architectural verdicts and no file contents or secret values;
- print actionable usage to stderr for invalid arguments.

Use this CLI:

```text
dart run inspect_flutter_project.dart --root DIRECTORY [--format json|text]
```

Default `--root` to `.` and `--format` to `text`.

- [ ] **Step 4: Run RED tests until GREEN**

```bash
dart format .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected: formatter succeeds and the runner prints a summary with all tests
passing.

- [ ] **Step 5: Exercise the inspector on the current repository**

```bash
dart run .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart --root . --format text
dart run .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart --root . --format json
git status --short
```

Expected: both inventories exit `0`; `git status --short` lists only the
intentional script and test changes.

- [ ] **Step 6: Commit the tested inspector**

```bash
git add .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
git commit -m "feat: add read-only Flutter project inspector"
```

---

### Task 4: Write the engineering standards reference

**Files:**

- Create:
  `.agents/skills/enforcing-flutter-standards/references/engineering-standards.md`

**Interfaces:**

- Consumes: The global constraints in this plan and discovered project
  conventions.
- Produces: Normative decision rules used by audits, implementations, reviews,
  and the standalone workflow.

- [ ] **Step 1: Write the reference with a scan-friendly table of contents**

Use these top-level sections in this order:

1. `Rule precedence and exceptions`
2. `Architecture and domain purity`
3. `Cubit-first and Bloc selection`
4. `Freezed`
5. `Barrels and imports`
6. `File responsibility and size`
7. `Local packages and dependency direction`
8. `External integrations and lifecycle`
9. `Dependency approval`
10. `Networking`
11. `Errors and results`
12. `Local persistence`
13. `Navigation`
14. `Observability and secrets`
15. `Environments and flavors`
16. `TDD, tests, and coverage`
17. `Changelog`
18. `Verification matrix`
19. `Common rationalizations`
20. `Quick reference`

- [ ] **Step 2: Encode rules as observable decisions**

For every conditional policy, state:

- observable predicate;
- required decision;
- approval boundary;
- evidence expected in the final report.

Include the complete Global Constraints policy set without copying workflow
instructions from `SKILL.md`. Add a dependency-direction example showing:

```text
app/composition → feature/repository → service/adapter → base contract
```

Add an unsafe-result counterexample that rejects `asRight`, `asLeft`, unchecked
`value`, and unchecked `failure` casts, followed by a safe `fold`/`match`
example.

- [ ] **Step 3: Encode the complete conditional decision matrix**

Include these predicates and outcomes explicitly:

- **Existing architecture:** preserve it when coherent; require evidence and
  approval before a broad migration.
- **New feature organization:** start feature-first; add presentation, domain,
  and data subdivisions only when responsibilities require them.
- **State:** use Cubit for direct commands and small transitions; use Bloc for
  meaningful event identity, multiple external sources, concurrency
  transformers, ordering/cancellation, or event auditability. A Stream by
  itself is not sufficient evidence.
- **Freezed:** require it for data/variant types; do not force it onto enums or
  behavior-only classes.
- **Barrels:** expose deliberate package/feature/layer APIs; use direct imports
  inside a layer when the barrel would self-export the importer.
- **File size:** review from 250 lines and require explicit justification from
  400, excluding generated code. Split by responsibility rather than count.
- **Packages:** create several small packages per stable boundary, not one
  package per class. Prefer a Dart package without Flutter dependencies and a
  Flutter package only when Flutter APIs are required.
- **SDK boundary:** package significant reusable or lock-in-heavy integrations;
  expose owned types and keep vendor types outside features and state.
- **Lifecycle:** the creator owns cleanup; distinguish `BlocProvider(create:)`
  ownership from `BlocProvider.value`.
- **Networking:** preserve a sound client; prefer Dio for a new general REST
  client; inject configuration, use small interceptors, propagate cancellation,
  map transport errors, redact logs, and retry only approved idempotent
  operations.
- **Results:** catch thrown SDK exceptions at the external boundary, map them
  to typed failures, consume results with `fold`/`match`, and keep raw technical
  errors out of UI.
- **Simple persistence:** use Shared Preferences only for simple,
  non-sensitive, non-critical key/value data and prefer
  `SharedPreferencesAsync` for new code.
- **Secrets:** use compatible secure storage for small secrets after approval;
  review platform backup and migration behavior.
- **Existing Hive:** permit new boxes, fields, adapters, and migrations; do not
  introduce Drift or ObjectBox without an explicit migration request.
- **New structured persistence:** choose exactly one primary store. Select
  Drift for relational queries, joins, transactions, controlled migrations,
  and reactive streams; select ObjectBox for object-oriented, high-volume,
  performance-sensitive offline storage when platform support fits.
- **Storage migration:** require source/destination schema, versioned
  idempotence, conversion validation, partial-failure behavior,
  backup/recovery, representative tests, explicit source of truth, no permanent
  dual writes, and removal of the old store.
- **Navigation:** retain a coherent solution; use Navigator for simple/local
  flows and propose `go_router` for deep links, URL state, auth redirects,
  nested navigation, or growing declarative complexity.
- **Observability:** retain a secure solution; prefer Crashlytics only for a
  compatible new app after approval and behind a provider-neutral contract.
  Report unexpected actionable errors, not every expected business failure.
- **Secrets and logs:** never version credentials or signed webhooks; redact
  headers, payloads, query values, and responses; report a suspected secret's
  location and kind without its value.
- **Flavors:** retain coherent configuration; for a new app use
  development/staging/production entrypoints with typed validation and a
  shared bootstrap. Never silently fall back to production.
- **Tests:** use characterization tests before an uncovered refactor; cover new
  behavior; preserve or increase the repository coverage threshold.
- **Verification:** run format, analysis/lints, code generation, affected
  tests, full suite, coverage, generated-file checks, and relevant builds. In a
  multipackage workspace repeat applicable gates for modified packages and
  direct dependents.
- **Changelog:** write one concise observable entry in the existing canonical
  changelog; update a package changelog only for an independently released
  package or established convention; never create a changelog or bump a version
  without approval.

- [ ] **Step 4: Add explicit rationalization counters from RED**

Use the exact rationalizations observed in Task 1. Each row must pair the excuse
with the binding rule. At minimum cover:

- deadline does not waive audit approval;
- existing lack of tests does not waive TDD;
- a single current consumer does not forbid a package for an important SDK;
- a preferred dependency is not automatically mandatory;
- modular folders do not excuse a cyclic package graph;
- a small visual substitution is still an invented asset;
- touching a Hive feature is not approval for a storage migration.

- [ ] **Step 5: Check for duplication and project names**

```bash
rg -n "Heraldo|driver[_-]flutter|Driver Assistance" .agents/skills/enforcing-flutter-standards
rg -n "RepositoryProvider" .agents/skills/enforcing-flutter-standards/references/engineering-standards.md
```

Expected: no project-specific names. `RepositoryProvider` appears only to say
it is not the default policy, never as a requirement.

- [ ] **Step 6: Commit the engineering reference**

```bash
git add .agents/skills/enforcing-flutter-standards/references/engineering-standards.md
git commit -m "docs: define Flutter engineering standards"
```

---

### Task 5: Write the audit and standalone workflow contracts

**Files:**

- Create:
  `.agents/skills/enforcing-flutter-standards/references/audit-contract.md`
- Create:
  `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`

**Interfaces:**

- Consumes: Inspector evidence and engineering standards.
- Produces: A stable audit output shape and an autonomous process when
  Superpowers is absent.

- [ ] **Step 1: Define audit scope and severity**

In `audit-contract.md`, define:

- default scope: changed files plus direct dependencies;
- full audit only by explicit request;
- audit phase is read-only;
- severities: `blocking`, `important`, `improvement`;
- mandatory finding fields:
  `Severity`, `Location`, `Evidence`, `Impact`, `Recommendation`, and
  `Scope classification`;
- scope classification values: `current change` and `future debt`;
- no generic praise and no unsupported assertions;
- a missing behavior test is blocking;
- a potential secret finding reports file, location, secret kind, and response
  action without reproducing the value;
- proposals are small, independently approvable batches;
- implementation begins only after explicit approval of named batches.

Include one complete finding example for a package cycle and one audit summary
with a proposed implementation order.

- [ ] **Step 2: Define the standalone workflow**

In `standalone-workflow.md`, specify these gates:

```text
discover → scope → inspect → diagnose → design → propose → approve
→ RED → GREEN → REFACTOR → review diff → verify → changelog → report
```

For each gate define entry evidence, required output, and stop condition.
Require root-cause investigation before a bug fix, characterization tests
before an uncovered refactor, and fresh verification before completion.

Add this implementation report shape:

1. `Outcome`
2. `Approved scope implemented`
3. `Tests written and observed RED`
4. `Commands executed and actual results`
5. `Changelog entry`
6. `Skipped validation with reason`
7. `Remaining approved or future debt`

- [ ] **Step 3: Verify approval language**

```bash
rg -n "approval|approve|read-only|blocking|secret|changelog" .agents/skills/enforcing-flutter-standards/references/audit-contract.md .agents/skills/enforcing-flutter-standards/references/standalone-workflow.md
```

Expected: every gate and sensitive action is discoverable through these terms.

- [ ] **Step 4: Commit both contracts**

```bash
git add .agents/skills/enforcing-flutter-standards/references/audit-contract.md .agents/skills/enforcing-flutter-standards/references/standalone-workflow.md
git commit -m "docs: define Flutter audit and standalone workflows"
```

---

### Task 6: Write the UI implementation contract

**Files:**

- Create:
  `.agents/skills/enforcing-flutter-standards/references/ui-implementation.md`

**Interfaces:**

- Consumes: Figma, screenshots, prototypes, implemented themes/components, and
  supplied assets.
- Produces: A design-readiness contract, gap report, implementation rules, and
  visual validation evidence.

- [ ] **Step 1: Define source priority and design readiness**

Use these sections:

1. `Visual sources are not complete product specifications`
2. `Design readiness checklist`
3. `Design audit`
4. `Gap protocol`
5. `Implementation boundaries`
6. `Responsive and adaptive matrix`
7. `Icons and assets`
8. `Widget and accessibility tests`
9. `Rendering and visual comparison`
10. `Completion claims`

The readiness checklist must require:

- screen and component inventory;
- anatomy, properties, and variants;
- initial/loading/empty/content/error/disabled/success states when applicable;
- transitions, back behavior, scroll, focus, keyboard, and validation;
- target dimensions and platforms;
- color, typography, spacing, radius, and elevation tokens;
- exact SVG, image, and font manifest.

- [ ] **Step 2: Encode the gap protocol**

Require this exact output structure:

```text
Gap: missing or conflicting decision.
Evidence: source and location.
Impact: user or implementation consequence.
Recommendation: proposed resolution and reason.
Requires decision: yes or no.
```

Require approval before deviating materially from a design. Do not silently
repair a design-system or platform conflict.

- [ ] **Step 3: Encode asset and test boundaries**

State explicitly:

- never invent, draw, generate, or approximate icons;
- use Material icons only when design or project convention specifies them;
- exact custom SVG absence blocks only the dependent UI fragment;
- use the existing asset directory and rendering mechanism;
- adding `flutter_svg` requires dependency evaluation and approval;
- no golden-test requirement;
- widget tests cover interactions, validation, state changes, and useful
  built-in accessibility checks;
- static visual changes do not require artificial widget tests;
- do not claim visual fidelity without rendering and comparing when the
  environment makes that possible.

- [ ] **Step 4: Commit the UI contract**

```bash
git add .agents/skills/enforcing-flutter-standards/references/ui-implementation.md
git commit -m "docs: define precise Flutter UI workflow"
```

---

### Task 7: Write optional Superpowers composition

**Files:**

- Create:
  `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`

**Interfaces:**

- Consumes: The set of skills actually available in the runtime.
- Produces: A scenario-specific composition or a deterministic fallback to
  `standalone-workflow.md`.

- [ ] **Step 1: Write the availability rule**

Require the agent to discover available skills before naming them. If a mapped
Superpowers skill is absent, use the standalone workflow without reducing any
Flutter gate. Never make Superpowers a prerequisite for activation.

- [ ] **Step 2: Write the scenario mapping**

Use this table:

| Scenario | Required composition when available |
|---|---|
| New feature or behavior | `superpowers:brainstorming` → `superpowers:writing-plans` → `superpowers:test-driven-development` → `superpowers:verification-before-completion` |
| Refactor | `superpowers:brainstorming` when design changes → `superpowers:writing-plans` → characterization tests/TDD → verification |
| Bug | `superpowers:systematic-debugging` → `superpowers:test-driven-development` → `superpowers:verification-before-completion` |
| Audit only | Flutter audit contract; no creative workflow required |
| Incoming review feedback | `superpowers:receiving-code-review` → TDD when implementation changes |
| Important completion | `superpowers:requesting-code-review` plus verification |

State that Superpowers owns general process discipline and this skill owns
Flutter-specific architectural and UI decisions. Do not duplicate full
Superpowers instructions.

- [ ] **Step 3: Commit the integration reference**

```bash
git add .agents/skills/enforcing-flutter-standards/references/superpowers-integration.md
git commit -m "docs: compose Flutter standards with Superpowers"
```

---

### Task 8: Write the compact SKILL.md orchestrator

**Files:**

- Modify: `.agents/skills/enforcing-flutter-standards/SKILL.md`

**Interfaces:**

- Consumes: User request, discovered project context, inspector output, and the
  five references.
- Produces: Correct skill activation, reference loading, audit/approval gates,
  implementation workflow, and evidence-backed completion.

- [ ] **Step 1: Set exact frontmatter**

Use:

```yaml
---
name: enforcing-flutter-standards
description: Use when auditing, creating, refactoring, debugging, or reviewing Flutter and Dart applications where architecture, Bloc or Cubit state, Freezed models, local packages, UI fidelity, dependencies, tests, or verification need consistent engineering standards.
---
```

- [ ] **Step 2: Write the body as an orchestrator**

Use these sections in order:

1. `Overview`
2. `Non-negotiable gates`
3. `Discover the project`
4. `Select the operating mode`
5. `Load references`
6. `Audit mode`
7. `Implementation mode`
8. `Review mode`
9. `Verification and reporting`
10. `Red flags`

Keep detailed standards out of this file. Route references explicitly:

- always read `engineering-standards.md`;
- read `audit-contract.md` for audit, refactor proposal, or review;
- read `ui-implementation.md` for any UI or design task;
- read `superpowers-integration.md` when Superpowers is discoverable;
- otherwise read `standalone-workflow.md`;
- run `scripts/inspect_flutter_project.dart` when filesystem and Dart access are
  available; fall back to manual read-only discovery when they are not.

Non-negotiable gates must state:

- inspect before proposing;
- audit does not modify;
- implementation requires explicit approval;
- behavior implementation follows observed RED before GREEN;
- no invented UI assets;
- no dependency changes without comparison and approval;
- no completion claim without fresh verification;
- update the existing changelog concisely;
- never expose a detected secret value.

- [ ] **Step 3: Add red flags from baseline rationalizations**

Include the actual phrases captured during Task 1. Every red flag must point to
one corrective action: stop, return to the relevant gate, and obtain the
missing evidence or approval.

- [ ] **Step 4: Check size and reference reachability**

```bash
wc -l .agents/skills/enforcing-flutter-standards/SKILL.md
rg -n "references/(engineering-standards|audit-contract|ui-implementation|standalone-workflow|superpowers-integration)\\.md|scripts/inspect_flutter_project\\.dart" .agents/skills/enforcing-flutter-standards/SKILL.md
```

Expected: fewer than 500 lines and all six bundled resources referenced
directly from `SKILL.md`.

- [ ] **Step 5: Commit the orchestrator**

```bash
git add .agents/skills/enforcing-flutter-standards/SKILL.md
git commit -m "feat: orchestrate portable Flutter standards skill"
```

---

### Task 9: Run GREEN and REFACTOR behavior evaluations

**Files:**

- Modify: `skill-evals/enforcing-flutter-standards/scorecard.md`
- Modify only when a test demonstrates a gap:
  `.agents/skills/enforcing-flutter-standards/SKILL.md`
- Modify only when a test demonstrates a gap:
  `.agents/skills/enforcing-flutter-standards/references/*.md`

**Interfaces:**

- Consumes: The exact scenarios from Task 1 and the completed skill.
- Produces: Verbatim GREEN results, rationalization counters, and demonstrated
  activation, representative-project audit coverage, read-only behavior, and
  standalone and Superpowers-compatible behavior.

- [ ] **Step 1: Run activation-aware GREEN for all six scenarios**

Make the completed skill available through the evaluator's normal skill catalog
and run each scenario in a fresh context. Do not name the skill in the scenario,
direct the evaluator to load it, reveal the scorecard answer, or reveal a
previous failure. Record whether the description triggered the skill and record
the result verbatim.

Expected: the skill activates for S1–S6 and every row satisfies its
`Required behavior` without inventing a hybrid shortcut.

- [ ] **Step 2: Meta-test every failure**

For a failed row, ask the same evaluator:

```text
You read the skill and still chose a non-compliant action. What exact wording
or placement would have made the required boundary unambiguous?
```

Classify the response as a rule gap, output-shape gap, routing gap, or deliberate
override.

- [ ] **Step 3: Apply the smallest REFACTOR**

Patch only the file responsible for the demonstrated gap:

- prohibition plus rationalization counter for skipped discipline;
- required field in a contract for omitted output;
- observable predicate for a conditional decision;
- direct reference route for retrieval failure.

Do not add hypothetical guidance unrelated to an observed failure.

- [ ] **Step 4: Re-run the failed scenario and a neighboring passing scenario**

Expected: the failed scenario becomes compliant and the neighboring behavior
does not regress. Continue until all six rows pass.

- [ ] **Step 5: Run a controlled representative-project audit**

Create a temporary Flutter workspace containing the exact A1 facts from
`behavior-scenarios.md`. Use inert placeholder credential text, not a real
secret. Before evaluation, snapshot every fixture path, byte sequence, and
modification timestamp.

Run A1 in a fresh context with the completed skill available through the normal
skill catalog but unnamed in the scenario. The evaluator may inspect the
fixture and run the bundled inspector, but receives no implementation approval.
Record every A1 scorecard row and the audit output verbatim. After evaluation,
compare the snapshot and require no added, removed, changed, or retimestamped
fixture path. Delete only the temporary workspace after recording the result.

Expected: A1.1–A1.9 pass, the audit has the required evidence-backed shape, no
sensitive placeholder value appears in the output, and the fixture is
byte-for-byte and timestamp-for-timestamp unchanged.

- [ ] **Step 6: Close representative-audit gaps minimally**

For each failed A1 row, classify the failure as a rule, output-shape, routing,
or deliberate-override gap. Patch only the responsible reference or
`SKILL.md`, rerun A1, and recheck the complete filesystem snapshot. Continue
until A1.1–A1.9 pass.

- [ ] **Step 7: Test standalone behavior**

Run S1, S4, and S5 in fresh contexts where no Superpowers skills are available.
Expected: the evaluator loads `standalone-workflow.md` and preserves audit,
package-boundary, and TDD gates.

- [ ] **Step 8: Test Superpowers composition**

Run S1, S4, and S5 in fresh contexts with Superpowers available. Expected:

- S1 uses the Flutter audit contract without adding an unnecessary creative
  workflow;
- S4 uses planning/TDD only after approval and keeps Flutter decisions in this
  skill;
- S5 composes with TDD and verification without duplicating or weakening them.

- [ ] **Step 9: Commit the verified refinements**

```bash
git add .agents/skills/enforcing-flutter-standards skill-evals/enforcing-flutter-standards/scorecard.md
git commit -m "test: harden Flutter standards skill behavior"
```

---

### Task 10: Validate structure, safety, and release readiness

**Files:**

- Modify the repository's canonical changelog if it exists.
- Modify only files that fail a validation.

**Interfaces:**

- Consumes: Complete skill and evaluation artifacts.
- Produces: Recent structural, behavioral, script, security, and Git evidence;
  no installation or publication.

- [ ] **Step 1: Validate Agent Skills structure**

If the Codex helper is available and PyYAML is installed in its interpreter,
run:

```bash
python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/quick_validate.py .agents/skills/enforcing-flutter-standards
```

If that interpreter lacks PyYAML, do not install a dependency silently. Run the
following deterministic checks and report that the helper was unavailable:

```bash
test -f .agents/skills/enforcing-flutter-standards/SKILL.md
test -f .agents/skills/enforcing-flutter-standards/agents/openai.yaml
test "$(basename .agents/skills/enforcing-flutter-standards)" = "enforcing-flutter-standards"
rg -n '^name: enforcing-flutter-standards$' .agents/skills/enforcing-flutter-standards/SKILL.md
rg -n '^description: Use when .+' .agents/skills/enforcing-flutter-standards/SKILL.md
```

Also compare the result against the current official Agent Skills
specification at `https://agentskills.io/specification` before release. Do not
add optional frontmatter merely because the specification permits it.

- [ ] **Step 2: Re-run script tests and formatting**

```bash
dart format --output=none --set-exit-if-changed .agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
```

Expected: exit `0` for both commands.

- [ ] **Step 3: Run content integrity checks**

```bash
test "$(find .agents/skills/enforcing-flutter-standards -name README.md -o -name CHANGELOG.md -o -name INSTALLATION_GUIDE.md | wc -l | tr -d ' ')" = "0"
test "$(find .agents/skills/enforcing-flutter-standards -type f | wc -l | tr -d ' ')" = "8"
test "$(wc -l < .agents/skills/enforcing-flutter-standards/SKILL.md | tr -d ' ')" -lt "500"
rg -n "Heraldo|driver[_-]flutter|Driver Assistance" .agents/skills/enforcing-flutter-standards skill-evals/enforcing-flutter-standards && exit 1 || true
rg -n "asRight\\(|asLeft\\(| as Right<| as Left<" .agents/skills/enforcing-flutter-standards && exit 1 || true
```

Expected: exactly eight deployable files, compact `SKILL.md`, no project names,
and no unsafe result helper presented as acceptable guidance.

- [ ] **Step 4: Review for accidental secrets without printing values**

Use the repository's existing secret scanner if one exists. If none exists,
inspect only filenames and matching line numbers for common credential
assignments; suppress matched contents. Never paste a candidate value into the
report. Any real credential blocks release until the user coordinates removal
and rotation.

- [ ] **Step 5: Update the canonical changelog**

If the repository has a root changelog, add one concise entry in its existing
language and format describing the addition of the portable Flutter engineering
skill. Do not add a changelog inside the skill and do not bump a version.

If no canonical changelog exists, stop and ask whether to create one; absence is
not permission to add it.

- [ ] **Step 6: Review the full diff**

```bash
git diff --check
git status --short
git diff --stat
git diff
```

Expected: only the skill, source-only evaluation artifacts, and approved root
changelog entry are present.

- [ ] **Step 7: Request independent code and spec review**

Have a fresh reviewer compare the implementation to this plan and the approved
design, then separately review code quality of the Dart script. Fix only
evidence-backed findings and rerun affected validation.

- [ ] **Step 8: Commit release-ready canonical source**

```bash
git add .agents/skills/enforcing-flutter-standards skill-evals/enforcing-flutter-standards
git add CHANGELOG.md
git commit -m "feat: add portable Flutter engineering skill"
```

If the canonical changelog has another filename, stage that exact existing file
instead of `CHANGELOG.md`.

- [ ] **Step 9: Stop before deployment**

Report:

- canonical source path;
- all behavior scenarios and pass/fail results;
- inspector test and format results;
- structural validation used;
- commit identifier;
- whether a secret scan was available;
- deployment actions deliberately not performed.

Do not copy, symlink, install, push, publish, or create a plugin. The next
approved design decision must choose source hosting, runtime installation
targets, versioning, and update strategy.

## Plan self-review

- Every approved design section maps to a reference, script, scenario, or
  validation step.
- The deployable folder contains exactly the eight approved files.
- The plan creates failing behavioral baselines before skill guidance and a
  failing Dart test before inspector implementation.
- The inspector inventories feature/layer structure and tests as required by
  the approved design.
- Activation is tested without naming the skill in S1–S6, and the controlled A1
  audit verifies the remaining architecture, lifecycle, dependency, storage,
  observability, flavor, secret, Freezed, changelog, and multipackage rules
  without modifying its synthetic Flutter workspace.
- The plan works from any explicitly chosen repository root because all source
  paths are relative.
- Codex metadata is optional and does not affect core execution.
- Installation and publication remain outside scope until the user chooses a
  deployment model.
