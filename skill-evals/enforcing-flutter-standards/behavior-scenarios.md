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
