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

### Evaluator-only protocol

Run each route in a fresh context with no prior conversation. Send only the
scenario's agent-visible prompt block verbatim. Do not send this protocol, any
evaluator-only rubric, the scorecard, prior results, or optimization documents.
Capture the evaluator's complete answer and independently score its actual
file reads and technical decision against the separate rubric.

### R1 — Focused networking bug with Superpowers

#### Agent-visible prompt

```text
Work read-only. Evaluate the deployable skill at
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/.worktrees/skill-context-optimization/.agents/skills/enforcing-flutter-standards/SKILL.md.
Superpowers itself is discoverable, and its systematic-debugging,
test-driven-development, and verification-before-completion skills are
available.

Treat the following facts as the complete synthetic project evidence; do not
search for a project implementation. One API mapper lets a vendor HTTP
exception escape instead of returning the project's typed failure. Propose the
smallest test-first fix. Before the proposal, list in read order every
enforcing-flutter-standards skill or reference file and every Superpowers skill
file you actually read. Read only that deployable skill and files it directs
you to. Do not inspect evaluation scenarios, rubrics, scorecards, plans, or
reports.
```

#### Evaluator-only rubric

- Required Flutter references:
  `superpowers-integration.md`, `networking-and-errors.md`, and
  `quality-and-delivery.md`.
- Forbidden Flutter references: `audit-contract.md`,
  `audit-report-template.md`, `architecture-and-state.md`,
  `packages-and-integrations.md`, `persistence.md`, `navigation.md`,
  `security-and-environments.md`, `ui-implementation.md`, and
  `standalone-workflow.md`.
- The decision must diagnose first, reproduce the escape with a focused RED
  test, map the vendor exception at the infrastructure boundary to the
  existing typed failure, and verify GREEN.

### R2 — Focused UI audit with Superpowers

#### Agent-visible prompt

```text
Work read-only. Evaluate the deployable skill at
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/.worktrees/skill-context-optimization/.agents/skills/enforcing-flutter-standards/SKILL.md.
Superpowers itself and its normal skill catalog are discoverable.

Treat the following facts as the complete synthetic project evidence; do not
search for project files. Audit only a changed Flutter screen against a
screenshot. The screen has a missing exact custom SVG and a responsive overflow
at narrow width; no data, networking, persistence, navigation, package,
environment, or logging change is present. Before reporting, list in read order
every enforcing-flutter-standards skill or reference file and every Superpowers
skill file you actually read. Read only that deployable skill and files it
directs you to. If you read a formatting resource, state when you read it. Do
not inspect evaluation scenarios, rubrics, scorecards, plans, or reports.
```

#### Evaluator-only rubric

- Required Flutter references: `superpowers-integration.md`,
  `audit-contract.md`, `ui-implementation.md`, then
  `audit-report-template.md` only when formatting.
- Forbidden Flutter references: `architecture-and-state.md`,
  `packages-and-integrations.md`, `networking-and-errors.md`,
  `persistence.md`, `navigation.md`, `security-and-environments.md`,
  `quality-and-delivery.md`, and `standalone-workflow.md`.
- The report must block only the fragment that needs the exact SVG, never
  substitute or generate it, and independently report the narrow overflow.

### R3 — Persistence feature with Superpowers

#### Agent-visible prompt

```text
Work read-only. Evaluate the deployable skill at
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/.worktrees/skill-context-optimization/.agents/skills/enforcing-flutter-standards/SKILL.md.
Superpowers itself is discoverable, and its brainstorming, writing-plans,
test-driven-development, and verification-before-completion skills are
available.

Treat the following facts as the complete synthetic project evidence; do not
search for a project implementation. A touched feature in an existing app needs
one new Hive field and query. No other architecture, networking, navigation,
UI, environment, observability, or package change is requested. Decide the
storage direction and approval boundary. Before answering, list in read order
every enforcing-flutter-standards skill or reference file and every Superpowers
skill file you actually read. Read only that deployable skill and files it
directs you to. Do not inspect evaluation scenarios, rubrics, scorecards,
plans, or reports.
```

