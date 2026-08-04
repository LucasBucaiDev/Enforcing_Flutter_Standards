# Flutter packages and integrations

<!-- provenance: flutter-packages, project-policy-packages-integrations -->

Load this reference for local-package boundaries, dependency direction,
external integrations, lifecycle ownership, composition roots, or dependency
approval decisions supported by observable project evidence.

## Local packages and dependency direction

Create several small packages around stable boundaries, not one package per
class. Place local packages under `packages/`.

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A capability forms an actual stable architectural boundary—such as a domain, repository, integration, or cross-cutting capability—or a meaningful SDK anti-corruption boundary. Independent responsibility, reuse, a small owned API, lock-in isolation, and isolated tests are supporting evidence but do not establish that boundary on their own. | Extract or use one focused local package for that stable boundary. A significant SDK boundary may justify a package even with one current consumer; do not create one package per class. | Extraction is included only in an already approved named package batch. Extraction outside that batch or a broader package restructure requires explicit approval; adding dependencies follows dependency approval. | Name the stable architectural or anti-corruption boundary, supporting traits, API, consumers, isolation benefit, package batch approval, and tests. |
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

## External integrations and lifecycle

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| A feature, state object, widget, or domain model would import a significant vendor SDK such as geolocation, Firebase, analytics, notifications, complex permissions, maps, payments, or equivalent. | Always introduce an owned service/adapter boundary, expose owned integration-domain types, and keep vendor objects outside features and state. Extract a local package only when the integration forms an actual stable anti-corruption boundary. Reuse, a small owned API, lock-in isolation, and isolated tests are supporting evidence; none alone mandates a package. A real stable SDK boundary may justify a package with one current consumer. | The scoped service/adapter is included only in the already approved named integration batch. Package extraction requires an approved named package batch; new dependencies require dependency approval. | Required SDK-boundary output: name the owned contract, service/adapter, owned types, composition location, vendor-free consumers, approved integration batch, and package decision. If extracted, identify the stable anti-corruption boundary, supporting evidence, and package approval. |
| Code creates a Bloc, Cubit, subscription, timer, controller, focus node, router, client, or another resource with lifecycle. | Make the creator the cleanup owner and close/cancel it at the owner's lifecycle boundary. Test cleanup when a leak can affect behavior. | Ownership transfer must be explicit and reviewed. | Name each resource, creator, cleanup location, and cleanup test or reason one is unnecessary. |
| `BlocProvider(create:)` creates a Bloc or Cubit. | Let the provider own and close the created instance. | None. | Identify the provider and created instance. |
| `BlocProvider.value` receives an existing instance. | Preserve an explicit external owner that calls `close`; the provider does not assume ownership. | None. | Identify the instance owner and cleanup location. |

| Observable predicate | Required decision | Approval boundary | Final-report evidence |
|---|---|---|---|
| The project already has a coherent bootstrap and composition-root approach. | Preserve it and place scoped composition changes in its established locations. | The approved named feature/integration batch covers only its scoped composition edits; replacing or broadly restructuring the bootstrap requires separate approval. | Name the existing bootstrap/composition files, convention retained, scoped edits, and approved batch. |
| `main.dart` or the existing bootstrap accumulates router, theme, observability, or complex integration setup as distinct responsibilities in the approved scope. | Keep indispensable startup in `main.dart` and separate only the observed distinct responsibilities into a focused bootstrap or composition root; do not create ceremonial files. | The split is included only in the already approved named batch that touches those responsibilities. A broader composition restructure or new dependency requires separate approval. | Name each observed responsibility, resulting owner/file, unchanged bootstrap conventions, approved batch, and any separately approved dependency. |

## Dependency approval

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

## Pressure counters

| Rationalization or pressure wording | Binding rule |
|---|---|
| “The integration has only one current consumer, so it cannot be a package.” | A single current consumer does not forbid a package when a significant SDK integration forms a real stable anti-corruption boundary. Reuse, a small owned API, lock-in isolation, and isolated tests support that decision; none alone mandates extraction. The owned service/adapter remains required either way. |
| “Dio, `fpdart`, Crashlytics, Drift, or another dependency is preferred, so it is mandatory.” | A preferred dependency is not automatically mandatory. Preserve a sound existing solution and require the full comparison and approval before adding or migrating. |
