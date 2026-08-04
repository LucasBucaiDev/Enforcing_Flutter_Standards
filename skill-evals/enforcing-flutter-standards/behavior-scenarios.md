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
`test-first-change.md`, Flutter `flutter-quality.md`, and
`ui-implementation.md`; require focused widget RED before minimum GREEN.

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

Historical workflow-routing scenarios and results are non-executable archives
under `docs/superpowers/evals/`.