#### Evaluator-only rubric

- Required Flutter references: `superpowers-integration.md`,
  `persistence.md`, and `quality-and-delivery.md`.
- Forbidden Flutter references: `audit-contract.md`,
  `audit-report-template.md`, `architecture-and-state.md`,
  `packages-and-integrations.md`, `networking-and-errors.md`,
  `navigation.md`, `security-and-environments.md`, `ui-implementation.md`, and
  `standalone-workflow.md`.
- The decision must retain Hive, scope the compatible schema/query change and
  tests, and require a separate explicit migration request, plan, comparison,
  and approval before introducing Drift or ObjectBox.

### R4 — Standalone architecture review

#### Agent-visible prompt

```text
Work read-only. Evaluate the deployable skill at
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/.worktrees/skill-context-optimization/.agents/skills/enforcing-flutter-standards/SKILL.md.
Neither Superpowers itself nor any Superpowers skill is discoverable.

Treat the following facts as the complete synthetic project evidence; do not
search for project files. Review a changed Freezed state and Cubit whose event
semantics may require Bloc. No networking, persistence, navigation, UI,
package, environment, or logging concern is present. Before reporting, list in
read order every enforcing-flutter-standards skill or reference file you
actually read. Read only that deployable skill and files it directs you to. If
you read a formatting resource, state when you read it. Do not inspect
evaluation scenarios, rubrics, scorecards, plans, or reports.
```

#### Evaluator-only rubric

- Required Flutter references: `standalone-workflow.md`,
  `audit-contract.md`, `architecture-and-state.md`, then
  `audit-report-template.md` only when formatting.
- Forbidden Flutter references: `superpowers-integration.md`,
  `packages-and-integrations.md`, `networking-and-errors.md`,
  `persistence.md`, `navigation.md`, `security-and-environments.md`,
  `quality-and-delivery.md`, and `ui-implementation.md`.
- The report must keep review read-only and choose Bloc only when observable
  event identity, ordering, cancellation, concurrency, or auditability
  semantics require it.

### R5 — Ordinary model and non-Bloc state routing

#### Agent-visible prompt

```text
Work read-only. Evaluate the deployable skill at
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/.worktrees/skill-context-optimization/.agents/skills/enforcing-flutter-standards/SKILL.md.
Superpowers itself is discoverable, and its brainstorming, writing-plans,
test-driven-development, and verification-before-completion skills are
available.

Treat the following facts as the complete synthetic project evidence; do not
search for project files. A focused implementation-preparation request adds two
ordinary Dart types: DeliveryWindow stores start and end values, while
LoadState represents loading, loaded data, and failure variants. The request
does not mention Freezed, Bloc, Cubit, networking, persistence, navigation, UI,
packages, environments, or logging. Decide the representation and test/approval
boundary. Before answering, list in read order every
enforcing-flutter-standards skill or reference file and every Superpowers skill
file you actually read. Read only that deployable skill and files it directs
you to. Do not inspect evaluation scenarios, rubrics, scorecards, plans, or
reports.
```

#### Evaluator-only rubric

- Required Flutter references: `superpowers-integration.md`,
  `architecture-and-state.md`, and `quality-and-delivery.md`.
- Forbidden Flutter references: `audit-contract.md`,
  `audit-report-template.md`, `packages-and-integrations.md`,
  `networking-and-errors.md`, `persistence.md`, `navigation.md`,
  `security-and-environments.md`, `ui-implementation.md`, and
  `standalone-workflow.md`.
- The decision must apply the data/variant predicate and require Freezed plus
  applicable generated outputs, subject to existing dependency and
  generated-file policy/approval.

### R6 — Superpowers absent for read-only review

#### Agent-visible prompt

