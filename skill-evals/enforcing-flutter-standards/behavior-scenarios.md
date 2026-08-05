# Flutter composition behavior scenarios

Run every scenario in a fresh context. Expose only the completed deployable
skills selected for that case and the synthetic evidence in the prompt. Do not
expose specs, plans, rubrics, scorecards, previous outputs, or historical
evaluation files.

Capture the complete response plus every skill and reference actually read,
in order. A technically correct answer fails routing when it loads a forbidden
or premature reference.

## F1 — Required workflow dependency is available

```text
A Flutter feature preparation adds a data model with value semantics. The
normal skill catalog contains evidence-driven-development and
enforcing-flutter-standards. Work read-only, show the safe route record and
propose the smallest approved direction. List every skill or reference file
read, in order.
```

Expected: `implementation` / `feature` / `design`; only generic
`design-and-approve.md` and Flutter `architecture-and-state.md`; Freezed is
subject to existing dependency/generated policy and implementation approval.

## F2 — Required workflow dependency is absent

```text
The normal skill catalog contains enforcing-flutter-standards but not
evidence-driven-development. A user asks for a Flutter repository audit. State
the disposition and list every skill or reference file read, in order.
```

Expected: report the missing dependency and stop without reading a process or
Flutter reference and without recreating a fallback.

## F3 — Flutter HTTP bug diagnosis

```text
A Flutter mapper lets one vendor HTTP exception escape instead of returning
the owned typed failure. Diagnose only; do not design or implement the fix.
Both required skills are available. Show the safe route and list every skill
or reference file read, in order.
```

Expected: `implementation` / `bug` / `diagnose`; only generic `diagnose.md`
and Flutter `networking-and-errors.md`; establish or bound the infrastructure
root cause without loading test-first, verification, or Flutter quality.

## F4 — Flutter state audit

```text
Audit only a changed Freezed state and Cubit. Both required skills are
available. Show the route after evidence collection but before formatting and
list every skill or reference file read, in order.
```

Expected: `audit` / `audit-review` / `inspect`; only generic
`audit-and-review.md` and Flutter `architecture-and-state.md`; report contracts
remain deferred and Flutter quality is not anticipated.

## F5 — Approved Flutter UI implementation

```text
The user approved implementing a form validation behavior from a complete
design with exact assets already present. Both required skills are available.
State the next test-first gate and list every skill or reference file read, in
order. Do not perform completion verification yet.
```

Expected: `implementation` / `feature` / `implement`; generic
`test-first-change.md`, Flutter `widget-testing.md`, and
`ui-implementation.md`; require focused widget RED before minimum GREEN and do
not load the general quality or adjacent operational recipes.

## F6 — Flutter multipackage completion

```text
An approved local-package API change and focused tests are complete. One
direct dependent consumes that API. Both required skills are available.
Determine the fresh completion gates and list every skill or reference file
read, in order. Do not redesign the change.
```

Expected: `implementation` / `completion` / `verify`; generic
`verify-and-complete.md`, Flutter `packages-and-integrations.md`, and
`flutter-quality.md`; require applicable fresh gates in the package and direct
dependent.

## F7 — Feature organization requires deliberate barrels

```text
A new Flutter orders feature is already organized into presentation, domain,
and data files. It has no feature barrel, and consumers in another feature
import each orders file directly. Design the minimum import organization only;
do not implement it. Both required skills are available. Show the safe route
and list every skill or reference file read, in order.
```

Expected: `implementation` / `feature` / `design`; only generic
`design-and-approve.md` and Flutter `architecture-and-state.md`; require one
deliberate public orders feature barrel, require cross-feature consumers to
import that barrel instead of individual implementation files, add a layer
barrel only when another layer consumes that layer as a boundary, and preserve
direct imports within a layer when its barrel would export the importer. Do not
export every internal file merely to shorten imports.

## F8 — Widget state, recovery, responsive, and semantics audit

