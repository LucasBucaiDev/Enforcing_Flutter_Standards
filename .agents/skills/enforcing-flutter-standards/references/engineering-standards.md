# Flutter engineering standards

This reference defines the normative engineering decisions for Flutter audits,
implementations, refactors, reviews, local-package work, and Freezed migrations.
Apply repository and directory instructions first. Treat every conditional rule
as a decision contract: record the observable predicate, the required decision,
any approval boundary, and the evidence supporting the outcome.

**Table of contents**

1. [Rule precedence and exceptions](#1-rule-precedence-and-exceptions)
2. [Architecture and domain purity](#2-architecture-and-domain-purity)
3. [Cubit-first and Bloc selection](#3-cubit-first-and-bloc-selection)
4. [Freezed](#4-freezed)
5. [Barrels and imports](#5-barrels-and-imports)
6. [File responsibility and size](#6-file-responsibility-and-size)
7. [Local packages and dependency direction](#7-local-packages-and-dependency-direction)
8. [External integrations and lifecycle](#8-external-integrations-and-lifecycle)
9. [Dependency approval](#9-dependency-approval)
10. [Networking](#10-networking)
11. [Errors and results](#11-errors-and-results)
12. [Local persistence](#12-local-persistence)
13. [Navigation](#13-navigation)
14. [Observability and secrets](#14-observability-and-secrets)
15. [Environments and flavors](#15-environments-and-flavors)
16. [TDD, tests, and coverage](#16-tdd-tests-and-coverage)
17. [Changelog](#17-changelog)
18. [Verification matrix](#18-verification-matrix)
19. [Common rationalizations](#19-common-rationalizations)
20. [Quick reference](#20-quick-reference)

## 1. Rule precedence and exceptions

Apply rules in this order:

1. explicit user instructions;
2. repository and applicable directory instructions;
3. discovered, coherent project conventions;
4. these global standards.

Do not use a lower-precedence rule to override a higher-precedence one. Preserve
an established project choice when this reference marks a choice as conditional
and the existing choice remains coherent, secure, testable, and adequate.

### Global policy set

| Category | Binding policy |
|---|---|
| Mandatory | Use TDD for behavior changes. |
| Mandatory | Use Freezed for models, DTOs, events, states, and failures that represent data or variants. |
| Mandatory | Organize code and split units by responsibility. |
| Mandatory | Expose deliberate public APIs through barrels. |
| Mandatory | Keep the local-package graph directed and acyclic. |
| Mandatory | Keep credentials out of versioned content and sensitive data out of logs. |
| Mandatory | Support completion claims with recent verification evidence. |
| Mandatory | Obtain explicit approval before implementing changes proposed by an audit. |
| Conditional | Choose Cubit or Bloc from observable flow semantics. |
| Conditional | Extract local packages at stable, reusable, independently testable, or anti-corruption boundaries. |
| Conditional | Wrap significant external integrations behind owned contracts and types. |
| Conditional | Introduce `go_router`, `fpdart`, file splits, and other dependencies only when their predicates are met. |
| Project-specific | Discover format, analysis, test, build, code-generation, and coverage commands. |
| Project-specific | Follow established generated-file, flavor, platform, asset, navigation, release, and versioning conventions. |

An exception is valid only when its record contains all four fields:

| Required exception field | Evidence |
|---|---|
| Rule | Name the exact rule being excepted. |
| Observation | Cite the file, configuration, command output, or project constraint that makes the rule applicable. |
| Technical reason and impact | Explain why compliance is unsuitable now and what risk or debt the exception creates. |
| Approval | Identify the explicit user or project approval. |

The final report must list every applied exception with those four fields.
Silence is not an exception.

## 2. Architecture and domain purity

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The existing architecture is coherent. | Preserve it and make the smallest scoped change. | A broad migration requires evidence of a concrete problem, a bounded scope, and explicit approval. | Name the existing pattern, the inspected files, and whether it was retained or an approved migration was performed. |
| A new feature has no established project structure. | Start feature-first. Add `presentation`, `domain`, and `data` subdivisions only when actual responsibilities require them. | Adding ceremonial layers or a broader project restructure requires explicit scope approval. | Show the feature location and the responsibilities that justify each subdivision created. |
| Domain code imports a DTO, HTTP client, plugin, vendor SDK, or Flutter visual type. | Move transport and integration types to their boundary; map to owned domain types outside domain models; keep colors, icons, styles, and visible labels in presentation, theme, design system, or localization. | Do not migrate unrelated architecture incidentally. Propose a bounded correction when the current change touches the leak; otherwise record future debt. | Cite the leaking import and location, affected boundary, mapper or contract used, and current-change versus future-debt classification. |
| An existing architecture mixes these responsibilities outside the touched scope. | Preserve scope and report the dependency and impact. | A whole-project cleanup requires separate approval. | Record the observed dependency, why it matters, and the smallest proposed correction. |

Domain models represent product rules and concepts. DTOs belong at transport or
integration boundaries. Mappers or repository implementations translate DTOs
to domain types. Services and adapters may know external contracts; domain
code must not depend on them.

## 3. Cubit-first and Bloc selection

Choose from semantics, not names:

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The flow consists of direct commands and small transitions, and the identity of the initiating event has no architectural value. | Use Cubit. | Replacing a coherent existing state solution still requires a scoped reason and approval when it expands the requested change. | List the commands, transition shape, and why explicit event modeling is unnecessary. |
| Event identity is meaningful; several external event sources are combined; ordering, cancellation, restart, debounce, droppable, or another concurrency transformer matters; or event auditability materially improves debugging. | Use Bloc and model the relevant events explicitly. | A state-management migration beyond the touched flow requires explicit approval. | List the event sources, required ordering/cancellation policy or transformer, and auditability need. |
| A `Stream` exists but none of the Bloc predicates is present. | Do not select Bloc on that fact alone; apply the other predicates. | None beyond normal scoped-change approval. | Record what the stream carries and the direct-command/event-semantic evidence used for the choice. |

Authentication often satisfies the Bloc predicates when restoration, expiry,
remote logout, login/logout, and refresh concurrency are distinct events.
Authentication is not a blanket reason to use Bloc.

## 4. Freezed

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A model, DTO, event, state, or failure represents data or variants. | Implement it with Freezed and generate the required `.freezed.dart` and, when JSON is needed, `.g.dart` outputs. | Adding or updating dependencies follows dependency approval. Generated-file versioning follows project policy; if none exists, propose and obtain a decision before changing that policy. | Identify each converted type, its data/variant role, code-generation command and result, and generated-file disposition. |
| The type is an enum or a behavior-only class with no data/variant semantics. | Do not force a Freezed conversion. | None. | State the observed type role when Freezed was considered and rejected. |
| An existing mutable data model is touched by a behavior change. | Include an appropriately scoped Freezed migration unless an approved exception applies. | A migration that propagates broadly must be proposed as a reviewable batch and approved. | Report impacted construction, copying, equality, serialization, and test sites. |

## 5. Barrels and imports

Use barrels as boundaries, not merely as shorter import paths.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A package, feature, or relevant layer exposes an API to another boundary. | Provide a deliberate public barrel that exports only the necessary API. A local package uses `lib/<package_name>.dart`. | Expanding a public API beyond the requested work requires scope approval. | Name the public barrel and list the symbols added or removed from its API. |
| A file consumes another feature or layer. | Import that boundary's public barrel. | None. | Cite representative cross-boundary imports. |
| Files are in the same layer and the barrel exports the importer. | Use direct imports; never import a barrel that exports the importing file. | None. | Report any self-export cycle removed or confirm direct internal imports. |

## 6. File responsibility and size

Generated code is excluded from these thresholds. Apply the same hybrid review
to production and test files.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A non-generated file has at least 250 lines. | Review responsibility, cohesion, and testability. Split only when distinct responsibilities exist. | None for a responsibility-preserving scoped split. | Record line count, responsibilities found, and split/retain decision. |
| A non-generated file has at least 400 lines. | Require an explicit technical justification to retain it. Split by responsibility, never by line count alone. | Retention requires explicit justification in the approved plan or user approval. | Record line count, responsibility analysis, and the approval or resulting focused units. |
| A page coordinates state, navigation, composition, forms, dialogs, sections, or components with their own logic. | Keep coordination in the page; extract focused units for independently meaningful responsibilities. Prefer one main public widget per file; small private one-use widgets may stay with their consumer. | A broader UI reorganization requires separate approval. | Name the extracted responsibility and its tests, or justify local private widgets. |

## 7. Local packages and dependency direction

Create several small packages around stable boundaries, not one package per
class. Place local packages under `packages/`.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A capability forms an actual stable domain, repository, integration, cross-cutting reusable, or meaningful SDK anti-corruption boundary. Independent responsibility, a small API, and isolated tests are supporting evidence but do not establish that boundary on their own. | Extract or use one focused local package for that stable boundary. A significant SDK boundary may justify a package even with one current consumer; do not create one package per class. | Extraction is included only in an already approved named package batch. Extraction outside that batch or a broader package restructure requires explicit approval; adding dependencies follows dependency approval. | Name the stable architectural or anti-corruption boundary, supporting traits, API, consumers, isolation benefit, package batch approval, and tests. |
| An approved stable package boundary requires no Flutter APIs. | Prefer a Dart package without a Flutter dependency. | The package type is included in the approved named extraction batch. Using a Flutter package instead requires an observed Flutter API need; adding dependencies follows dependency approval. | Report the approved boundary and package type, and confirm whether Flutter APIs are imported. |
| An approved stable package boundary requires widgets, plugins, or Flutter APIs. | Use a Flutter package. | The package type is included in the approved named extraction batch; any new plugin or dependency requires separate dependency approval. | Name the approved boundary and cite the Flutter APIs that require this package type. |
| A proposed local dependency introduces a cycle or points from a lower-level package to a higher-level feature/repository. | Reject the edge. Move a small contract, callback, or value provider to a lower, stable boundary. | A package-graph restructure beyond the affected cycle requires explicit approval. | Show the before/after dependency edges and cycle check. |
| An approved local package boundary is consumed by the app or another local package. | Use a path dependency and constructor injection. | Wiring is included only in the approved named package/integration batch; adding dependencies or changing broader composition requires separate approval. | Name the path dependency, constructor boundary, consumer, approved batch, and dependency-resolution result. |
| An approved dependency is global to the app, or exclusive to one feature. | Compose a global dependency at the app composition root; compose a feature-only dependency near that feature without turning the root into a giant container. | Scoped wiring is included only in the approved named batch. A broad composition-root restructure requires separate approval. | Classify the dependency as global or feature-only and name its composition location, rationale, approved batch, and relevant tests. |

Required dependency direction:

```text
app/composition → feature/repository → service/adapter → base contract
```

Example: an HTTP package must not depend on a higher-level auth repository for
tokens when auth already depends on HTTP. Put a small token/session provider at
a lower stable boundary; auth implements it, HTTP consumes it, and the graph
remains acyclic. Cross-cutting contracts are leaves and know no concrete
features.

`BlocProvider` supplies Blocs and Cubits. `RepositoryProvider` is not a default
policy or universal requirement.

## 8. External integrations and lifecycle

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A feature, state object, widget, or domain model would import a significant vendor SDK such as geolocation, Firebase, analytics, notifications, complex permissions, maps, payments, or equivalent. | Introduce an owned service/adapter boundary, expose owned integration-domain types, and keep vendor objects outside features and state. Use a local package when reuse, isolated testing, or lock-in protection justifies it. | New package or dependency work requires the relevant approval. | Required SDK-boundary output: name the owned contract, adapter/package, owned types, composition location, and vendor-free consumers. |
| Code creates a Bloc, Cubit, subscription, timer, controller, focus node, router, client, or another resource with lifecycle. | Make the creator the cleanup owner and close/cancel it at the owner's lifecycle boundary. Test cleanup when a leak can affect behavior. | Ownership transfer must be explicit and reviewed. | Name each resource, creator, cleanup location, and cleanup test or reason one is unnecessary. |
| `BlocProvider(create:)` creates a Bloc or Cubit. | Let the provider own and close the created instance. | None. | Identify the provider and created instance. |
| `BlocProvider.value` receives an existing instance. | Preserve an explicit external owner that calls `close`; the provider does not assume ownership. | None. | Identify the instance owner and cleanup location. |

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The project already has a coherent bootstrap and composition-root approach. | Preserve it and place scoped composition changes in its established locations. | The approved named feature/integration batch covers only its scoped composition edits; replacing or broadly restructuring the bootstrap requires separate approval. | Name the existing bootstrap/composition files, convention retained, scoped edits, and approved batch. |
| `main.dart` or the existing bootstrap accumulates router, theme, observability, or complex integration setup as distinct responsibilities in the approved scope. | Keep indispensable startup in `main.dart` and separate only the observed distinct responsibilities into a focused bootstrap or composition root; do not create ceremonial files. | The split is included only in the already approved named batch that touches those responsibilities. A broader composition restructure or new dependency requires separate approval. | Name each observed responsibility, resulting owner/file, unchanged bootstrap conventions, approved batch, and any separately approved dependency. |

## 9. Dependency approval

No dependency may be added or updated until its decision record is presented
and explicitly approved.

| Required decision field | Evidence to present |
|---|---|
| Need and benefit | Concrete requirement the dependency satisfies. |
| Health and maintenance | Release activity, ownership, and maintenance risk. |
| Compatibility | Dart, Flutter, and target-platform compatibility. |
| Cost | Package weight, build impact, operational complexity, and maintenance burden. |
| License | Applicable license and compatibility. |
| Alternatives | Existing project tools, standard-library/platform implementation, and competing packages. |
| Lock-in | Isolation, replacement, or exit strategy. |

Distinguish preference from requirement. A preferred dependency is not
automatically mandatory; an isolated package may use a smaller solution when
the comparison shows a better fit. After approval, verify resolution, analysis,
tests, and relevant builds. The final report must link the approval, summarize
the comparison, and record those verification results.

## 10. Networking

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The project has a coherent, testable HTTP client that meets the requirements. | Preserve it. Do not migrate merely because another client is preferred. | Migration requires a demonstrated gap, dependency comparison, bounded plan, and explicit approval. | Name the existing client, inspected capabilities, and retention or approved-migration decision. |
| A new general REST client needs a dedicated HTTP solution. | Prefer Dio, subject to the full dependency decision. | Adding Dio requires explicit approval. | Record requirements, comparison, approval, version resolution, and checks. |
| A small isolated integration has limited needs and another client has lower weight and surface area. | Preserve or propose the smaller encapsulated client when it wins the dependency comparison. | Adding or changing the client still requires approval. | Record isolation boundary and comparison. |
| A request may become irrelevant before completion. | Propagate cancellation through the integration boundary. | None. | Identify cancellation token/signal flow and test. |
| A retry is proposed. | Retry only an approved idempotent operation under an explicit policy. | Retry policy requires approval. | Record operation idempotence, attempts/backoff policy, approval, and tests. |

Inject one configured client instead of creating ad hoc clients. Declare base
URL, timeouts, and required headers. Give interceptors small explicit
responsibilities. Map HTTP, transport, and format errors to owned errors. Redact
tokens, credentials, bodies, headers, query values, and responses. Keep
`Response`, `DioException`, and other vendor types inside infrastructure.
Serialize justified DTO contracts with Freezed and JSON. Test requests,
responses, cancellation, and error mapping at the package boundary without
real external calls.

## 11. Errors and results

Services and data sources call APIs, plugins, and other external sources.
Repositories map external exceptions to owned typed failures. Blocs and Cubits
turn results into explicit states. UI consumes those states and never
interprets exceptions or displays raw technical messages.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| An SDK or external source can throw. | Catch at the external boundary and map the exception to a typed failure before returning a result. `Either` does not remove this catch requirement. | Adding `fpdart` or another result dependency requires comparison and approval; retain coherent existing `dartz` or `fpdart` usage. | Name caught exception families, failure mapping, result type, and boundary tests. |
| Code consumes a typed result. | Exhaustively consume both branches with `fold` or `match` and map them to explicit state or behavior. | None. | Cite the fold/match site and tests for success and failure. |
| UI-visible failure handling is added. | Present a product-appropriate message/state; keep raw technical errors out of UI. | Product-copy ambiguity may require a user/product decision. | Record the typed failure-to-state/message mapping. |

Unsafe result access is prohibited:

```dart
final order = result.asRight() as Order;       // unsafe branch assumption
final failure = result.asLeft() as AppFailure; // unsafe branch assumption
final value = result.value as Order;           // unchecked value access
final error = result.failure as AppFailure;    // unchecked failure access
```

Do not add equivalent helpers or casts under different names. Consume every
branch:

```dart
return result.fold(
  (failure) => OrderState.failure(failure),
  (order) => OrderState.success(order),
);

return result.match(
  (failure) => OrderState.failure(failure),
  (order) => OrderState.success(order),
);
```

## 12. Local persistence

Choose storage from data shape and criticality, not isolated library
preference.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| New data is a simple, non-sensitive, non-critical key/value preference or flag. | Use Shared Preferences; prefer `SharedPreferencesAsync` for new code. Use a cached API only for a demonstrated need with understood consistency behavior. | Adding or changing the dependency follows dependency approval. | Describe data shape/criticality, selected API, and consistency tests. |
| Data is a token, credential, secret, business-critical record, serialized collection acting as a database, relationship, query, transaction, or offline-sync dataset. | Do not store it in Shared Preferences. Select secure or structured storage by the applicable predicate. | Storage changes and migrations require approval. | Record data classification and selected boundary/store without reproducing secret values. |
| A small secret needs local storage and target platforms are compatible. | Prefer compatible secure storage such as `flutter_secure_storage`. Review platform configuration, backup, migration, and restore behavior. | Dependency and storage decision require explicit approval. | Record platforms, security/backup/migration review, approval, and tests. |
| Hive is the established structured store and a feature needs boxes, fields, adapters, queries, or migrations. | Extend Hive using project conventions. | Drift or ObjectBox may be introduced only by an explicit technology-migration request and approval. | Required storage output: name Hive as the retained primary store, scoped schema/query change, migration/versioning, approval boundary, and tests. |
| A new app needs structured persistence with relational queries, joins, transactions, controlled migrations, or reactive streams. | Select exactly one primary structured store; propose Drift. | Present platform, data-model, migration, testing, weight, lock-in, and operational comparison and obtain approval before adoption. | Record predicates, comparison, selected single source of truth, approval, and tests. |
| A new app needs object-oriented, high-volume, performance-sensitive offline persistence and platform support fits. | Select exactly one primary structured store; propose ObjectBox. | Present the same full comparison and obtain approval before adoption. | Record volume/performance evidence, platform fit, selected single source of truth, approval, and tests. |
| An app already has one coherent primary structured store. | Reuse it for new features. Keep Shared Preferences for simple preferences and secure storage for secrets; these are not competing domain databases. | Changing the primary store requires an explicit architectural reason, migration request, and approval. | Name the established store and whether it was retained. |
| A storage migration is explicitly requested and approved. | Define source and destination schemas; versioned idempotent execution; conversion validation; partial-failure behavior; backup and recovery/rollback; representative-data tests; the source of truth at every phase; temporary encapsulated coexistence only; no permanent dual writes; and removal of the old store. | Approve the technology choice and migration plan before implementation. Any destructive cutover or external action needs its own explicit authorization. | Report every migration contract item, versions, test fixtures/results, source-of-truth transitions, old-store removal, and any unexecuted recovery action. |

Features depend on owned persistence contracts rather than concrete storage
types. Evaluate any persistence-package extraction with the stable-boundary
contract in [Local packages and dependency direction](#7-local-packages-and-dependency-direction).

## 13. Navigation

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| Existing navigation is coherent and meets requirements. | Retain it. | Migration requires evidence of a gap, dependency comparison, scoped plan, and explicit approval. | Name the current solution, requirements checked, and retention/migration decision. |
| The app or flow is small, linear, modal, local, or has no URL-state requirement. | Use Navigator for the local/simple flow. | None beyond normal feature approval. | Record flow shape and absence of declarative-routing predicates. |
| Deep links, web URL state, authentication redirects, complex declarative parameters/routes, persistent nested navigation, or growing imperative complexity are present. | Propose `go_router` for primary routes; Navigator may still handle local interactions. | Adding the dependency or migrating navigation requires justification and approval. | List satisfied predicates, comparison/approval, route scope, and navigation tests. |

## 14. Observability and secrets

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The project has a coherent, secure logging and error-reporting solution. | Retain it. | Migration requires evidence, dependency review, and approval. | Name the solution and the security/adequacy evidence. |
| A compatible new app needs crash reporting. | Prefer Crashlytics behind a provider-neutral owned contract such as `ErrorReporter`. Capture fatal Flutter and unhandled async errors; report as non-fatal only unexpected actionable errors, not every expected business failure. | Adding Firebase or Crashlytics requires dependency approval and compatible consent/collection configuration. | Record contract, adapter, captured categories, consent/configuration, approval, and adapter tests without real provider events. |
| Features, UI, Blocs, Cubits, or repositories import provider types directly. | Move provider knowledge behind an owned adapter and contract. | Broad migration beyond touched consumers requires approval. | Cite imports removed and vendor-neutral consumers. |
| Logging or reporting includes headers, bodies, payloads, query values, responses, tokens, credentials, personal data, signed URLs, webhooks, or API keys. | Remove or redact sensitive fields before recording; never version credentials or signed webhooks. Avoid production `print` and debug logging. | Rotation or revocation is an explicit external action requiring authorization. | Report the location and kind of suspected secret, never its value; record redaction and any recommended external action. |
| Version, environment, or operation context would materially improve diagnosis. | Include only the useful diagnostic fields after redaction and continue to respect product consent and collection settings. | Adding fields within an already approved named observability batch needs no separate approval; changing consent/collection behavior or adding provider capabilities requires explicit approval. | List each diagnostic field added, its diagnostic purpose, redaction treatment, consent/collection behavior, and approved batch. |

## 15. Environments and flavors

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| Existing environment configuration is coherent. | Retain it; do not migrate to `.env`, `envied`, or another mechanism by preference alone. | A new configuration mechanism requires an observable need, comparison, and approval. | Name the existing mechanism and adequacy evidence or approved gap. |
| A new app needs environments. | Use development, staging, and production entrypoints modeled on the Very Good CLI Flutter template. Keep entrypoints small, select typed configuration/dependencies, and delegate to a shared bootstrap while preserving any coherent bootstrap convention already established. | This structure is included only in the already approved named new-app environment batch. New dependencies or a broader project restructure require separate approval. | List the approved batch, entrypoints, preserved or new shared bootstrap, typed configuration, validation, and reproducible run/test/build commands. |
| A required configuration value is absent or invalid. | Validate at startup and fail with an actionable message. Never silently fall back to production. | None; choosing a product default for a non-required value may require a product decision. | Report validation behavior and tests for missing/invalid values. |
| An existing project has a coherent bootstrap convention alongside its environment configuration. | Preserve that convention while applying typed validation and keeping environment endpoints/dependencies outside features. | Scoped changes are included only in the already approved named environment batch; replacing the bootstrap requires separate approval. | Name the preserved bootstrap convention, typed validation added, affected configuration boundaries, and approved batch. |
| The product differentiates native identifiers, names, icons, or files by flavor. | Keep each differentiated native resource coherent with its development, staging, or production flavor. | Wiring already approved product-provided values is included only in the named flavor batch. Inventing or changing product identity/assets, adding dependencies, or broad native restructuring requires separate approval. | Provide a per-flavor resource matrix with source locations, product/design approvals for changed values, and relevant run/build results. |

Keep environment endpoints and dependencies out of features. Do not scatter
environment conditionals through UI, domain, or repositories.

## 16. TDD, tests, and coverage

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

## 17. Changelog

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| An approved implementation changes observable user, operational, or maintenance behavior and a canonical changelog exists. | Add one concise line in the existing language, format, and category. Use an issue identifier only when project convention does. | None within approved implementation scope. | Quote the changelog file, category, and entry. |
| The change belongs to the application and an existing canonical root changelog is present. | Update that root changelog. | The entry is included only in the already approved named implementation batch. Moving or replacing the canonical changelog requires separate approval. | Record the root changelog path, category, concise entry, and approved batch. |
| A package is independently versioned, published, or released, or repository convention requires package entries. | Update that package's changelog. | Normal release-scope approval applies. | Record the package release convention and changelog path. |
| No canonical changelog exists. | Report its absence and request a decision; do not create one or claim a changelog update until the user approves creation. | Creating a changelog requires explicit approval. | Record searched locations, the absence result, the requested decision, its approval outcome, and that no update was claimed while undecided. |
| A version bump is contemplated. | Report the version decision; do not bump automatically. | Every version change requires explicit approval. | Record the current/proposed version, reason, and approval outcome. |

## 18. Verification matrix

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

## 19. Common rationalizations

Task 1 RED did not observe a discipline violation: evaluators rejected the
unsafe release but CP2–CP5 omitted complete recovery output contracts. Therefore
use the positive required-output structures above. The counters below remain
binding under the pressures they name.

| Rationalization or pressure wording | Binding rule |
|---|---|
| “The problems are obvious” and “a release slot in 40 minutes” make an audit unnecessary. | A deadline does not waive audit evidence or explicit approval. Audit the scoped facts, propose small batches, and wait for approval before implementing audit-derived changes. |
| “The project has no tests” and “adding tests afterward is enough because deleting working code is wasteful.” | Existing lack of tests does not waive TDD. Remove the untested behavior implementation, reproduce the bug with a focused test, verify the expected RED failure, then implement the minimum fix. |
| “The integration has only one current consumer, so it cannot be a package.” | A single current consumer does not forbid a package for a significant reusable or lock-in-heavy SDK boundary. Decide from stable boundary, isolated testing, reuse, and anti-corruption value. |
| “Dio, `fpdart`, Crashlytics, Drift, or another dependency is preferred, so it is mandatory.” | A preferred dependency is not automatically mandatory. Preserve a sound existing solution and require the full comparison and approval before adding or migrating. |
| “The code is in modular folders, so the package graph is modular.” | Folder names do not excuse a cyclic or inverted package graph. Show the actual edges and enforce the acyclic lower-level-contract direction. |
| “A visually similar Material icon exists,” so the missing custom asset can be substituted. | A small visual substitution is still an invented asset. Mark only that fragment blocked, request the exact SVG, and continue independent approved work. |
| “The feature is already being touched,” so adding Drift beside existing Hive is within scope. | Touching a Hive feature is not approval for a storage migration. Extend Hive; Drift or ObjectBox requires an explicit migration request, full plan, and approval. |
| “A senior developer mandates Cubit because Bloc is too verbose.” | Authority and brevity do not replace observable state semantics. Select Bloc when event identity, external sources, ordering/cancellation, transformers, or auditability require it. |
| “There is a Stream, therefore this must be Bloc.” | A Stream by itself is insufficient evidence. Apply the complete Cubit/Bloc predicate. |
| “It works,” manual inspection, sunk cost, time pressure, authority, or exhaustion make generic risk escalation enough. | A no-ship verdict is not the complete recovery contract. State all applicable concrete outputs: owned SDK boundary, exact-asset disposition, retained primary storage and migration approval boundary, and verified test-first RED recovery. |

For the combined vendor SDK, missing custom icon, Hive/Drift, and untested-code
pressure case, the decision output is complete only when it contains these four
observable slots:

1. **SDK boundary:** owned contract, adapter/package, owned types, dependency
   direction, and vendor-free Cubit/Bloc;
2. **Design asset:** exact SVG requested, affected fragment blocked, and
   independent approved work allowed to continue;
3. **Persistence:** Hive retained and extended, with any technology migration
   separated behind an explicit request, plan, and approval;
4. **TDD recovery:** untested implementation removed, focused test run to the
   expected RED failure, minimum implementation, and GREEN verification.

## 20. Quick reference

| Topic | Default or trigger | Required outcome |
|---|---|---|
| Rule precedence | Higher-precedence instruction exists | Follow it; document any approved exception. |
| Existing architecture | Coherent and adequate | Preserve it; approve broad migrations separately. |
| New feature | No established structure | Start feature-first; add layers only for real responsibilities. |
| Domain | DTO, SDK, plugin, HTTP, or Flutter visual type crosses inward | Move it to a boundary and map to owned domain types. |
| State | Direct commands, small transitions | Cubit. |
| State | Meaningful events, multiple sources, ordering/cancellation, transformers, auditability | Bloc. |
| Freezed | Data or variant type | Required. |
| Barrels | Cross-package/feature/layer API | Deliberate public barrel; direct imports inside self-exporting layers. |
| File size | 250+ / 400+ non-generated lines | Review responsibility / require explicit retention justification. |
| Package | Actual stable architectural or anti-corruption boundary; reuse/testing/API traits only support it | One focused package per stable boundary, not per class; Dart unless Flutter APIs are required. |
| Package graph | Cycle or inverted dependency | Lower a small contract and restore acyclic direction. |
| SDK | Significant integration reaches feature/state | Owned adapter/package and owned types. |
| Lifecycle | Resource created | Creator owns cleanup; distinguish `create:` from `.value`. |
| Dependency | Add or update proposed | Compare need, health, compatibility, cost, license, alternatives, lock-in; approve first. |
| HTTP | Sound client exists / new general REST client | Preserve it / prefer Dio after approval. |
| Result | External throw / result consumption | Catch and map at boundary / consume with `fold` or `match`. |
| Simple storage | Non-sensitive, non-critical key/value | Shared Preferences; prefer async API for new code. |
| Secret storage | Small secret, platforms compatible | Approved secure storage plus backup/migration review. |
| Existing Hive | Scoped schema/query need | Extend Hive; no incidental Drift/ObjectBox. |
| New structured storage | Relational / object-oriented high-volume | Exactly one: Drift / ObjectBox after comparison and approval. |
| Migration | Explicitly requested | Idempotent versioned plan, recovery, partial-failure behavior, tests, one source of truth, old-store removal. |
| Navigation | Simple/local / declarative complexity | Navigator / propose `go_router` after approval. |
| Observability | Sound solution / compatible new app | Retain it / provider-neutral Crashlytics adapter after approval. |
| Secrets and logs | Sensitive or suspected value | Never reproduce it; report location and kind, redact, separately authorize rotation. |
| Flavors | Coherent existing / new app | Retain / typed development-staging-production entrypoints and shared bootstrap. |
| Tests | Uncovered refactor / behavior change | Characterization first / verified RED-GREEN-REFACTOR. |
| Coverage | Repository threshold exists | Preserve or increase it. |
| Changelog | Canonical changelog exists | One concise observable entry; package entry only for independent release/convention. |
| Verification | Implementation complete | Run applicable gates for roots, modified packages, and direct dependents; report exact commands/results. |