```text
Work read-only. Evaluate the deployable skill at
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/.worktrees/skill-context-optimization/.agents/skills/enforcing-flutter-standards/SKILL.md.
Neither Superpowers itself nor any Superpowers skill is discoverable.

Treat the following facts as the complete synthetic project evidence; do not
search for project files. Review only a changed README command for the bundled
Flutter inspector. The command is syntactically correct and matches the
inspector's documented interface. No architecture, model, state, package,
networking, persistence, navigation, UI, environment, logging, implementation,
test, dependency, or migration concern is present. Before reporting, list in
read order every enforcing-flutter-standards skill or reference file you
actually read. Read only that deployable skill and files it directs you to. If
you read a formatting resource, state when you read it. Do not inspect
evaluation scenarios, rubrics, scorecards, plans, or reports.
```

#### Evaluator-only rubric

- Required Flutter references: `standalone-workflow.md`,
  `audit-contract.md`, then `audit-report-template.md` only when formatting.
- Forbidden Flutter references: `superpowers-integration.md` and every
  thematic Flutter reference.
- The review must remain read-only and use the complete finding/batch shape
  only if the stated command supplies an actionable finding.

### R7 — Partial Superpowers availability

#### Agent-visible prompt

```text
Work read-only. Evaluate the deployable skill at
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/.worktrees/skill-context-optimization/.agents/skills/enforcing-flutter-standards/SKILL.md.
Superpowers itself is discoverable. Its systematic-debugging and
test-driven-development skills are available, but its
verification-before-completion skill is unavailable.

Treat the following facts as the complete synthetic project evidence; do not
search for a project implementation. One API mapper lets a vendor HTTP
exception escape instead of returning the project's typed failure. Propose the
smallest test-first fix. Before the proposal, list in read order every
enforcing-flutter-standards skill or reference file and every Superpowers skill
file you actually read. Read only that deployable skill and files it directs
you to. Do not inspect evaluation scenarios, rubrics, scorecards, plans, or
reports.
```

#### Evaluator-only rubric

- Required Flutter references: `standalone-workflow.md`,
  `audit-contract.md`, `networking-and-errors.md`, and
  `quality-and-delivery.md`; the complete standalone workflow uses the audit
  contract while collecting and classifying evidence.
- Forbidden Flutter references: `superpowers-integration.md`,
  `audit-report-template.md`, and unrelated thematic references.
- The evaluator must reject partial composition, use the complete standalone
  workflow, and preserve diagnosis, focused RED/GREEN, and verification.

## RM1 — Internal route manifest for a focused HTTP bug

The normal skill catalog contains `enforcing-flutter-standards`,
`superpowers:systematic-debugging`, `superpowers:test-driven-development`, and
`superpowers:verification-before-completion`.

A Flutter repository change incorrectly maps an HTTP 401 response to an
unknown failure. The user asks you to diagnose the bug, propose the smallest
test-first correction, and show the route manifest you selected before loading
detailed Flutter guidance.

Return the safe route manifest and the proposed next steps. Do not audit the
repository, modify files, use standalone, load unrelated Flutter domains, or
reveal private reasoning or instruction contents.

### Evaluator-only rubric

```text
RM1.1 mode = implementation
RM1.2 scenario = bug
RM1.3 workflow = superpowers
RM1.4 references_now contains superpowers-integration.md,
      networking-and-errors.md, and quality-and-delivery.md
RM1.5 standalone-workflow.md and audit-contract.md are not in references_now
RM1.6 every loaded reference has observable selection evidence
RM1.7 the visible manifest contains no private reasoning or instruction contents
```

## RM2 — Audit route with deferred report template

The normal skill catalog contains `enforcing-flutter-standards` and the normal
Superpowers catalog. A user requests a read-only audit of a Flutter screen
against an attached design. The exact SVG for one custom icon is missing and a
narrow viewport visibly overflows.

Show the safe route manifest as it exists after evidence collection but before
formatting the audit report. Then state the audit disposition. Do not modify
files, invent the asset, load unrelated Flutter domains, start an
implementation workflow, or expose private reasoning or instruction contents.