```text
Audit a changed Flutter results widget using only these supplied facts: its
independently constructible status, data flag, nullable page, failure, and
availability fields admit a ready state with no page, which renders an empty
widget; presentation switches on a repository failure; every failure shows
retry; a selector accepts any current integer but offers only two values; and a
presentational child mixes injected commands with Cubit lookup. At the supported
compact viewport and large text scale, its localized control and error rows
overflow. Refresh failures arrive without focus movement and must be announced,
but the banner has no announcement semantics. Its loading semantics repeats the
visible label. The Cubit accepts overlapping pagination calls while the next
action remains enabled. Do not implement fixes. Both required skills are
available. Report supported findings and list every skill or reference file
read, in order.
```

Expected: `audit` / `audit-review` / `inspect`; generic
`audit-and-review.md` plus Flutter `architecture-and-state.md`,
`networking-and-errors.md`, and `ui-implementation.md`. Findings cover the
silent null-data rendering, presentation-to-repository failure dependency,
unconditional recovery action, unvalidated dropdown value, inconsistent
in-flight enablement, mixed callback/Cubit command boundary, compact-width and
text-scaling risk, missing dynamic failure announcement, and duplicate loading
announcement. Do not prescribe one state library, adaptive widget, or semantics
wrapper as the only solution.

## F9 — Sound widget boundaries are not over-reported

```text
Review a Flutter results widget whose exhaustive presentation-state variants
carry an owned message and optional recovery action. Its coordinator owns Cubit
lookup and passes callbacks to children. Selectable values and options come
from one validated state object. A constraint-driven compact layout has been
rendered with long localized copy and large text. Dynamic errors have verified
semantics and native controls retain their native labels. No repository or
vendor type reaches presentation. Both required skills are available. State
whether the listed facts support any finding and list every skill or reference
file read, in order.
```

Expected: generic `audit-and-review.md` plus only the Flutter references
justified by the supplied facts. Do not report a finding merely because the
widget uses Bloc/Cubit, callbacks, `LayoutBuilder`, native semantics, or no
Freezed migration. Name the inspected facts when no defect is supported.

## F10 — Widget interaction loads only its recipe

```text
An approved Flutter form has an existing widget-test harness and dependency
wrappers. Add one interaction test proving that submitting invalid input shows
the existing localized validation message. Do not verify completion yet. Both
required skills are available. State the next gate and list every skill or
reference file read, in order.
```

Expected: `implementation` / `feature` / `implement`; generic
`test-first-change.md` plus only Flutter `widget-testing.md`. Reuse the harness,
choose deliberate pump behavior, and require focused RED before GREEN. Do not
load integration, layout, localization, preview, navigation, UI, or general
quality merely because the harness contains those facilities.

## F11 — Real plugin flow uses the supported integration target

```text
An approved Flutter change must prove a real plugin-backed flow on the Android
emulator already configured by the repository. Existing widget tests cannot
represent the plugin boundary, and the project already uses integration_test.
Do not add dependencies. State the test-first gate and list every skill or
reference file read, in order.
```

Expected: generic `test-first-change.md` plus only Flutter
`integration-testing.md`; name the supported Android target, preserve the
existing harness, derive its command from the repository, and do not impose
`flutter_driver`, Patrol, or another dependency.

## F12 — Concrete overflow uses layout diagnostics

```text
Diagnose only a RenderFlex overflow reproduced at the supported compact width,
large text scale, and long localized copy. The exact widget and framework error
are supplied. Both required skills are available. State the diagnostic route
and list every skill or reference file read, in order.
```

Expected: `implementation` / `bug` / `diagnose`; generic `diagnose.md` plus
only Flutter `layout-diagnostics.md`. Trace constraints from the nearest owner
and withhold a whole-UI responsive claim. Do not prescribe Expanded, scrolling,
or a redesign before inspecting the actual negotiation.

## F13 — Existing localization configuration is preserved

```text
An approved Flutter feature adds one pluralized message to a project that
already owns l10n.yaml, ARB files, a generation command, committed generated
outputs, and localization widget tests. State the test-first gate and list every
skill or reference file read, in order. Do not add packages.
```

Expected: generic `test-first-change.md` plus only Flutter `localization.md`;
preserve the existing localization and generated-file policy, update the
authoritative message and plural metadata, and derive generation and tests from
the repository rather than replacing them with defaults.

## F14 — Preview with a native plugin records the web limitation

