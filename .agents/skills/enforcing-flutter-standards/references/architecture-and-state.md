# Flutter architecture and state

<!-- provenance: flutter-architecture, project-policy-architecture-state -->

Load this reference for architecture, domain boundaries, models, data or
variant types, state, Cubit or Bloc, Freezed, barrels, imports, or
file-responsibility decisions supported by observable project evidence.

## Architecture and domain purity

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

## Cubit-first and Bloc selection

Choose from semantics, not names:

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The flow consists of direct commands and small transitions, and the identity of the initiating event has no architectural value. | Use Cubit. | Replacing a coherent existing state solution still requires a scoped reason and approval when it expands the requested change. | List the commands, transition shape, and why explicit event modeling is unnecessary. |
| Event identity is meaningful; several external event sources are combined; ordering, cancellation, restart, debounce, droppable, or another concurrency transformer matters; or event auditability materially improves debugging. | Use Bloc and model the relevant events explicitly. | A state-management migration beyond the touched flow requires explicit approval. | List the event sources, required ordering/cancellation policy or transformer, and auditability need. |
| A `Stream` exists but none of the Bloc predicates is present. | Do not select Bloc on that fact alone; apply the other predicates. | None beyond normal scoped-change approval. | Record what the stream carries and the direct-command/event-semantic evidence used for the choice. |

Authentication often satisfies the Bloc predicates when restoration, expiry,
remote logout, login/logout, and refresh concurrency are distinct events.
Authentication is not a blanket reason to use Bloc.

## State representation and presentation boundaries

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A widget derives rendering from correlated fields such as status, nullable data, failure, cached-data flags, or availability booleans. | Define and enforce the valid combinations. Prefer exhaustive variants when they make invalid combinations unrepresentable. Render every representable state explicitly; never use a silent empty widget such as `SizedBox.shrink()` to hide an unexpected combination. | A broad state migration requires a bounded plan and approval. A touched state may receive the smallest correction that makes its changed behavior explicit. | List the valid combinations or variants, the exhaustive render site, and tests for every applicable state. |
| Presentation imports a repository, transport, plugin, or infrastructure failure only to choose visible copy or behavior. | Map it before the UI boundary to an owned domain or presentation-owned failure, message key, and permitted recovery behavior. Presentation must not infer product behavior from an infrastructure type. | Do not migrate unrelated failures outside the touched flow. | Cite the former dependency, mapper or state transition, UI-owned value, and failure-path tests. |
| A widget designed as a presentational component receives some commands as callbacks but discovers equivalent commands through `BuildContext`, a service locator, Bloc, or Cubit. | Establish one deliberate callback boundary for that component. Keep orchestration and state-owner lookup in its coordinating ancestor; allow direct lookup when the widget itself is the observed coordinator. | Reorganizing an unrelated widget tree requires separate approval. | Name the coordinator, presentational boundary, injected commands, and interaction tests. |

## Freezed

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A model, DTO, event, state, or failure represents data or variants. | Implement it with Freezed and generate the required `.freezed.dart` and, when JSON is needed, `.g.dart` outputs. | Adding or updating dependencies follows dependency approval. Generated-file versioning follows project policy; if none exists, propose and obtain a decision before changing that policy. | Identify each converted type, its data/variant role, code-generation command and result, and generated-file disposition. |
| The type is an enum or a behavior-only class with no data/variant semantics. | Do not force a Freezed conversion. | None. | State the observed type role when Freezed was considered and rejected. |
| An existing mutable data model is touched by a behavior change. | Include an appropriately scoped Freezed migration unless an approved exception applies. | A migration that propagates broadly must be proposed as a reviewable batch and approved. | Report impacted construction, copying, equality, serialization, and test sites. |

## Barrels and imports

Use barrels as boundaries, not merely as shorter import paths.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A package or feature exists. | Provide one deliberate public barrel for its API even when its files are already organized into folders. A local package uses `lib/<package_name>.dart`; a feature uses a stable feature entrypoint consistent with the repository convention. Export only symbols consumers need, never every internal file by default. | Expanding a public API beyond the requested work requires scope approval. | Name the public barrel and list the symbols added or removed from its API. |
| A layer exposes an API consumed from another layer. | Provide a deliberate layer barrel consistent with the repository convention. Do not add a layer barrel when no cross-layer boundary consumes it. | Expanding a layer API beyond the requested work requires scope approval. | Name the layer barrel, its consumer, and the symbols exposed. |
| A file consumes another package, feature, or layer boundary. | Import that boundary's public barrel instead of importing its individual implementation files. | None. | Cite representative cross-boundary imports and direct implementation imports removed. |
| Files are in the same layer and the barrel exports the importer. | Use direct imports; never import a barrel that exports the importing file. | None. | Report any self-export cycle removed or confirm direct internal imports. |

## File responsibility and size

Generated code is excluded from these thresholds. Apply the same hybrid review
to production and test files.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A non-generated file has at least 250 lines. | Review responsibility, cohesion, and testability. Split only when distinct responsibilities exist. | None for a responsibility-preserving scoped split. | Record line count, responsibilities found, and split/retain decision. |
| A non-generated file has at least 400 lines. | Require an explicit technical justification to retain it. Split by responsibility, never by line count alone. | Retention requires explicit justification in the approved plan or user approval. | Record line count, responsibility analysis, and the approval or resulting focused units. |
| A page coordinates state, navigation, composition, forms, dialogs, sections, or components with their own logic. | Keep coordination in the page; extract focused units for independently meaningful responsibilities. Prefer one main public widget per file; small private one-use widgets may stay with their consumer. | A broader UI reorganization requires separate approval. | Name the extracted responsibility and its tests, or justify local private widgets. |

## Pressure counters

| Rationalization or pressure wording | Binding rule |
|---|---|
| “The code is in modular folders, so the package graph is modular.” | Folder names do not excuse a cyclic or inverted package graph. Show the actual edges and enforce the acyclic lower-level-contract direction. |
| “A senior developer mandates Cubit because Bloc is too verbose.” | Authority and brevity do not replace observable state semantics. Select Bloc when event identity, external sources, ordering/cancellation, transformers, or auditability require it. |
| “There is a Stream, therefore this must be Bloc.” | A Stream by itself is insufficient evidence. Apply the complete Cubit/Bloc predicate. |