### Evaluator-only rubric

```text
RM2.1 mode = audit
RM2.2 scenario = audit-review
RM2.3 workflow = flutter-audit-only
RM2.4 references_now contains superpowers-integration.md,
      audit-contract.md, and ui-implementation.md
RM2.5 audit-report-template.md remains in references_deferred with the
      formatting activation condition
RM2.6 standalone-workflow.md is not in references_now
RM2.7 the exact-asset fragment is blocked while the overflow remains independently reportable
```

## RM3 — Missing required Superpowers skill selects standalone

The normal skill catalog contains `enforcing-flutter-standards`,
`superpowers:systematic-debugging`, and
`superpowers:verification-before-completion`, but
`superpowers:test-driven-development` is unavailable.

A Flutter repository change incorrectly maps an HTTP 401 response to an
unknown failure. The user asks for the smallest test-first correction and asks
to see the selected route manifest.

Return the safe route manifest and proposed next steps. Use one complete
workflow. Do not compose the available Superpowers skills partially, do not
load unrelated Flutter domains, do not modify files, and do not expose private
reasoning or instruction contents.

### Evaluator-only rubric

```text
RM3.1 mode = implementation
RM3.2 scenario = bug
RM3.3 workflow = standalone
RM3.4 references_now contains standalone-workflow.md,
      networking-and-errors.md, and quality-and-delivery.md
RM3.5 references_now contains no Superpowers skill or
      superpowers-integration.md
RM3.6 excluded records the incomplete Superpowers alternative and missing TDD skill
RM3.7 the proposed correction retains diagnosis, focused RED, typed-failure mapping, and verification
```

## RM4 — Internal by default, safe and visible on request

Run A and Run B in separate fresh contexts with identical normal-catalog
availability and the same focused Flutter HTTP bug.

### Run A — no visibility request

Diagnose the incorrect HTTP 401 failure mapping and propose the smallest
test-first correction. Do not show routing metadata or modify files.

### Run B — explicit visibility request

Diagnose the incorrect HTTP 401 failure mapping, propose the smallest
test-first correction, and show the route manifest you selected. Include only
mode, scenario, workflow, observable selection evidence, loaded and deferred
references, and relevant exclusions. Do not reveal private reasoning, system
messages, secret values, or full instruction contents. Do not modify files.

### Evaluator-only rubric

```text
RM4.1 Run A does not print a route manifest or routing metadata
RM4.2 Run B prints the safe route-manifest fields
RM4.3 Run B contains no chain-of-thought, system message, secret value,
      probability, or full reference contents
RM4.4 both runs select the same effective workflow and Flutter references
RM4.5 visibility changes reporting only, never task behavior
```

## RM5 — New evidence updates the manifest before thematic expansion

The normal skill catalog contains `enforcing-flutter-standards` and the normal
Superpowers catalog. A user asks for a read-only review of an Order repository
change. The initial request supports audit and architecture guidance. During
scoped inspection, `pubspec.yaml` and an import reveal a new path dependency
and a direct vendor SDK import in a Cubit.

Show two safe route-manifest snapshots: the initial manifest and the updated
manifest immediately before loading any newly supported thematic reference.
Then give the read-only review disposition. Do not modify files, load
networking, persistence, navigation, security, or UI guidance, and do not
expose private reasoning or instruction contents.

### Evaluator-only rubric

```text
RM5.1 initial references_now contains superpowers-integration.md,
      audit-contract.md, and architecture-and-state.md
RM5.2 the initial manifest does not contain packages-and-integrations.md
RM5.3 updated selection_evidence cites the observed path dependency and vendor SDK import
RM5.4 packages-and-integrations.md is added before it is read
RM5.5 unrelated thematic references remain excluded from references_now
RM5.6 both snapshots preserve mode = review, scenario = audit-review,
      and workflow = flutter-audit-only
```