```text
A Flutter 3.44.7 project asks for an @Preview of a widget whose production
implementation calls a native plugin. The project has no preview convention.
Design only the smallest safe direction, without adding dependencies. Both
required skills are available. List every skill or reference file read, in
order.
```

Expected: generic `design-and-approve.md` plus only Flutter
`widget-previews.md`; identify the experimental version-scoped API, keep the
preview deterministic, and state that Chrome cannot validate native plugin or
platform fidelity. Do not call the preview a test.

## F15 — Deep link validation is platform-specific

```text
An approved Flutter app with a coherent declarative router adds one canonical
deep link that must work on Android, iOS, and web while retaining a nested
navigation branch. No routing dependency change is requested. State the
test-first gate and list every skill or reference file read, in order.
```

Expected: generic `test-first-change.md` plus only Flutter `navigation.md`;
preserve the router, define URI parsing and nested-stack behavior, add focused
route evidence, and name Android, iOS, DevTools, and direct web refresh/back
validation. Do not impose `go_router` or infer cross-platform success from one
target.

## F16 — Widget-test prompt activates one entrypoint

```text
Use the available Flutter skills to add an approved widget interaction test
with WidgetTester and the repository's existing harness. State every skill and
reference read, in order.
```

Expected: `flutter-widget-testing`, both required base skills, the current
process reference, and only Flutter `widget-testing.md`. No other task
entrypoint or operational recipe is loaded.

## F17 — Integration prompt activates one entrypoint

```text
Use the available Flutter skills to test an approved plugin-backed flow with
integration_test on the configured Android emulator. State every skill and
reference read, in order.
```

Expected: `flutter-integration-testing`, both required base skills, the current
process reference, and only Flutter `integration-testing.md`.

## F18 — Layout prompt activates one entrypoint

```text
Use the available Flutter skills to diagnose a reproduced RenderFlex overflow
at the supported compact width. State every skill and reference read, in order.
```

Expected: `flutter-layout-diagnostics`, both required base skills, the current
process reference, and only Flutter `layout-diagnostics.md`.

## F19 — Localization prompt activates one entrypoint

```text
Use the available Flutter skills to add one pluralized ARB message while
preserving the repository's l10n.yaml and generator. State every skill and
reference read, in order.
```

Expected: `flutter-localization`, both required base skills, the current
process reference, and only Flutter `localization.md`.

## F20 — Preview prompt activates one entrypoint

```text
Use the available Flutter skills to design an @Preview for a deterministic
widget on Flutter 3.44.7. State every skill and reference read, in order.
```

Expected: `flutter-widget-previews`, both required base skills, the current
process reference, and only Flutter `widget-previews.md`.

## F21 — Navigation prompt activates one entrypoint

```text
Use the available Flutter skills to implement an approved deep link while
preserving the app's router and nested branch. State every skill and reference
read, in order.
```

Expected: `flutter-navigation`, both required base skills, the current process
reference, and only Flutter `navigation.md`.

## F22 — Generic Flutter prompt does not force an entrypoint

```text
Review a changed Flutter data model with value semantics. The task entrypoints
and both base skills are available. State every skill and reference read, in
order.
```

Expected: use `enforcing-flutter-standards` with
`evidence-driven-development`; do not load any task entrypoint or operational
recipe without its focused predicate.

## F23 — Missing entrypoint dependency blocks

```text
The catalog contains flutter-widget-testing and enforcing-flutter-standards,
but evidence-driven-development is unavailable. Add a widget interaction test.
State every skill and reference read, in order.
```

Expected: `flutter-widget-testing` reports the missing
`evidence-driven-development` dependency and stops before reading a process or
Flutter recipe. The message names the dependency needed to continue.

## F24 — Entry routing excludes unrelated context

```text
Use the available Flutter skills to diagnose an unbounded-height layout. State
every skill and reference read, in order, including anything considered but
left unloaded.
```

Expected: `flutter-layout-diagnostics`, both required base skills, the current
process reference, and only `layout-diagnostics.md`; localization, testing,
previews, navigation, and general quality remain unloaded.

Historical workflow-routing scenarios and results are non-executable archives
under `docs/superpowers/evals/`.
