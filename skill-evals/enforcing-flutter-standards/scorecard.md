# Flutter composition scorecard

## Active composition suite

| ID | Required behavior | Initial RED | Final GREEN | Observed evidence |
|---|---|---|---|---|
| F1 | Generic feature design plus Flutter architecture/state only | Missing dependency and excessive context | Pass | Fresh isolated run read both cores, `design-and-approve.md`, then `architecture-and-state.md`; route was `implementation` / `feature` / `design` and Freezed remained conditional on project policy and approval. |
| F2 | Missing generic dependency blocks without fallback | Local fallback continued | Pass | Fresh catalog containing only Flutter read its core, reported the required dependency missing, read no reference, and stopped. |
| F3 | Generic diagnosis plus Flutter networking only | Missing dependency and premature context | Pass after routing fix | Final isolated rerun showed `implementation` / `bug` / `diagnose` and read both cores, `diagnose.md`, then `networking-and-errors.md`; no quality, design, or completion reference. |
| F4 | Generic audit plus Flutter architecture; report deferred | Local audit ownership and premature template | Pass after routing fix | Final isolated rerun showed `audit` / `audit-review` / `inspect` and read both cores, `audit-and-review.md`, then `architecture-and-state.md`; report and Flutter quality remained unloaded. |
| F5 | Approved UI behavior uses test-first plus focused widget/UI recipes | Local fallback composition | Pending P3 rerun | The pre-P3 run loaded `flutter-quality.md`; P3 changes the expected route to `widget-testing.md` plus `ui-implementation.md`, so fresh isolated evidence is required. |
| F6 | Completion covers local package and direct dependent | Excessive local workflow context | Pass | Fresh isolated run read both cores, `verify-and-complete.md`, `packages-and-integrations.md`, then `flutter-quality.md`; it required fresh gates in both package and dependent. |
| F7 | Organized features still expose deliberate barrels and consumers use them | Missing feature barrel; consumers retained per-file cross-feature imports | Pass | Fresh isolated run read both cores, `design-and-approve.md`, then `architecture-and-state.md`; it required one deliberate feature barrel, replaced cross-feature implementation imports, kept internal imports direct, and rejected layer barrels without an observed cross-layer consumer. |
| F8 | Widget audit catches invalid states, layer leaks, recovery, interaction, adaptive, and semantics defects | Existing contracts omitted the focused clauses | Pass after evidence completion | The first isolated run reported six supported defects and correctly withheld three findings whose runtime and ownership evidence was absent. With that evidence supplied, the fresh rerun reported all nine supported findings and read only `audit-and-review.md` plus the three justified Flutter references. |
| F9 | Sound widget boundaries do not trigger ceremonial findings | New rules risked blanket prescriptions | Pass | A fresh isolated run reported no finding from the supplied sound facts, preserved native semantics and constraint-driven choices, and did not mandate a state library, widget, or wrapper. |

The F3 first composition attempt had correct reference selection but omitted the
requested route record. The core was tightened and the fresh rerun passed. The
F4 first attempt anticipated `flutter-quality.md`; Flutter routing was narrowed
and the fresh rerun passed with only the required domain reference.

The F8 first run treated missing evidence as a gate instead of speculation. The
scenario was corrected to supply target dimensions, runtime overflow, component
role, focus behavior, and Cubit overlap policy; no expected conclusion was
presented as independently verified runtime evidence.

## P3 operational recipe scenarios

| ID | Required behavior | Static gate | Isolated result | Evidence status |
|---|---|---|---|---|
| F10 | Widget interaction loads only `widget-testing.md` | Pass | Pending | Routing and recipe clauses are validated; fresh isolated execution remains. |
| F11 | Plugin flow preserves the integration harness and supported target | Pass | Pending | Routing, target, native-UI limitation, and `flutter_driver` guard are validated statically. |
| F12 | Concrete overflow loads only layout diagnostics | Pass | Pending | Constraint, inspector, RenderFlex, and scoped verification clauses are validated statically. |
| F13 | Localization preserves existing configuration and generation policy | Pass | Pending | Existing-localization, `l10n.yaml`, generator, and verification clauses are validated statically. |
| F14 | Preview records experimental API and Chrome/native limitation | Pass | Pending | Command, annotation, version risk, Chrome, and native-plugin clauses are validated statically. |
| F15 | Deep-link validation remains router- and platform-specific | Pass | Pending | Navigation contains nested, Android, iOS, DevTools, and web validation evidence. |

## P2 task entrypoint scenarios

