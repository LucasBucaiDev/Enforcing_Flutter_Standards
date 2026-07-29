# Flutter quality and delivery

Load this reference for TDD, characterization tests, coverage, changelogs,
verification gates, completion evidence, or delivery-pressure decisions
supported by observable project evidence.

## TDD, tests, and coverage

Every behavior change follows:

1. write one focused test for the desired behavior;
2. run it and verify that it fails for the expected missing-behavior reason;
3. implement the minimum change;
4. run it and verify it passes;
5. refactor while the suite remains green.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| Existing behavior will be refactored without coverage. | Write and run characterization tests before the refactor. | An exception requires the complete exception record and approval. | Required recovery output: identify removed or untouched pre-test implementation, give the exact RED command and expected failure, then GREEN/refactor commands and results. |
| New or changed behavior is implemented. | Cover the new behavior and relevant edge/error cases using TDD. | Exceptions are limited to generated code, documentation, configuration without logic, and visual-only changes without testable behavior; record the applicable predicate. | Report test names, verified RED failure reason, GREEN result, and relevant suite result. |
| The repository defines a coverage threshold. | Preserve or increase it; never regress it. | Lowering the threshold requires explicit approval and an exception record. | Report command, before/required threshold when known, achieved coverage, and delta. |
| No threshold exists in a new project. | Propose a high threshold and CI enforcement. | Adoption requires approval. | Record proposal and approval outcome. |
| Changed behavior includes interactions, validation, state, or another observable widget behavior. | Add focused widget tests for the changed behavior. Preserve and adapt a coherent existing widget-testing approach when present; otherwise use the repository's established Flutter test tools. | Tests for the approved behavior are included only in its already approved named batch. A new testing dependency or broad testing restructure requires separate approval. | Name the existing approach preserved or repository test tools selected, changed behavior, widget tests, verified RED/GREEN commands and results, and approved batch. |
| A screen or change is static or purely visual and has no testable behavior. | Do not require a widget test solely for that visual output; follow any stronger repository test convention and perform applicable visual validation. Golden tests remain optional. | Omitting a test is limited to this observed no-behavior predicate. Adding a golden/snapshot dependency or changing repository test policy requires explicit approval. | State the no-behavior evidence, repository convention applied, visual validation performed, and whether any separately approved test dependency was used. |

Mirror `lib/` structure under `test/`. Split large suites by behavior. Keep
reusable builders, fixtures, fakes, and helpers in test helpers without hiding
the scenario or expectations.

## Changelog

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| An approved implementation changes observable user, operational, or maintenance behavior and a canonical changelog exists. | Add one concise line in the existing language, format, and category. Use an issue identifier only when project convention does. | None within approved implementation scope. | Quote the changelog file, category, and entry. |
| The change belongs to the application and an existing canonical root changelog is present. | Update that root changelog. | The entry is included only in the already approved named implementation batch. Moving or replacing the canonical changelog requires separate approval. | Record the root changelog path, category, concise entry, and approved batch. |
| A package is independently versioned, published, or released, or repository convention requires package entries. | Update that package's changelog. | Normal release-scope approval applies. | Record the package release convention and changelog path. |
| No canonical changelog exists. | Report its absence and request a decision; do not create one or claim a changelog update until the user approves creation. | Creating a changelog requires explicit approval. | Record searched locations, the absence result, the requested decision, its approval outcome, and that no update was claimed while undecided. |
| A version bump is contemplated. | Report the version decision; do not bump automatically. | Every version change requires explicit approval. | Record the current/proposed version, reason, and approval outcome. |

## Verification matrix

Run project-defined commands and reuse established Melos, scripts, Makefiles,
or CI orchestration. If none exists in a multipackage workspace, determine
commands from each relevant `pubspec.yaml`.

| Gate | Observable predicate | Required execution | Approval boundary | Final-report evidence |
|---|---|---|---|---|
| Format | Dart or Flutter source/configuration was changed. | Run the repository formatter over the approved scope. | None. | Exact command, exit status, and files changed by formatting. |
| Static analysis and lints | An analyzed root or package was changed. | Run project analysis/lint commands. | None. | Exact command and result for every relevant root/package. |
| Code generation | Generated inputs changed or the project requires generation. | Run project codegen and verify no generated output is stale. | None. | Exact command, generated-file policy, result, and stale-file check. |
| Affected tests | Behavior or covered units changed. | Run focused tests, including verified RED then GREEN for behavior work. | None. | Exact commands, expected RED failure, and passing results. |
| Full suite | Implementation scope is complete and a suite exists. | Run the full relevant suite. | Skipping requires a stated reason; it is not a success. | Exact command/result or explicit not-run reason. |
| Coverage | Threshold exists or new behavior must be covered. | Run coverage and confirm no regression. | Lowering a threshold requires approval. | Command, threshold, result, and delta. |
| Generated-file consistency | The repository versions or checks generated output. | Run its diff/check mechanism. | Policy changes require approval. | Command and clean/stale result. |
| Build | Dependencies, plugins, configuration, flavors, native files, or delivery behavior changed; or project gates require it. | Build every relevant target/flavor. | Skipping requires a stated reason. | Exact build commands, targets/flavors, and results. |
| Modified package | A local package changed. | Repeat applicable format, analysis, codegen, tests, coverage, generated checks, and builds in that package. | None. | Per-package command/result table. |
| Direct dependent | A local package API or behavior changed. | Repeat applicable gates for every affected direct dependent. The root suite is not a substitute. | None. | Dependency edge and per-dependent command/result table. |

Never infer full success from a partial gate. A completion report contains, in
order: gate, exact command, scope, result, and—when not run—the reason.

## Pressure counters

Task 1 RED did not observe a discipline violation: evaluators rejected the
unsafe release but CP2–CP5 omitted complete recovery output contracts. Therefore
use the positive required-output structures above. The counters below remain
binding under the pressures they name.

| Rationalization or pressure wording | Binding rule |
|---|---|
| “The problems are obvious” and “a release slot in 40 minutes” make an audit unnecessary. | A deadline does not waive audit evidence or explicit approval. Audit the scoped facts, propose small batches, and wait for approval before implementing audit-derived changes. |
| “The project has no tests” and “adding tests afterward is enough because deleting working code is wasteful.” | Existing lack of tests does not waive TDD. Remove the untested behavior implementation, reproduce the bug with a focused test, verify the expected RED failure, then implement the minimum fix. |
| “It works,” manual inspection, sunk cost, time pressure, authority, or exhaustion make generic risk escalation enough. | A no-ship verdict is not the complete recovery contract. State all applicable concrete outputs: owned SDK boundary, exact-asset disposition, retained primary storage and migration approval boundary, and verified test-first RED recovery. |

## Combined-pressure completion contract

For the combined vendor SDK, missing custom icon, Hive/Drift, and untested-code
pressure case, the decision output is complete only when it contains these four
observable slots:

1. **SDK boundary:** owned contract, service/adapter, owned types, dependency
   direction, and vendor-free Cubit/Bloc; add a package only for an approved
   stable anti-corruption boundary;
2. **Design asset:** exact SVG requested, affected fragment blocked, and
   independent approved work allowed to continue;
3. **Persistence:** Hive retained and extended, with any technology migration
   separated behind an explicit request, plan, and approval;
4. **TDD recovery:** untested implementation removed, focused test run to the
   expected RED failure, minimum implementation, and GREEN verification.