| ID | Required behavior | Static gate | Isolated result | Evidence status |
|---|---|---|---|---|
| F16 | Widget-test prompt activates one entrypoint and one recipe | Pass | Pass | Fresh isolated catalog read the entrypoint, both bases, `test-first-change.md`, source catalog, and only `widget-testing.md`; no adjacent recipe was loaded. |
| F17 | Integration prompt activates one entrypoint and one recipe | Pass | Pass | Fresh isolated catalog read the entrypoint, both bases, `test-first-change.md`, source catalog, and only `integration-testing.md`. |
| F18 | Layout prompt activates one entrypoint and one recipe | Pass | Pass | Fresh isolated catalog read the entrypoint, both bases, `diagnose.md`, source catalog, and only `layout-diagnostics.md`. |
| F19 | Localization prompt activates one entrypoint and one recipe | Pass | Pass | Fresh isolated catalog read the entrypoint, both bases, `test-first-change.md`, source catalog, and only `localization.md`. |
| F20 | Preview prompt activates one entrypoint and one recipe | Pass | Pass | Fresh isolated catalog read the entrypoint, both bases, `design-and-approve.md`, source catalog, and only `widget-previews.md`. |
| F21 | Navigation prompt activates one entrypoint and one recipe | Pass | Pass | Fresh isolated catalog read the entrypoint, both bases, `test-first-change.md`, source catalog, and only `navigation.md`. |
| F22 | Generic Flutter prompt does not force an entrypoint | Defined | Pass | Fresh isolated catalog used only the two bases, `audit-and-review.md`, source catalog, and `architecture-and-state.md`; no task entrypoint loaded. |
| F23 | Missing required dependency blocks actionably | Pass | Pass | Catalog without `evidence-driven-development` read only the entrypoint, named the missing skill, told the user to make it available, and stopped before references. |
| F24 | Focused routing excludes unrelated context | Pass | Pass | Fresh isolated catalog loaded only the layout entrypoint, both bases, `diagnose.md`, source catalog, and `layout-diagnostics.md`; every adjacent recipe and entrypoint remained unloaded. |

## Static and inspector gates

| Gate | Result | Evidence |
|---|---|---|
| Context budgets, active-route cleanup, and widget contract clauses | Pass | `Context budget GREEN: all static gates passed.` |
| P3 operational references and focused routing | Pass | Five bounded references, navigation workflow, and direct SKILL routes pass the context-budget gate. |
| P2 entrypoint structure and minimal context | Pass | Six bounded skills declare both bases, one recipe, missing-dependency behavior, UI metadata, and no embedded process references. |
| Source provenance and active-reference coverage | Pass | `Source catalog validation passed.` covers all fourteen active references. |
| Inspector regression | Pass | `inspect_flutter_project_test.dart`: 12/12 tests over fourteen schema-v2 sections. |

## P4 runtime inspection scenarios

| ID | Required behavior | Static gate | Isolated result | Evidence status |
|---|---|---|---|---|
| F25 | Complete capabilities produce bounded runtime evidence | Pass | Pending | Capability discovery, full evidence record, and claim boundaries are validated statically. |
| F26 | Partial capabilities declare unavailable observations | Pass | Pending | Partial classification and explicit fallback are validated statically. |
| F27 | Missing runtime tools preserve independent static work | Pass | Pending | Unavailable-runtime fallback and pending-validation language are validated statically. |
| F28 | External-impact interaction stops for approval | Pass | Pending | External mutation and destructive-action gates are validated statically. |

## Raw artifact discovery scenarios

| ID | Fixture role | Baseline result | Loaded references | Observed evidence |
|---|---|---|---|---|
| F29 | Synthetic artifact containing nine supported audit conditions | Initial RED — seven of nine areas; final GREEN — all nine areas disposed | `audit-and-review.md`; source catalog; architecture, packages, networking, widget-testing, layout, UI, and runtime references | The final fresh isolated audit covered invalid state rendering, the presentation dependency on `RepositoryFailure`, unconditional retry, unsupported selection, overlapping pagination, mixed command boundaries, both responsive failures, and both semantics failures. Missing runtime and lifecycle evidence remained explicit limitations. Coordinator verification: analyzer clean and 6/6 characterization tests passed. |
| F30 | Synthetic false-positive control over the same responsibilities | Pass after fixture and audit-contract stabilization | `audit-and-review.md`; source catalog; architecture, packages, networking, widget-testing, UI, and runtime references | The final fresh isolated audit reported no supported finding, named supported absences, and kept opaque callbacks, uninspected lifecycle ownership, and unavailable runtime evidence as limitations. Coordinator verification: analyzer clean and 13/13 characterization tests passed. |

Historical scorecards are non-executable evidence under
`docs/superpowers/evals/`.

## P6 expanded inspector

| Required behavior | Result | Evidence |
|---|---|---|
| Localization inventory | Pass | `l10n.yaml` and ARB paths are classified and sorted without reading message values. |
| Preview candidates | Pass | Dart files expose annotation counts and preview-API import presence without claiming runtime validity. |
| Integration harness inventory | Pass | `integration_test/` and legacy `test_driver/` files are classified by mechanical path evidence. |
| Deep-link configuration candidates | Pass | Android manifests, Apple plists/entitlements, and known web files expose paths and platform types only. |
| Schema and output contract | Pass | Schema v2, summary/text/JSON consistency, section projection, stable empty lists, and read-only snapshots pass. |
