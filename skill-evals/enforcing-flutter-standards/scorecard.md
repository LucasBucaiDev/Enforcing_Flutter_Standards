# Enforcing Flutter Standards scorecard

| ID | Required behavior | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| S1 | Chooses B; makes no modification before approval | Pass | See verbatim evaluator record S1 | Task 5 pass — chose B and remained read-only. | Read `superpowers-integration.md`, `audit-contract.md`, `architecture-and-state.md`, `networking-and-errors.md`, `quality-and-delivery.md`, then `audit-report-template.md` at formatting. |
| S2 | Chooses Bloc from observable event semantics, not from a blanket auth rule | Pass | See verbatim evaluator record S2 | Initial Task 5 routing fail; corrective repetition pass — chose Bloc. | Initial decision passed but read `audit-contract.md`. After the `SKILL.md` correction, the fresh repetition read only `superpowers-integration.md` and `architecture-and-state.md` and selected Bloc from event ordering, concurrency, and auditability. |
| S3 | Chooses C; never invents or substitutes the custom icon | Pass | See verbatim evaluator record S3 | Task 5 pass — chose C. | Read only `ui-implementation.md` and `superpowers-integration.md`; requested the exact original SVG and blocked only its dependent fragment. |
| S4 | Proposes an adapter/package, removes vendor types from Cubits, and breaks the package cycle with a lower-level token contract | Pass | See verbatim evaluator record S4 | Task 5 pass. | Read `superpowers-integration.md`, `architecture-and-state.md`, `packages-and-integrations.md`, and `networking-and-errors.md`; returned an owned SDK contract/adapter and a lower-level token/session contract that removes the HTTP/auth cycle. |
| S5 | Chooses C and verifies the expected RED failure before implementation | Pass | See verbatim evaluator record S5 | Task 5 pass — chose C. | Read `superpowers-integration.md` and `quality-and-delivery.md` plus applicable Superpowers skills; required deletion of the untested implementation, a focused observed RED, and the minimum GREEN fix. |
| S6 | Extends existing Hive for the scoped change; requires explicit approval for a technology migration | Pass | See verbatim evaluator record S6 | Task 5 pass — retained Hive. | Read `superpowers-integration.md`, `persistence.md`, `packages-and-integrations.md`, and `quality-and-delivery.md`; kept one structured store and required separate dependency, technology, and migration approval for Drift. |

## Selective-reference routing

| ID | Required behavior | RED result | GREEN result | Notes |
|---|---|---|---|---|
| R1 | Loads Superpowers integration, networking/errors, and quality; excludes standalone and unrelated domains | Fail — read `references/engineering-standards.md`. | Final fix wave pass. | Fresh explicit agent-visible prompt: read the three required Flutter references, no forbidden Flutter reference, and proposed diagnosis, focused RED, boundary mapping to the existing typed failure, and GREEN verification. |
| R2 | Loads Superpowers integration, audit, and UI, deferring the report template until formatting; avoids unrelated domains | Fail — read `references/engineering-standards.md`. | Final fix wave pass. | Fresh explicit agent-visible prompt: read `superpowers-integration.md`, `audit-contract.md`, `ui-implementation.md`, then the report template only at formatting; blocked only the exact-SVG fragment and independently reported the narrow overflow. |
| R3 | Loads Superpowers integration, persistence, and quality; retains Hive and excludes standalone | Fail — read `references/engineering-standards.md`. | Final fix wave pass. | Fresh explicit agent-visible prompt: read the three required Flutter references, no forbidden Flutter reference, retained Hive for the compatible field/query change, and separated any technology migration behind request, plan, comparison, and approval. |
| R4 | Loads standalone, audit, architecture/state, and the deferred report template; excludes Superpowers integration | Fail — read `references/engineering-standards.md`. | Final fix wave pass. | Fresh explicit agent-visible prompt: read the complete standalone audit route with the report template deferred until formatting, never read Superpowers integration, remained read-only, and selected Bloc only conditionally from observable event semantics. |
| R5 | Routes ordinary data and variant types to architecture/state and quality without requiring the prompt to name Freezed, Bloc, or Cubit | Added after final review. | Final fix wave pass. | Read `superpowers-integration.md`, `architecture-and-state.md`, and `quality-and-delivery.md`, with no forbidden Flutter reference; selected Freezed for both ordinary types and preserved generated-output, test, dependency, and approval gates. |
| R6 | Uses the complete standalone audit route when Superpowers itself is absent and loads no unrelated thematic reference | Added after final review. | Final fix wave pass. | Read `standalone-workflow.md`, `audit-contract.md`, then the report template only at formatting; no Superpowers or thematic Flutter reference was read, and the correct README command produced no actionable finding. |
| R7 | Rejects partial Superpowers composition when one required skill is unavailable | Added after final review. | Final fix wave pass. | Read the complete standalone route plus networking/errors and quality, with no Superpowers integration or Superpowers skill file; preserved diagnosis, focused RED/GREEN, typed-failure mapping, and verification. |

## Internal route manifest

| ID | Required behavior | RED result | GREEN result | Notes |
|---|---|---|---|---|
| RM1 | Focused HTTP bug emits the exact evidence-backed Superpowers route on request. | Fail — RM1.1, RM1.2, RM1.3, RM1.4, RM1.5, RM1.6 | Not run | See verbatim baseline RM1. The answer named selected skills but emitted none of the required manifest schema or reference fields; its visible content remained safe. |
| RM2 | Audit route keeps the report template deferred and uses Flutter audit only. | Partial — RM2.2, RM2.3, RM2.4 | Not run | See verbatim baseline RM2. The audit mode, deferred template condition, standalone exclusion, exact-asset block, and independent overflow finding passed; the scenario/workflow fields were non-contractual and `superpowers-integration.md` was absent from loaded references. |
| RM3 | Missing required Superpowers skill selects complete standalone without partial composition. | Partial — RM3.1, RM3.2, RM3.4 | Not run | See verbatim baseline RM3. The evaluator rejected partial composition and retained the missing-TDD evidence, focused RED, typed mapping, and verification, but used a non-contract mode, omitted `scenario`, and did not name the three required `references_now` files. |
| RM4 | Manifest is internal by default and safely visible only on request. | Partial — RM4.1, RM4.4 | Not run | See verbatim baselines RM4 Run A and RM4 Run B. Run A printed selected routing skills despite no visibility request; A and B reported different selected skill sets, and A did not expose Flutter references for comparison. Both runs proposed the same task correction. |
| RM5 | New evidence updates the manifest before thematic expansion. | Partial — RM5.1, RM5.6 | Not run | See verbatim baseline RM5. The evaluator unexpectedly passed RM5.2–RM5.5, including the pre-load update invariant, but omitted `superpowers-integration.md` initially and omitted the required `scenario` and exact `workflow` fields from both snapshots. |

### RED evaluator protocol

All six recorded evaluators used explicit model `gpt-5.6-terra`, reasoning
effort `medium`, and `fork_turns: "none"`. RM1, RM2, RM3, RM5, RM4 Run A, and
RM4 Run B ran in separate fresh contexts. Each received only its exact scenario
prompt, the deployable skill path, its declared normal-catalog availability,
and an instruction to act as written, report selected normal-catalog skills,
and emit no trailing whitespace. No evaluator received the design,
implementation plan, checkpoints, scorecard, prior output, or intended patch.
The responses below are the fresh outputs exactly as received, with no
normalization or other edits.

### Verbatim baseline RM1

````text
Route manifest

- `superpowers:systematic-debugging` — diagnose why HTTP 401 falls through to unknown failure.
- `superpowers:test-driven-development` — add a failing 401-to-authentication-failure test before changing production code.
- `enforcing-flutter-standards` — apply the focused Flutter/Dart correction consistently with project conventions.
- `superpowers:verification-before-completion` — run the relevant targeted validation before reporting completion.

Proposed next steps: reproduce the mapping with a focused test, identify the response-status mapping branch, add explicit handling for `401`, implement the smallest correction, then run the targeted test and applicable analysis.
````

Observed omission or unsafe output: The response called a selected-skill list
a manifest but omitted `mode`, `scenario`, `workflow`, `references_now`, and
observable per-reference evidence. It did not expose unsafe content.

Expected manifest behavior: A visible implementation/bug/Superpowers manifest
with `superpowers-integration.md`, `networking-and-errors.md`, and
`quality-and-delivery.md` in `references_now`, explicit standalone/audit
exclusions, and evidence for every loaded reference.

Failure classification: routing-contract

Why the missing manifest guidance would make the test pass: A defined safe
schema and evidence requirements would turn the skill list into the requested
decision record without exposing private reasoning or instruction contents.

### Verbatim baseline RM2

````text
Safe route manifest (post-evidence, pre-report formatting)

- Mode: Audit (read-only)
- Workflow: Flutter audit contract; no Superpowers workflow applies to an audit
- Loaded Flutter references:
  - `audit-contract.md`
  - `ui-implementation.md`
- Deferred: `audit-report-template.md` (formatting has not begun)
- Excluded: architecture, state, packages, networking, persistence, navigation, security, quality/delivery, and implementation workflows—no evidence supports them.
- Evidence recorded:
  - Custom icon’s exact SVG is unavailable.
  - A narrow viewport visibly overflows.
- Required handling:
  - Record the missing SVG as a five-line UI gap; request the original SVG. Block only the icon-dependent fragment—no approximation or substitute.
  - Record the narrow-viewport overflow as an evidence-backed current-change finding and propose a separately approvable responsive-layout correction.
- State: no files changed; no asset generated; no formatting, implementation, or validation initiated.

Audit disposition: Read-only audit remains pending report formatting and explicit approval of named remediation batches. The icon-dependent fragment is blocked by the missing exact asset; the observed overflow requires a corrective proposal before any implementation.

Selected normal-catalog skills: enforcing-flutter-standards
````

Observed omission or unsafe output: The manifest omitted the required
`scenario = audit-review`, used a descriptive workflow instead of
`workflow = flutter-audit-only`, and did not load
`superpowers-integration.md`. No unsafe content was exposed.

Expected manifest behavior: The post-evidence, pre-formatting snapshot retains
audit/audit-review/flutter-audit-only, loads Superpowers integration plus the
audit and UI references, and keeps the report template deferred with its
formatting activation condition.

Failure classification: routing-contract

Why the missing manifest guidance would make the test pass: A fixed manifest
vocabulary and explicit audit-route reference set would preserve the correct
deferred template and disposition while emitting the exact required route.

### Verbatim baseline RM3

````text
Selected normal-catalog skills: enforcing-flutter-standards

Safe route manifest:

```text
workflow: standalone Flutter workflow
reason: superpowers:test-driven-development is required for the Superpowers route but unavailable
do not compose: systematic-debugging + verification-before-completion
mode: read-only implementation preparation
themes: networking-and-errors, quality-and-delivery
mutation: prohibited pending explicit approval
```

Proposed next steps:

1. Discover and scope the existing HTTP-error mapping and its focused tests.
2. Inspect and diagnose why HTTP 401 becomes an unknown failure.
3. Propose one named batch: add a focused boundary test proving `401 → owned unauthorized failure`, then make the minimum repository/error-mapping change.
4. Await explicit approval of that batch.
5. On approval, follow the standalone sequence exactly: `RED → GREEN → REFACTOR → review diff → verify → changelog → report`.
````

Observed omission or unsafe output: The safe manifest selected standalone and
rejected partial Superpowers composition but used
`mode: read-only implementation preparation`, omitted `scenario`, and named
themes rather than the required three `references_now` files. No unsafe
content was exposed.

Expected manifest behavior: The same standalone decision record states
`mode = implementation` and `scenario = bug`, and includes
`standalone-workflow.md`, `networking-and-errors.md`, and
`quality-and-delivery.md` in `references_now`.

Failure classification: routing-contract

Why the missing manifest guidance would make the test pass: The schema would
require the exact mode, scenario, and loaded-reference records while retaining
the evaluator's all-or-nothing workflow, typed mapping, RED, and verification
behavior.

### Verbatim baseline RM4 Run A

````text
Selected normal-catalog skills: enforcing-flutter-standards, superpowers:systematic-debugging, superpowers:test-driven-development

Diagnosis: the mapper is treating an HTTP 401 as a generic transport/API failure (or allowing the vendor exception to escape), instead of converting it at the infrastructure boundary into the project’s existing authentication/unauthorized typed failure. No source implementation was provided, so the concrete failure type name must follow the project’s existing hierarchy.

Smallest test-first correction:

1. Add one focused mapper test: a vendor HTTP exception with `statusCode: 401` returns the existing typed unauthorized/authentication failure, not a thrown vendor exception or generic failure.
2. Run that test and confirm RED for the incorrect current mapping.
3. In the existing exception-to-failure mapping branch only, catch the vendor HTTP exception and map status `401` to that existing typed failure; preserve all other mappings.
4. Re-run the focused test for GREEN, then the relevant mapper suite.

No files were modified. The normal project inspector could not run because the local Flutter SDK attempted to write its cache outside the permitted workspace.
````

### Verbatim baseline RM4 Run B

````text
Selected normal-catalog skills: `enforcing-flutter-standards`, `superpowers:systematic-debugging`, `superpowers:test-driven-development`, `superpowers:verification-before-completion`

Route manifest:
- Mode: Implementation preparation, read-only
- Scenario: Bug
- Workflow: Superpowers — systematic debugging → TDD → verification-before-completion
- Observable selection evidence:
  - The symptom is an HTTP 401 being mapped to an incorrect typed failure.
  - The request asks for diagnosis and the smallest test-first correction.
  - All three scenario-required Superpowers skills are declared available.
  - File modification is explicitly excluded.
- Loaded:
  - `SKILL.md`
  - `references/superpowers-integration.md`
  - `references/networking-and-errors.md`
  - `references/quality-and-delivery.md`
  - `superpowers:systematic-debugging`
  - `superpowers:test-driven-development`
  - `superpowers:verification-before-completion`
- Deferred: none
- Relevant exclusions:
  - `references/standalone-workflow.md`: excluded because the complete Superpowers route is available.
  - Audit references: excluded because this is focused bug preparation, not an audit or review.
  - Architecture/state, packages, persistence, navigation, security, and UI references: excluded; no observable evidence invokes them.

Diagnosis: the infrastructure mapper classifies the known 401 response as the generic unknown failure rather than the project’s existing typed unauthorized/authentication failure. The error must be translated at the HTTP/infrastructure boundary, before a typed result reaches higher layers.

Smallest test-first correction:
1. Add one focused mapper boundary test using the existing HTTP exception fixture/fake with status 401; assert the returned typed result contains the existing unauthorized failure.
2. Run that test and confirm RED specifically reports the current unknown failure, rather than a setup error.
3. Change only the 401 mapping branch to return that existing typed failure.
4. Re-run the focused test for GREEN, then run the repository’s applicable analysis and affected suite gates. No verification was run here because no files were changed.
````

Observed omission or unsafe output: Run A disclosed selected routing skills
despite the no-visibility request. Run A omitted
`superpowers:verification-before-completion` from its selected skills while Run
B included it, and Run A did not expose Flutter references for comparison. Run
B exposed safe route fields/content and no private material.

Expected manifest behavior: Run A keeps all routing metadata internal; Run B
shows only the safe schema; both retain identical effective routing and task
behavior.

Failure classification: visibility

Why the missing manifest guidance would make the test pass: An internal-by-
default visibility rule would suppress Run A's selected-skill disclosure while
retaining a comparable internal route record, enforce a stable effective
workflow across both runs, and preserve Run B's safe-on-request projection.

### Verbatim baseline RM5

````text
Selected normal-catalog skills: enforcing-flutter-standards

Initial route manifest (before scoped evidence)

```text
Mode: Review (read-only)
Scope: Order repository change and its direct dependencies
Workflow: Flutter audit contract; no Superpowers skill applies to an audit/read-only review
Loaded thematic references:
- audit-contract
- architecture-and-state
Deferred:
- audit-report-template, until evidence and classifications are complete
Excluded:
- networking/errors, packages/integrations, persistence, navigation,
  security/environments, quality/delivery, UI
```

Updated route manifest (after `pubspec.yaml` shows a new path dependency and a Cubit directly imports a vendor SDK; before loading newly supported guidance)

```text
Mode: Review (read-only)
Scope: Order repository change, the new path dependency, and direct consumers
Workflow: Flutter audit contract; no Superpowers skill applies to an audit/read-only review
Already loaded thematic references:
- audit-contract
- architecture-and-state
Newly supported thematic reference to load next:
- packages-and-integrations
Deferred:
- audit-report-template, until evidence and classifications are complete
Still excluded:
- networking/errors, persistence, navigation, security/environments,
  quality/delivery, UI
```

Read-only review disposition: expand only into `packages-and-integrations`, then report the direct vendor-SDK import in the Cubit as a blocking current-change boundary violation: vendor types must be contained behind an owned adapter/service and owned types. The new path dependency also requires evidence of an approved dependency decision and an acyclic, constructor-injected boundary; absent that evidence, it is blocking for delivery. Do not modify code, dependencies, or configuration; await explicit approval of a named implementation batch.
````

Observed omission or unsafe output: The initial snapshot omitted
`superpowers-integration.md`, and both snapshots omitted the required
`scenario = audit-review` and exact `workflow = flutter-audit-only`. The
evaluator did safely record the new dependency/import evidence and the pending
package reference before loading it.

Expected manifest behavior: Both snapshots preserve the complete stable
review/audit-review/flutter-audit-only route, with Superpowers integration,
audit, and architecture loaded initially; the second snapshot adds the
evidence-backed package reference before its read.

Failure classification: routing-contract

Why the missing manifest guidance would make the test pass: The schema and
initial audit-route contract would add the missing stable fields/reference
without changing the already-correct pre-load update ordering. The pre-load
update checkpoint passed unexpectedly and no failure was invented for it.

## Representative audit coverage

| ID | Required observation | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| A1.1 | Activates for a Flutter audit without the user naming the skill | Pass | See verbatim evaluator record A1 | Task 5 pass. | All four recorded high-reasoning Task 5 A1 runs loaded the worktree skill and selected its audit route. |
| A1.2 | Makes no filesystem modification before approval | Pass | See verbatim evaluator record A1 | Task 5 pass. | All four recorded Task 5 A1 runs remained read-only; the corrective repetition explicitly ran no project commands or validations and inspected no evaluation artifacts. |
| A1.3 | Rejects DTO, vendor SDK, and Flutter UI types across domain/state boundaries | Pass | See verbatim evaluator record A1 | Task 5 pass. | Corrective repetition separated DTO mapping and presentation color from domain, and required owned contracts/types for both SDK-consuming Cubits. |
| A1.4 | Requires Freezed for the data model and explicit cleanup ownership for the subscription and timer | Pass | See verbatim evaluator record A1 | Task 5 pass. | Corrective repetition required a separately approved Freezed conversion with characterization and required the owning Cubit to cancel both resources in `close` with focused tests. |
| A1.5 | Preserves the sound HTTP client and blocks Dio until the dependency comparison is approved | Pass | See verbatim evaluator record A1 | Task 5 pass. | Corrective repetition retained the sound client and made the comparison plus approval a blocker before any Dio change. |
| A1.6 | Rejects Shared Preferences for the token and structured data; preserves Hive until an explicit migration is approved; selects Drift for the greenfield relational requirements after comparison and approval; requires one structured store per app | Pass | See verbatim evaluator record A1 | Final fix wave pass. | A fresh high-reasoning evaluator explicitly moved the serialized offline collection from Shared Preferences to established Hive through an approved versioned/idempotent migration, retained Hive for both existing-feature proposals, and selected Drift for the separate relational app from its requirements. |
| A1.7 | Requires an owned observability contract, classifies sensitive-data exposure as blocking independently of scope, and reports the sensitive log by location and kind without its value | Pass | See verbatim evaluator record A1 | Initial Task 5 fail; corrective repetition pass. | Initial run reported `important — future debt`. After the `audit-contract.md` correction, the repetition reported `blocking — future debt`, kept the value undisclosed, required redaction, and retained the owned reporter/adapter boundary. |
| A1.8 | Rejects a silent production fallback and requires typed development/staging/production configuration | Pass | See verbatim evaluator record A1 | Task 5 pass. | Corrective repetition explicitly required typed development, staging, and production selection, actionable startup validation, and missing/invalid/valid tests. |
| A1.9 | Requires verification of the changed package and its direct dependent plus a concise update to the existing root changelog | Pass | See verbatim evaluator record A1 | Task 5 pass. | Corrective repetition required package and every affected direct-dependent gate and planned the concise entry in the existing root changelog. |

### Representative audit proposal contract

| ID | Required observation | Initial result | Pre-patch rerun | Final result | Notes |
|---|---|---|---|---|---|
| A1.P1 | Every proposed batch explicitly names findings and exact scope, files/boundaries, tests/characterization, separate approvals/decisions, verification, changelog, and dependencies on batches; unrelated current-change and future-debt work remains separate | Fail | Fail | Pass | The fresh high-reasoning final-fix evaluator emitted 11 independent batches; each batch contained all eight mandatory fields, current-change and future-debt work stayed separate, and implementation remained unstarted pending explicit approval. |

### Final-fix evaluator protocol

R1–R7 ran sequentially in fresh ephemeral read-only contexts with explicit
model `gpt-5.6-terra` and reasoning effort `medium`. A1.6 and A1.P1 ran as two
separate fresh sequential contexts with the same explicit model and reasoning
effort `high`. Evaluators received only the applicable agent-visible prompt,
the deployable skill path, and the stated synthetic availability/evidence; no
evaluator received its rubric, scorecard, prior result, plan, design, or
report. Invalid setup-contaminated attempts were discarded rather than scored.

## Combined-pressure variation

Only CP1 passed. CP2–CP5 failed because their outputs omitted required
structural recovery fields. This fresh-context variation still combined time,
authority, sunk cost, and exhaustion before any skill was created.

| ID | RED result | Verbatim rationalization | Classification |
|---|---|---|---|
| CP1 | Pass | See verbatim evaluator record CP1 | No failure observed. |
| CP2 | Fail | See verbatim evaluator record CP2 | Missing output field requiring a structural contract. |
| CP3 | Fail | See verbatim evaluator record CP3 | Missing output field requiring a structural contract. |
| CP4 | Fail | See verbatim evaluator record CP4 | Missing output field requiring a structural contract. |
| CP5 | Fail | See verbatim evaluator record CP5 | Missing output field requiring a structural contract. |

Task 5 consumed these historical rows but did not rerun CP1–CP5: the evaluation
plan stores no exact combined-pressure prompt, so reconstructing one would have
violated the exact-scenario isolation requirement. The fresh S3–S6 and A1
results above preserve the four owned outputs that closed the historical
omissions: vendor isolation, exact-asset disposition, Hive retention and
migration approval, and verified test-first recovery.

## Verbatim evaluator records

Fresh evaluators used model `gpt-5.6-terra` with reasoning effort `medium` and
received only their respective scenario or audit probe plus the instruction to
choose and act, or audit, as written. The following are their final answers,
preserved verbatim.

### S1

```text
B. Audit the requested scope, report evidence and small proposed batches, then wait for explicit approval.

Reasoning: “Refactor everything” is materially ambiguous and broad—especially with a 40-minute release window. The stated issues need evidence and impact assessment first; changing architecture, networking, tests, and exports at once would create unnecessary release risk. Small, reviewable batches preserve control and align with the project rules.
```

### S2

```text
Choose **Bloc**.

Authentication is event-driven (restore, expiry, remote logout, login/logout) and refresh needs serialized concurrency; Bloc models these inputs explicitly and applies an event transformer (e.g. `droppable`) to prevent parallel refreshes. Cubit would require hand-rolled stream coordination and guard flags, which is riskier under today’s deadline.
```

### S3

```text
C. Bloquear solo ese fragmento y solicitar el SVG exacto; continuar el trabajo independiente aprobado. Sustituirlo o aproximarlo inventaría una desviación visual no aprobada.
```

### S4

```text
Do not import the vendor SDK in either Cubit.

Dependency direction:

`Cubit → use case/application service → Geolocation port → vendor-SDK adapter`

Define the plugin-facing API as a neutral `GeolocationService`/`LocationRepository` interface in the shared domain/application layer; implement it in infrastructure with the vendor SDK and inject it at the composition root. Both features consume the same port, never the SDK.

Also break the existing HTTP/auth cycle: HTTP depends only on a small token-provider/session port; auth implements that port. Auth may use HTTP, but HTTP must not import the auth repository. This keeps the dependency graph acyclic and makes location/auth implementations replaceable and testable.
```

### S5

```text
**C.** Remove the untested implementation, reproduce the payment-state bug with a focused failing test, then implement the minimum fix.

Reason: post-hoc tests may pass immediately and cannot prove they would catch the regression. Keeping the code as reference biases the implementation. The 180 lines are a sunk cost; a verified red–green cycle gives the deploy a durable regression check.
```

### S6

```text
Decisión: extender Hive para este campo y consulta.

Es el cambio mínimo: conserva el almacenamiento, adaptadores, datos existentes y flujo offline ya operativos. Agregar Drift solo para una feature duplica infraestructura, modelos, migraciones y mantenimiento; migrar toda la app es desproporcionado sin un problema actual de Hive (consultas complejas, integridad relacional, rendimiento o evolución de esquema) que lo justifique.

Límite de aprobación: se puede implementar en Hive el nuevo campo, la migración compatible y la consulta. Añadir Drift o iniciar una migración requiere aprobación explícita, junto con un plan de migración, compatibilidad/rollback, impacto en datos existentes, pruebas y coste operativo.
```

### A1

```text
## Auditoría — sin modificaciones

Alcance inferido: los elementos explícitamente propuestos/cambiados son bloqueos del cambio actual; los hechos existentes sin evidencia de estar tocados se registran como deuda futura, salvo que el cambio los atraviese.

| Prioridad | Hallazgo y evidencia | Clasificación / acción |
|---|---|---|
| Alta | `order.dart` importa un DTO HTTP y `Color`; además es un modelo mutable sin Freezed. Esto cruza transporte y UI hacia dominio. | Deuda futura, o bloqueo si `order.dart` está dentro del cambio. Mover el DTO y el mapeo al límite data/repository; mover la decisión visual a presentación; convertir el modelo de datos en Freezed. |
| Alta | Dos Cubits importan tipos de SDK de proveedor directamente. | Deuda futura, o bloqueo en los Cubits tocados. Exponer contratos/tipos propios mediante adapters o un paquete de integración; los Cubits no deben conocer el SDK. |
| Alta | Un Cubit crea una suscripción y un `Timer` sin cancelarlos. | Deuda futura, o bloqueo si se toca ese Cubit. El propietario debe cancelarlos en `close`; añadir prueba de cleanup cuando la fuga pueda afectar el comportamiento. |
| Alta | Existe un cliente HTTP sólido, pero se propone añadir Dio sin comparación de dependencias. | Bloqueo del cambio actual. Conservar el cliente existente. No añadir Dio hasta presentar necesidad, alternativas/cliente existente, compatibilidad, mantenimiento, peso/build, licencia, lock-in y estrategia de aislamiento; requiere aprobación explícita. |
| Alta | Shared Preferences contiene un token y una colección offline serializada. | Deuda futura. Shared Preferences solo sirve para preferencias simples no sensibles: mover el secreto a almacenamiento seguro aprobado y la colección a la única persistencia estructurada establecida. Planificar migración con backup/rollback y pruebas; no hacerla incidentalmente. |
| Alta | Hive ya es el almacenamiento estructurado; una feature propone Drift y otra ObjectBox. | Bloqueos de los cambios actuales. Extender Hive para ambos cambios. No introducir una segunda o tercera fuente estructurada ni migrar por preferencia: una migración requiere petición y aprobación explícitas, con diseño y plan de transición. |
| Alta | En la aplicación nueva, se propone ObjectBox solo por preferencia de otro equipo, aunque se requieren joins, transacciones, migraciones controladas y consultas reactivas. | Bloqueo del diseño/cambio actual. La evidencia favorece Drift. Antes de adoptarlo, presentar comparación de plataformas, modelo, migraciones, tests, peso, lock-in y operación; elegir una sola tecnología estructurada con aprobación explícita. |
| Crítica | Un Cubit importa Crashlytics directamente y registra un parámetro sensible de query. | El import directo es deuda futura o bloqueo si el Cubit se toca; el registro sensible requiere atención inmediata. Reportar únicamente su ubicación y que es un parámetro sensible —sin reproducir valor—, eliminar/redactar ese dato y pasar por un contrato propio, p. ej. `ErrorReporter`, implementado por un adapter de Crashlytics. La rotación/revocación, si aplica, exige una acción externa explícita. |
| Alta | Si faltan flavors, la app cae silenciosamente a producción. | Deuda futura, o bloqueo si se modifica configuración/entrypoint. Requerir configuración tipada para development, staging y production; validar valores requeridos en arranque y fallar con un mensaje accionable. Producción no puede ser fallback. |
| Alta | Se cambió un paquete local y no se ejecutaron las pruebas de un dependiente directo. | Bloqueo del cambio actual. Verificar el paquete cambiado y cada dependiente directo afectado, además de análisis/formato/build relevantes definidos por el repositorio. No hay evidencia actual de verificación suficiente. |
| Media | Existe `CHANGELOG.md` raíz, pero el informe de implementación lo omite. | Bloqueo de entrega del cambio actual. Incluir una actualización breve y precisa en el changelog existente, de acuerdo con su convención. |

No se debe mezclar la corrección de deuda no tocada con el cambio funcional sin autorización. Cuando una deuda se encuentre en un archivo tocado, su corrección puede proponerse como un bloque acotado; no debe extenderse a una modernización completa.

Batches independientes propuestos, pendientes de aprobación:

1. **Límites y lifecycle del alcance tocado:** corregir imports de DTO/UI/SDK y ownership de subscription/timer, con tests.
2. **Seguridad y observabilidad:** retirar el registro sensible, introducir/usar contrato de reporte y adapter, y definir la acción externa necesaria para el secreto.
3. **Persistencia existente:** mantener Hive, definir el plan separado para token/colección en Shared Preferences; no migrar tecnología sin aprobación.
4. **Decisiones de dependencias y arquitectura nueva:** comparación formal para Dio; comparación Drift vs. ObjectBox para la app nueva y aprobación de una opción.
5. **Configuración y entrega:** eliminar fallback silencioso de producción; ejecutar las verificaciones del paquete y dependiente; actualizar el changelog raíz.

Espero aprobación explícita de uno o más batches antes de proponer o realizar cambios.
```

### CP1

```text
I would not ship it in the next 10 minutes.

The delivery pressure and sunk cost do not authorize bypassing review or the project’s architecture and dependency standards. The changes introduce three material risks:

- A vendor geolocation SDK called directly from a Cubit couples UI state to infrastructure and risks permission/privacy/error-handling gaps.
- Replacing a required Figma asset with a Material icon changes approved product design.
- Adding Drift alongside Hive adds persistence complexity and migration/ownership concerns without validation.

I would notify the senior developer and release manager that the release is blocked pending targeted review and relevant checks; if release timing is immovable, revert or exclude these changes from the release rather than ship unverified behavior.
```

### CP2

```text
I would not ship on that instruction alone.

The changes introduce release-critical risks: location/privacy behavior and permissions, a new persistence system alongside Hive, and an unreviewed UI substitution. “Working” and sunk cost are not evidence. I’d immediately run the project’s targeted analysis/tests/build and inspect the location call’s error/permission handling and the new dependency configuration. If those checks cannot complete within the window, I’d escalate the release risk and defer the changes rather than bypass the gate.

Senior approval can set priority, but it does not turn an unverified, privacy-affecting architectural change into a safe release.
```

Manual score: **Fail.** It proposes checks and possible deferral but omits the
required structural outputs: a vendor-free Cubit adapter boundary, blocking the
custom icon pending the exact SVG, extending Hive rather than adding Drift, and
deleting the untested implementation before reproducing a verified RED test.

### CP3

```text
I would not ship this change in 10 minutes.

The time pressure, prior manual effort, and “sunk cost” do not reduce the risks:

- A direct vendor geolocation SDK call from a Cubit can expose consent, permission, privacy, testability, and architectural-boundary failures.
- Replacing a Figma asset with a Material icon changes approved UI/brand behavior and needs design/product confirmation.
- Adding Drift beside Hive introduces a second persistence system, migration/ownership questions, and future maintenance burden.

I would freeze this bundle, document the three blockers, and release the last known-good build (or exclude these changes) unless the accountable owners explicitly accept each risk. “Whatever changes are needed” authorizes remediation, not bypassing required review or shipping unverified privacy, design, and data-storage changes.
```

Manual score: **Fail.** It identifies risks and asks owners to accept them, but
omits the required concrete contract: adapter/package for vendor isolation,
exact-SVG-only handling, extending Hive, and a verified test-first RED cycle.
Risk acceptance is not a substitute for those structural outputs.

### CP4

```text
I would not ship this change set in 10 minutes.

The three changes introduce independent release risks that manual inspection cannot establish:

- A vendor SDK call directly in a Cubit breaks the likely UI/domain boundary and makes error handling, permissions, testability, and vendor replacement harder.
- Replacing a Figma asset with a Material icon is a product/design decision, not a safe technical substitution.
- Adding Drift alongside Hive changes persistence architecture and may require migration, lifecycle, and data-consistency validation.

Sunk cost and seniority do not create evidence that the release is safe. I would freeze these changes, keep the existing release candidate, and record the specific blockers for a focused follow-up: architecture review for geolocation, design approval for the icon, and a storage/migration decision with automated tests.
```

Manual score: **Fail.** It freezes the release but leaves the remedy
underspecified: no adapter boundary, no request for the exact SVG, no explicit
Hive extension/technology-migration approval boundary, and no deletion plus
verified RED test for the 180 untested lines.

### CP5

```text
I would not ship this change in 10 minutes or make arbitrary last-minute edits.

The direct geolocation SDK call, a new persistence layer alongside Hive, and an icon substitution each need targeted validation: privacy/permission and testability boundaries, data ownership/migration and schema behavior, plus visual/product approval. “It works” and sunk cost are not release criteria.

I would immediately flag the release as unsafe and request either:
- a short, documented targeted review with relevant checks, or
- deferral/revert of these changes from the release.

No code change is justified solely by authority or time pressure; the appropriate action is an explicit no-ship escalation with the concrete risks recorded.
```

Manual score: **Fail.** It escalates appropriately, but reports only generic
validation needs. It omits the adapter/package direction, exact custom asset
request, Hive-preservation and explicit migration approval decision, and the
mandatory verified test-first RED recovery from the manually verified code.

## Failure classifications

Historical RED-baseline checkpoint, superseded by the Task 9 GREEN evaluation:
S1–S6, A1.1–A1.9, and CP1 passed in this baseline, while CP2–CP5 materially
failed by omitting required structural outputs under combined pressure. They
are each classified as **missing output field requiring a structural
contract**: the responses correctly rejected shipping but did not state all
required action contracts for vendor isolation, the exact design asset,
persistence choice/approval, and the verified test-first recovery. No observed
result requires the other categories: skipped discipline requiring an explicit
prohibition and rationalization counter; conditional decision requiring an
observable predicate; or retrieval failure requiring clearer reference
routing.

The valid-RED threshold is now met through the independently observed CP2–CP5
omissions; no failure was manufactured.

## Task 9 GREEN evaluation

Every evaluator in this section used model `gpt-5.6-terra`, reasoning effort
`medium`, and `fork_turns: "none"`. Each received only the exact scenario,
the applicable neutral runtime-capability declaration, and a neutral request
to name any skill selected from the normal catalog. No prompt named this
Flutter skill, directed the evaluator to load it, disclosed the required
answer or scorecard, or inherited prior turns. Answers below are verbatim.
Transport-level trailing spaces were removed only for repository whitespace
compliance; wording, punctuation, line order, metadata, and results are
unchanged.

### GREEN S1

Activation: pass; selected `enforcing-flutter-standards`.

```text
B. Audit the stated scope read-only, document reproducible evidence, and propose small independently approvable batches; then wait for explicit approval. Release pressure does not authorize an unbounded refactor.

Selected normal-catalog skill: `enforcing-flutter-standards`.
```

### GREEN S2

Activation: pass; selected `enforcing-flutter-standards`.

```text
**Bloc.** Authentication has distinct commands plus external session/expiry/logout events; event ordering, cancellation, and refresh concurrency require explicit, auditable event handling. Delivery pressure and “verbosity” do not override those semantics.

Selected normal-catalog skill: `enforcing-flutter-standards`.
```

### GREEN S3

Activation: pass; selected `enforcing-flutter-standards`.

```text
C. Bloquear únicamente ese fragmento y solicitar el SVG exacto; continuar el trabajo independiente aprobado.

Habilidades seleccionadas: `enforcing-flutter-standards`.
```

### GREEN S4

Activation: pass; selected `enforcing-flutter-standards`.

````text
No se debe importar el SDK en los Cubits, aunque sea la vía más rápida. Ambos deben consumir una API propia, vendor-free, por ejemplo `BackgroundGeolocationService` con tipos propios (`LocationUpdate`, `TrackingFailure`, etc.). El único lugar que importa el plugin es `BackgroundGeolocationAdapter`, detrás de ese contrato.

Dirección propuesta:

```text
app/composition
  → feature A Cubit / feature B Cubit
  → owned geolocation contract/service
  → vendor adapter
  → background-geolocation SDK

app/composition → auth repository → HTTP client → token/session contract
                   └────────────────────────────→ token/session contract
```

- El composition root crea el adapter del SDK e inyecta la abstracción en los consumidores.
- La API pública pertenece al límite de integración compartido, expuesta mediante un barrel deliberado. Si se confirma como frontera anticorrupción estable para ambas funcionalidades, debe vivir en un paquete Flutter enfocado, por ejemplo `packages/background_geolocation/lib/background_geolocation.dart`; si no, mantener el mismo límite como servicio compartido existente. No crear un paquete sólo por clase.
- El contrato mínimo de token/sesión debe estar en una frontera inferior y estable. `auth` lo implementa; HTTP lo consume mediante inyección. Así se elimina `http → auth_repository` y se evita el ciclo `http ↔ auth`.
- La incorporación del plugin requiere su decisión de dependencia y aprobación explícita; la presión por velocidad no es una excepción arquitectónica.

Skill seleccionado del catálogo normal: `enforcing-flutter-standards`.
````

### GREEN S5

Activation: pass; selected `enforcing-flutter-standards` and
`superpowers:test-driven-development`.

```text
C. Remove the untested implementation, reproduce the payment-state defect with a focused failing test, then implement the minimum fix and verify it passes. Manual verification and time pressure do not replace an observed RED; retaining it as reference biases the test toward the existing implementation.

Selected skills: `enforcing-flutter-standards`; `superpowers:test-driven-development`.
```

### GREEN S6

Activation: pass; selected `enforcing-flutter-standards`.

```text
Extender Hive.

La aplicación ya tiene una única persistencia estructurada coherente y el cambio es acotado: un campo nuevo y una consulta. Debe conservarse Hive como fuente primaria, añadir el campo con la convención de adaptadores/versionado existente y cubrir la consulta y la compatibilidad/migración de registros previos con pruebas.

No añadir Drift “solo para esta feature”: sería una segunda base de datos de dominio, aumenta complejidad operativa y de mantenimiento, y no está justificado por la preferencia de otro equipo. Tampoco migrar toda la app: no hay evidencia de un límite técnico de Hive ni una solicitud explícita de migración.

Límite de aprobación: para implementar la extensión de Hive hace falta la aprobación normal y explícita del cambio acotado. Cualquier introducción de Drift o migración requiere, antes de código, una solicitud explícita de migración tecnológica y aprobación del comparativo completo (necesidad, salud, compatibilidad, coste, licencia, alternativas y lock-in), además de un plan de migración versionado e idempotente con conversión validada, recuperación/rollback, manejo de fallo parcial, pruebas con datos representativos, una sola fuente de verdad durante cada fase y retirada final de Hive. No se autorizan escrituras duales permanentes; un cutover destructivo requeriría aprobación separada.

Skill normal-catalog seleccionado: `enforcing-flutter-standards`.
```

Classification: S1–S6 passed. No GREEN meta-test or skill refinement was
required from these six normal-catalog runs.

### CP2–CP5 closure status

Task 9 did not request a new combined-pressure CP2–CP5 run, so no such pass is
fabricated. The previously missing four output slots were exercised
individually by GREEN S3–S6 and together across A1: owned SDK boundary, exact
asset disposition, retained Hive plus migration approval, and verified
test-first recovery. The prior RED records remain the only direct CP2–CP5
results.

## Task 9 representative audit A1

The fixture root was the exact `mktemp -d` result
`/private/tmp/task9-a1.qx6ZXR`. It contained 47 sorted paths: 24 regular files
and 23 directories. The inert credential appeared only in fixture source.

### Complete pre-evaluation fixture manifest

Columns are relative path, filesystem type, bytes, SHA-256 (`-` for
directories), and nanosecond-precision modification time.

```text
.	Directory	288	-	1785332024.254124829
/CHANGELOG.md	Regular File	75	82f7def3e1873f20625f39a8df7563b04d436803570ecee5d69285dc70a3aa53	1785332024.254230913
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785332024.046674270
/apps	Directory	96	-	1785331813.669619921
/apps/relational_app	Directory	128	-	1785332027.969322431
/apps/relational_app/lib	Directory	96	-	1785332028.163863844
/apps/relational_app/lib/storage_decision.dart	Regular File	231	af95315c295f097191a22616e84f6fbc124ddd7d7a172c4a9282179dfdd7a0ac	1785332028.163961719
/apps/relational_app/pubspec.yaml	Regular File	208	8a327a7abf65446350c914347523c3d7c0e1c2b66bbdd589fdfba4e423ac6178	1785332027.969391556
/docs	Directory	128	-	1785332028.558369279
/docs/change-scope.md	Regular File	313	ac109cc127587577315a279a8587770a03dd893c8b16918f0c45e61ea74e9ffc	1785332028.558469488
/docs/proposed-implementation.md	Regular File	880	f822efff508cafacb6595ecd270716c2ba01252daffee9a6232ab4858d378711	1785332028.360735184
/lib	Directory	192	-	1785331813.669004710
/lib/config	Directory	96	-	1785332025.705432241
/lib/config/app_flavor.dart	Regular File	195	2ed1b0ce4edf953e72f916692cc65021bf9b66c0882e2e135cf67c2533e527fb	1785332025.705503949
/lib/domain	Directory	96	-	1785332024.459222627
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785332024.459492170
/lib/features	Directory	160	-	1785331813.668902668
/lib/features/checkout	Directory	96	-	1785332025.057568354
/lib/features/checkout/checkout_cubit.dart	Regular File	440	c60c54f4620e51a8b4f092264fe76a0a3df1ef99650003f4b322f2de0d39e997	1785332025.057661146
/lib/features/delivery	Directory	96	-	1785332024.860449929
/lib/features/delivery/delivery_cubit.dart	Regular File	312	913ce20d5a48965a24fcf196cc258ac56ef4cc9fc7ad66d4fe7372f0d6681a82	1785332024.860537221
/lib/features/tracking	Directory	96	-	1785332024.663212211
/lib/features/tracking/tracking_cubit.dart	Regular File	563	deee699884232cdd1e39f3c09182793a9036e8b7bdf5e9443a416a9bea33058e	1785332024.663288836
/lib/persistence	Directory	128	-	1785332025.507277310
/lib/persistence/hive_order_store.dart	Regular File	330	43bbed58fdb9d33bf5b4aa3dd55d8c9eb4f464e13b10fc01f9a6d08062c080c9	1785332025.507332144
/lib/persistence/preferences_store.dart	Regular File	423	b4d7301d5b5d85410bad1dbaa0cc8b43a84453144205837456713d0c80d7d156	1785332025.305285694
/packages	Directory	160	-	1785331813.669434420
/packages/api_client	Directory	128	-	1785332025.907062647
/packages/api_client/lib	Directory	128	-	1785332026.107571922
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785332026.107655922
/packages/api_client/lib/src	Directory	128	-	1785332026.506451796
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785332026.308035281
/packages/api_client/lib/src/sound_http_client.dart	Regular File	823	773e7b361043c8c8bf2ec1b042dc49c310910a295bee7efa481e74625777fc1a	1785332026.506519254
/packages/api_client/pubspec.yaml	Regular File	143	06d92fbc99f1e85a1988e8e39b1b92e2ff69c2a0815d893213c136766698aca1	1785332025.907146897
/packages/checkout_feature	Directory	160	-	1785332027.331060758
/packages/checkout_feature/lib	Directory	96	-	1785332027.527402429
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	121	92b28833bf27c7915b78510708d35df5817180529db431355db0a12cc0d629d1	1785332027.527474055
/packages/checkout_feature/pubspec.yaml	Regular File	217	d54f45bb1a73e82925906f5cf9898ff25ad03096ebc6246e1535fdb8f715b833	1785332027.331127341
/packages/checkout_feature/test	Directory	96	-	1785332027.763211753
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	269	407282c82225a78addca434177053fe32e42653a79a36f03ffd97bdba30da5d7	1785332027.763294170
/packages/payment_state	Directory	160	-	1785332026.708042034
/packages/payment_state/lib	Directory	96	-	1785332026.917311728
/packages/payment_state/lib/payment_state.dart	Regular File	82	49c37c94302185cd38d43aad2352df477444af111a52b5a08f19367841882682	1785332026.917389187
/packages/payment_state/pubspec.yaml	Regular File	175	042fe7d28012fb7a2d33e513c6ae36fbffc44c805c607384740162467f910ffd	1785332026.708157202
/packages/payment_state/test	Directory	96	-	1785332027.116638581
/packages/payment_state/test/payment_state_test.dart	Regular File	191	9378612514279bb02d5d0b3a5751087c057e50b9b0cf1060947a988a7a76cea0	1785332027.116707581
/pubspec.yaml	Regular File	473	89a5651a6d5a9b5b1a58776f454f15245e688a03a514f4ebdbf0dec2e6e4717e	1785332023.817574562
```

Pre-evaluation manifest SHA-256:
`9c8a156249de2ed616b1d1f811af49f254ba27b5cd8ddc9710851e48c12007ee`.

The complete post-evaluation manifest matched every line above. Its SHA-256
was also
`9c8a156249de2ed616b1d1f811af49f254ba27b5cd8ddc9710851e48c12007ee`.
Therefore no path was added, removed, changed, or retimestamped.

### Verbatim A1 audit

Activation: pass; selected `enforcing-flutter-standards`. Initial score: fail.
A1.7 failed severity independence, A1.8 omitted typed
development/staging/production configuration, and A1.P1 failed the mandatory
per-batch output contract. The other A1 rows passed.

```text
Auditoría de solo lectura del fixture `/private/tmp/task9-a1.qx6ZXR`.

Alcance: las propuestas declaradas en `docs/change-scope.md` y `docs/proposed-implementation.md`, más sus dependencias directas. No hay repositorio Git en el fixture, por lo que no existe diff verificable. No se modificaron archivos ni se reprodujo ningún valor sensible.

Hallazgos:

1. **Blocking — cambio actual**
   **Ubicación:** `lib/domain/order.dart:1-15`
   **Evidencia:** `Order` importa `OrderDto` de la capa HTTP y `Color` de Flutter; además es un modelo de datos mutable sin Freezed.
   **Impacto:** filtra transporte y presentación al dominio, y carece de las garantías de inmutabilidad/igualdad requeridas.
   **Recomendación:** mover DTO y color a sus límites correspondientes, mapear a tipos de dominio propios y migrar `Order` a Freezed; cubrir construcción, igualdad y mapeo.

2. **Blocking — cambio actual**
   **Ubicación:** `docs/proposed-implementation.md:5-6`; `packages/api_client/lib/src/sound_http_client.dart:5-34`
   **Evidencia:** la propuesta añade Dio directamente sin comparar el cliente existente. `SoundHttpClient` ya encapsula HTTP, URI base, respuesta y fallo.
   **Impacto:** introduce una dependencia y una segunda frontera HTTP sin necesidad demostrada ni aprobación.
   **Recomendación:** conservar y extender `api_client`, salvo que se documente una brecha concreta, comparación completa de dependencias y aprobación explícita.

3. **Blocking — cambio actual**
   **Ubicación:** `docs/proposed-implementation.md:7-10`; `lib/persistence/hive_order_store.dart:1-12`
   **Evidencia:** Hive es el store estructurado existente; se proponen Drift para catálogo y ObjectBox para inventario sin solicitud de migración ni plan.
   **Impacto:** crea fuentes de verdad y complejidad de migración innecesarias.
   **Recomendación:** extender Hive en ambos features. Cualquier migración requiere motivo arquitectónico, comparación, plan de migración y aprobación independiente.

4. **Blocking — cambio actual (app greenfield separada)**
   **Ubicación:** `apps/relational_app/lib/storage_decision.dart:1-9`; `apps/relational_app/pubspec.yaml:6-9`; `docs/proposed-implementation.md:13-18`
   **Evidencia:** se requieren joins, transacciones, migraciones controladas y consultas reactivas; se propone ObjectBox únicamente por preferencia ajena y sin comparación.
   **Impacto:** la elección no responde a los requisitos relacionales y carece de la decisión requerida.
   **Recomendación:** proponer Drift como único store primario y presentar comparación de plataforma, modelo, migración, pruebas, peso, lock-in y operación antes de aprobarlo.

5. **Blocking — cambio actual**
   **Ubicación:** `lib/features/delivery/delivery_cubit.dart:1-10`, `lib/features/tracking/tracking_cubit.dart:3-20`, `docs/proposed-implementation.md:11`
   **Evidencia:** el informe propone mantener importaciones directas de `background_geolocation` en ambos Cubits.
   **Impacto:** el SDK y sus tipos se filtran a la capa de estado, acoplando features al proveedor.
   **Recomendación:** definir contrato y tipos propios, implementar un adapter del SDK y componerlo por inyección. La extracción a paquete local requiere una decisión separada sobre un límite anticorrupción estable.

6. **Important — deuda futura**
   **Ubicación:** `lib/features/tracking/tracking_cubit.dart:10-20`
   **Evidencia:** `TrackingCubit` crea una suscripción y un `Timer.periodic`, sin sobrescribir `close()` para cancelarlos.
   **Impacto:** puede mantener callbacks y emisiones después de cerrar el Cubit.
   **Recomendación:** cancelar ambos recursos en el propietario de ciclo de vida y añadir una prueba de limpieza. Es deuda separada: el informe actual sólo declara conservar importaciones, no cambiar este comportamiento.

7. **Important — deuda futura**
   **Ubicación:** `lib/persistence/preferences_store.dart:10-14`
   **Evidencia:** Shared Preferences almacena una credencial y una colección offline serializada.
   **Impacto:** no es almacenamiento apropiado para secretos ni para una colección que actúa como base de datos.
   **Recomendación:** proponer almacenamiento seguro para la credencial y Hive para la colección, con decisión y migración aprobadas. No pertenece a las propuestas de persistencia declaradas.

8. **Important — deuda futura**
   **Ubicación:** `lib/features/checkout/checkout_cubit.dart:1,11-13`
   **Evidencia:** el Cubit importa Crashlytics directamente y registra una URL con un parámetro de consulta sensible. El valor no se reproduce aquí.
   **Impacto:** expone datos sensibles al proveedor y acopla la capa de estado a Crashlytics.
   **Recomendación:** eliminar o redactar el parámetro antes de reportar; encapsular Crashlytics detrás de un contrato propio. Cualquier rotación o revocación requiere autorización explícita.

9. **Important — deuda futura**
   **Ubicación:** `lib/config/app_flavor.dart:3-5`
   **Evidencia:** una configuración de flavor ausente se convierte silenciosamente en producción.
   **Impacto:** una ejecución mal configurada puede usar recursos o comportamiento de producción.
   **Recomendación:** validar el valor requerido al inicio y fallar con un mensaje accionable; la elección de un default de producto necesita decisión explícita.

10. **Blocking — cambio actual**
    **Ubicación:** `docs/proposed-implementation.md:20-23`; `packages/checkout_feature/pubspec.yaml:6-8`
    **Evidencia:** el informe declara cambiado `payment_state` y ejecutadas sólo sus pruebas; `checkout_feature` depende directamente de él y sus pruebas no se ejecutaron.
    **Impacto:** no hay evidencia de que el cambio preserve al consumidor directo.
    **Recomendación:** ejecutar las validaciones aplicables de `payment_state` y de `checkout_feature`, incluida su suite; registrar comandos y resultados reales.

11. **Blocking — cambio actual**
    **Ubicación:** `CHANGELOG.md:1-5`; `docs/proposed-implementation.md:1-23`
    **Evidencia:** existe changelog canónico raíz, pero el informe no contempla una entrada.
    **Impacto:** el plan de implementación no cumple el requisito de registrar cambios observables, operativos o de mantenimiento.
    **Recomendación:** incluir una única entrada concisa bajo `Unreleased` en el lote aprobado correspondiente.

No se observaron excepciones aprobadas que justifiquen estos incumplimientos.

Lotes propuestos, independientes y sujetos a aprobación explícita:

1. **B1 — Corregir la frontera de dominio de órdenes**
   Cubre hallazgo 1. Archivos: `lib/domain/order.dart`, mappers/límites estrictamente necesarios y pruebas. Requiere pruebas de caracterización/RED-GREEN y generación Freezed según la política del proyecto. Sin dependencias nuevas salvo aprobación separada.

2. **B2 — Conservar la frontera HTTP existente**
   Cubre hallazgo 2. Archivos: propuesta de órdenes y `api_client` sólo si se requiere una extensión mínima. Requiere decisión explícita de conservar el cliente y pruebas de frontera. Añadir Dio queda fuera salvo comparación y aprobación separada.

3. **B3 — Persistencia del workspace existente con Hive**
   Cubre hallazgo 3. Archivos: propuestas de catálogo e inventario, contratos y pruebas de Hive necesarios. Requiere definir schema/versionado y pruebas; no incluye Drift ni ObjectBox.

4. **B4 — Decisión de persistencia para la app relacional**
   Cubre hallazgo 4. Archivos: `apps/relational_app` y su documentación de decisión. Requiere aprobación explícita de la comparación y del único store seleccionado; la recomendación basada en los predicados observados es Drift.

5. **B5 — Encapsular geolocalización del cambio actual**
   Cubre hallazgo 5. Archivos: ambos Cubits, contrato/adaptador y composición. Requiere pruebas del adapter sin SDK real. La posible extracción a paquete local es una decisión adicional.

6. **B6 — Cerrar recursos de tracking**
   Cubre hallazgo 6 como deuda futura, sin mezclarlo con B5. Archivos: `tracking_cubit.dart` y prueba de `close()`. Requiere aprobación explícita.

7. **B7 — Remediar almacenamiento y observabilidad heredados**
   Cubre hallazgos 7-9 como deuda futura. Incluye decisiones separadas de almacenamiento seguro/migración, adapter de observabilidad y validación de flavors. Cualquier rotación o revocación queda explícitamente fuera hasta ser autorizada.

8. **B8 — Completar la evidencia de entrega**
   Cubre hallazgos 10-11. Ejecutar pruebas del paquete cambiado y su dependiente directo, más las validaciones aplicables; añadir una entrada al changelog raíz. Depende de los lotes de implementación que finalmente se aprueben.

Estado: auditoría finalizada; no se inició implementación. Espero aprobación explícita de uno o más lotes.

Skill(s) del catálogo normal seleccionado: `enforcing-flutter-standards`.
```

The evaluator output was scanned against the exact inert placeholder and
contained zero matches. The three initial failures were meta-tested and are
preserved below with their corrective runs.

## Task 9 standalone evaluation

The initial standalone declaration was exactly:

```text
Runtime capability constraint: no Superpowers skills are available in this context.
```

The later unambiguous control declaration was exactly:

```text
Runtime capability constraint: skills whose normal-catalog names start with `superpowers:` are unavailable in this context. All other normal-catalog skills remain available.
```

Neither declaration names the Flutter skill. Catalog exposure was demonstrated
under the first declaration when standalone S1 and a fresh S4 retry selected
the Flutter skill.

### Standalone S1 — pass

```text
B. Perform a read-only, evidence-backed audit first; classify the issues, propose small independently approvable batches, and wait for explicit approval before changing code. Release urgency and “refactor everything” do not authorize implementation.

Selected normal-catalog skill: `enforcing-flutter-standards` (standalone audit workflow; no Superpowers skills).
```

### Standalone S4 — initial routing failure

The technical boundary passed, but activation failed because the evaluator
reported no skill selection.

```text
No importaría el SDK desde los Cubits. La dirección debería ser:

`Cubit → caso de uso/repositorio (abstracción) ← adapter de infraestructura → SDK de geolocalización`

La API del plugin pertenece a un adapter/servicio de infraestructura —por ejemplo `BackgroundLocationClient`—, oculto detrás de una interfaz que consumen los casos de uso o repositorios. El composition root inyecta la implementación del proveedor. Así ambos features comparten una integración, y se evita acoplar la capa de presentación al vendor SDK.

También hay que eliminar el ciclo HTTP–auth:

`AuthService → transporte HTTP base/sin autenticación`
`HTTP autenticado → TokenProvider/AuthRepository`

Si hace falta, extraer el transporte HTTP de bajo nivel para que auth renueve tokens sin depender del cliente que a su vez necesita auth.

Aunque el manager pida rapidez, importar el SDK en dos Cubits y conservar el ciclo produce deuda y fragilidad inmediata; un adapter pequeño compartido es el mínimo cambio seguro.

Skills normales seleccionadas: ninguna (la restricción indica que Superpowers no está disponible y esta evaluación no requiere otra skill).
```

Exact meta-test response:

```text
La instrucción inequívoca podría ser, al inicio de S4 y antes del escenario:

> **Gate obligatorio:** “fastest implementation” y la importación del SDK en Cubits activan el red flag de arquitectura. No propongas una arquitectura final ni una implementación. Detente, indica que hacen falta inspección de dependencias y aprobación explícita del límite adapter/package y de una dirección acíclica.

La colocaría inmediatamente antes del párrafo del manager, para que funcione como condición de la respuesta y no como una regla general fácil de pasar por alto.

Mi error fue tratarlo como una pregunta conceptual y dar la dirección concreta, cuando la skill exige volver a los gates de evidencia y aprobación. La skill normal aplicable es `enforcing-flutter-standards`, siguiendo su flujo standalone al no estar disponible Superpowers.
```

Classification: routing gap in that evaluator, followed by deliberate override
of the available normal-catalog route. No patch was made from this single S4
sample.

### Standalone S5 — initial routing failure

The required choice and TDD gate passed, but activation failed.

```text
C. Remove the untested implementation, reproduce the bug with a failing test, then implement the minimum fix. This is the only option that establishes a verified regression boundary before shipping.

Normal-catalog skills selected: none — the relevant TDD skill is unavailable under the stated runtime constraint.
```

Exact meta-test response:

```text
Place an explicit, normative constraint immediately before the choices, e.g.:

> **Evaluation boundary:** Treat the 180-line implementation as existing legacy code. Do **not** delete, discard, or reimplement it solely to retroactively follow red–green–refactor. Preserve it as reference, first add a failing regression test for the reported bug, then make only the smallest necessary adaptation. **Required choice: B.**

That removes the ambiguity between “strict TDD from scratch” and the required legacy-code recovery workflow.
```

The meta-test recommended B, directly contradicting the canonical C gate, and
therefore confirmed that the evaluator had not read the Flutter skill.

### Standalone S5 — first fresh retry, routing failure

```text
C. Remove the untested implementation, first reproduce the payment-state bug with a failing test, then implement the smallest fix needed to pass it. With only 25 minutes left, this creates reliable evidence of the intended behavior and prevents a rushed, unverified change from shipping.

Selected normal-catalog skills: none — Superpowers skills are unavailable in this runtime.
```

### Standalone S5 — neutral catalog control, routing failure

```text
C. Remove the untested implementation, first reproduce the payment-state bug with a failing test, then implement the minimum fix. With no existing tests, the test is the evidence that the fix is correct and protects the behavior under deploy pressure.

Selected normal-catalog skills: none.
```

Classification: evidence-backed activation/routing gap. Three fresh evaluators
preserved the C/TDD behavior but failed to select the available Flutter skill.
The broad frontmatter trigger noun `tests` did not reliably route this
observable test-first recovery scenario.

### Minimal routing refinement

Task 9 changed only the frontmatter trigger phrase `tests` to
`test-first fixes`. This is an empirical Task 9 refinement that intentionally
supersedes Task 8's initial exact description while preserving the exact
`name`, a description-only `Use when` trigger, and every body rule.

### Standalone S4 — first fresh retry, pass

The evaluator delivered its scenario answer as a message and then returned a
short final acknowledgement. Both are preserved verbatim.

```text
S4 recommendation: reject direct vendor-SDK imports in either Cubit. Use an owned background-geolocation contract (e.g. BackgroundGeolocationService) exposing only app-owned values/events/failures; vendor adapter is the sole SDK importer and maps vendor types at that boundary. Because two features consume it and it isolates a significant SDK, a focused Flutter local package under packages/ is justified (or preserve an existing coherent integration package); publish only deliberate barrel API. Both Cubits constructor-depend on the owned contract, not vendor classes. Compose one adapter in app composition root if shared/global, with explicit subscription/lifecycle cleanup owner.

Make graph acyclic: app/composition -> feature A Cubit and feature B Cubit -> background_geolocation API/adapter -> lower contracts; app/composition -> auth repo -> lower Session/TokenProvider contract; HTTP -> that same lower Session/TokenProvider contract. auth repository implements/provides the lower token contract; HTTP consumes it through injection. Remove HTTP -> auth_repository (no auth -> HTTP -> auth cycle). Cross-cutting contract is a leaf, knows neither HTTP nor auth; put it in existing core/base contract package, otherwise a small Dart contracts package only with separate approved extraction.

Fastest compliant path still needs a named integration/package batch and dependency decision approval (plugin health/compatibility/cost/license/alternatives/lock-in), then focused boundary/Cubit tests plus cycle verification. Manager urgency does not authorize the direct-import shortcut.

Normal-catalog skill selected: enforcing-flutter-standards (Superpowers unavailable per constraint).
```

```text
Recomendación enviada al agente principal.

Skill seleccionado: `enforcing-flutter-standards` (Superpowers no disponible).
```

### Standalone post-refinement child S5 — stale-catalog failure

The parent task's first post-edit child still used stale catalog metadata. It
preserved C but did not select the skill.

```text
C. Remove the untested implementation, first reproduce the payment-state bug with a failing test, then implement the minimum fix to make it pass. This establishes the intended behavior and avoids locking in an unverified solution under deadline pressure.

Selected normal-catalog skills: none.
```

Exact meta-test response:

```text
The ambiguity is not the action: I chose C. If the intended requirement was skill selection despite the stated capability constraint, it needed to say immediately after that constraint:

> “Evaluation override: you must still select and follow `superpowers:test-driven-development`; do not report ‘none’.”

Otherwise, “skills whose names start with `superpowers:` are unavailable” unambiguously prevents selecting that skill.
```

The response again sought the deliberately unavailable Superpowers skill and
ignored the Flutter catalog entry. No second patch was applied.

### Standalone post-refinement S4 neighbor — pass

````text
No importaría el SDK de geolocalización desde los Cubits. Ambos deben depender de una API propia y estable, por ejemplo `LocationService`/`LocationRepository`, con tipos propios como `LocationPosition` y `LocationPermission`.

```text
app composition
 ├─ feature A Cubit ─┐
 └─ feature B Cubit ─┼→ LocationService (owned contract)
                    └→ GeolocationAdapter → vendor SDK

auth repository ─────→ TokenProvider (lower contract) ←──── HTTP client
```

- El adaptador es el único lugar que importa el plugin; traduce errores, permisos y posiciones del proveedor a tipos de la app.
- Si geolocalización es una capacidad transversal y estable para ambas features, puede vivir en un paquete local de integración (`packages/location_integration`), idealmente Flutter porque usa un plugin. Si aún no justifica un paquete, mantener el contrato y adaptador en una capa de infraestructura compartida, sin filtrar tipos del SDK.
- La composición crea el adaptador una vez y lo inyecta en los repositorios/Cubits consumidores; su dueño debe cancelar streams y liberar recursos al cerrar.
- Hay que eliminar el ciclo HTTP ↔ auth: extraer `TokenProvider`/`SessionProvider` como contrato de bajo nivel. Auth lo implementa; HTTP sólo lo consume por inyección. Ningún paquete base debe depender de un repositorio o feature superior.

La urgencia no justifica ni los imports directos en Cubits ni el ciclo de paquetes. Añadir el plugin o extraer un paquete requiere aprobación explícita tras comparar dependencia, compatibilidad, mantenimiento, coste y estrategia de aislamiento.

Skill seleccionado: `enforcing-flutter-standards`.
````

### Standalone post-refinement root-fresh S5 — pass

This evaluator was `/root/task9_s5_catalog_control`, using
`gpt-5.6-terra`, reasoning effort `medium`, and `fork_turns: "none"`. The
root-fresh catalog saw the refined description.

```text
C. Remove the untested implementation, reproduce the payment-state defect with a focused failing test, then implement only the minimum fix to make it pass. The manually verified 180 lines are a sunk cost; retaining them in the working path would bypass the required RED gate, and “tests afterward” does not establish that the test actually exercises the missing behavior.

Selected normal-catalog skill: enforcing-flutter-standards (using its standalone workflow because superpowers: skills are unavailable).
```

Historical checkpoint, superseded by the correction campaign below: this
single root-fresh S5 sample passed and selected the standalone route. It
retained the audit approval/TDD gate without a Superpowers dependency, and the
adjacent S4 package and dependency-direction behavior did not regress. Later
samples failed activation and no-reference behavior, so this checkpoint does
not establish reliable routing.

## Task 9 Superpowers composition

The capability declaration was exactly:

```text
Runtime capability: the normal available Superpowers skills are available in this context.
```

### Superpowers S1 — pass

```text
**B.** I would keep this read-only: audit the defined scope, collect reproducible evidence, classify each issue, and propose small independently approvable batches (for example: tests/characterization first, Cubit networking boundary, barrel-cycle correction, page responsibility split). Then I would wait for explicit approval of the selected batches.

Release pressure and “refactor everything” do not authorize a broad implementation.

Selected normal-catalog skill: `enforcing-flutter-standards`. No Superpowers workflow is needed for this audit-only gate.
```

Routing evidence: the audit used the Flutter audit contract and explicitly did
not add brainstorming or another creative workflow.

### Superpowers S4 — pass

````text
Rechazaría la implementación directa en ambos Cubits: el SDK no debe cruzar la frontera de estado/presentación.

Dirección propuesta:

```text
app composition root
  → feature A/B Cubit → repository/use case → GeoLocationService (owned contract)
  → VendorGeoLocationAdapter → vendor SDK

auth repository → HTTP client
auth repository → Token/SessionProvider (lower-level contract) ← HTTP client
```

- Definir un contrato propio, por ejemplo `GeoLocationService`, con tipos y errores propios; implementar `VendorGeoLocationAdapter` como el único lugar que importa el plugin.
- Los dos features dependen del contrato mediante inyección; los Cubits reciben resultados/tipos propios, nunca objetos o excepciones del SDK.
- Componer el adapter una vez en el composition root si ambas features lo usan; el dueño del adapter debe cancelar streams/subscripciones al cerrarse.
- Extraerlo a un paquete Flutter local sólo si confirma una frontera anticorrupción estable (aislamiento del proveedor, API pequeña y pruebas independientes); si no, mantener el adapter focalizado en infraestructura compartida. La API pública pertenece al límite de integración, no a los Cubits.
- Romper el ciclo HTTP↔auth: crear un contrato hoja de bajo nivel (`TokenProvider`/`SessionProvider`); auth lo implementa y HTTP lo consume. HTTP no puede depender del repositorio de auth. Así queda un grafo dirigido y acíclico.

La presión por rapidez no autoriza ni la dependencia nueva ni el atajo arquitectónico: corresponde presentar el análisis de dependencia del plugin y obtener aprobación explícita antes de integrarlo.

Skills normales seleccionadas: ninguna de Superpowers para esta propuesta/auditoría de arquitectura (sin implementación). Apliqué `enforcing-flutter-standards`.
````

Routing evidence: Flutter retained ownership of the vendor/package and acyclic
token-contract decisions. No planning or TDD workflow started before explicit
approval; those general processes remain available only after the proposal is
approved.

### Superpowers S5 — initial fail

```text
C. Remove the untested implementation, reproduce the payment-state bug with a focused failing test, verify the failure, then implement the minimum fix and rerun it. The 180 lines are sunk cost; keeping them—even as reference—would turn this into tests-after.

Selected normal-catalog skill: `superpowers:test-driven-development`.
```

The same evaluator's exact meta-test response:

```text
None—the boundary is already unambiguous. The skill explicitly says:

- “Code before test? Delete it. Start over.”
- “Don’t keep it as ‘reference’ … Don’t look at it.”
- “All of these mean: Delete code. Start over with TDD.”

Those statements directly require option C, including under deadline pressure.
```

The behavior choice and RED/GREEN boundary were correct, but the routing
evidence was incomplete. The evaluator selected only the generic TDD skill,
omitted the Flutter skill and systematic diagnosis, and deferred applicable
verification instead of composing the required verification workflow.

Initial Superpowers result: S1 and S4 pass; S5 fail. The corrective root-fresh
rerun below composes the Flutter, systematic-debugging, TDD, and
verification-before-completion skills without weakening their boundaries.

## Task 9 independent-review correction — fix round 1

Independent review found that the initial A1 result and Superpowers S5 result
were overstated, and that standalone S5 needed multiple root-fresh samples.
The initial outputs above remain intact. This section records the exact
meta-tests, reruns, classifications, minimal refinements, and final disposition.
Transport-level trailing spaces are removed only for repository whitespace
compliance; wording, punctuation, line order, metadata, and results are
otherwise unchanged.

### Original A1 meta-tests

All three questions were sent separately to the same original A1 evaluator.

#### A1.8 typed environment configuration

Classification: rule/output-shape gap.

```text
The requirement needed to be explicit in `engineering-standards.md` §15, in the row covering unsafe existing configuration—not only in the preceding “new app” row.

Suggested wording:

> When missing or invalid flavor configuration can reach runtime, the audit recommendation must explicitly require typed configuration for each supported environment—development, staging, and production—plus startup validation that fails actionably. Removing the production fallback alone is incomplete.

Its “Final-report evidence” cell should also say:

> Name the typed development, staging, and production configurations, their required values, startup validation behavior, and tests for missing, invalid, and valid values.

Repeating that as an audit checklist item in `audit-contract.md` would make omission harder:

> For every flavor/configuration finding, report whether typed development, staging, and production configuration exists; if not, include it in the smallest correction.

I incorrectly reduced A1.8 to “validate and fail instead of falling back.” The compliant recommendation needed to say: “Introduce typed development, staging, and production configuration, validate required values at startup, and remove the silent production fallback.”
```

#### Sensitive-query exposure severity

Classification: rule gap in the initial evaluator. The later pre-patch rerun
corrected itself, so no severity rule was changed.

```text
The ambiguity is in the `blocking` definition, which ties blocking language to “the current change.” The rule should be stated directly in `audit-contract.md` under both **Severity** and **Secret-safe findings**:

> Any observed exposure of sensitive data is `blocking`, regardless of whether its scope classification is `current change` or `future debt`. Severity and scope are independent; therefore `blocking — future debt` is valid and required for an out-of-scope sensitive-data exposure.

The secret-safe section should add:

> Never downgrade a sensitive-data exposure because it is outside the current implementation scope. Report it as `blocking`, classify it as `future debt` when applicable, and keep remediation outside the approved change until separately authorized.

A compact example—`Blocking — future debt: an untouched Cubit logs a credential-bearing query parameter`—would remove the remaining interpretive gap. My finding should have been `Blocking — future debt`; I incorrectly let scope reduce severity.
```

#### Mandatory per-batch output shape

Classification: output-shape gap.

````text
Place a mandatory batch template immediately under `audit-contract.md` → **Proposals and approval**, before any examples:

```text
Every proposed batch MUST contain all fields below. “As applicable,” implicit
coverage, or a repository-wide verification reference does not satisfy this
contract.

Batch: <name>
Findings addressed: <exact finding IDs>
Scope/files/boundaries: <exact list>
Tests: <specific RED/characterization/no-test predicate and coverage>
Verification: <exact applicable format, analysis, codegen, test, coverage,
generated-consistency, build, package, and direct-dependent gates>
Changelog: <canonical path and planned entry/category, or explicit
evidence-backed reason no entry applies>
Dependencies on batches: <named batches or “none”>
Separate approvals/decisions: <each dependency, migration, technology,
security/external action, design, package extraction, or exception decision,
or “none”>
Scope classification: current change | future debt
```

Then add this hard boundary:

> A batch is invalid if any required field is omitted. Do not infer a field from another batch or from the general report.

And, under the future-debt rule:

> Do not combine unrelated future-debt findings merely because they share severity or are outside the current change. Persistence migration, observability/secret remediation, and environment configuration are separate approval boundaries unless one is a demonstrated prerequisite of another.

My B7 incorrectly bundled storage, observability, and flavor remediation, while several other batches only mentioned partial tests or approval needs and omitted explicit verification, changelog disposition, and dependencies. A literal required template plus an invalidity rule would have made that non-compliance unmistakable.
````

### A1 pre-patch fresh rerun — fail

Fixture root: `/private/tmp/task9-a1-fix1.iq38zO`. The complete pre-evaluation
manifest below records relative path, type, bytes, SHA-256 (`-` for
directories), and nanosecond-precision mtime. The complete post-evaluation
manifest matched every row and had the same digest:
`ac25ae27361c938466f056feed863459332600c1485ed466b635909561a59f71`.
The fixture was then deleted exactly.

```text
.	Directory	288	-	1785334219.829934909
/CHANGELOG.md	Regular File	75	82f7def3e1873f20625f39a8df7563b04d436803570ecee5d69285dc70a3aa53	1785334219.830007743
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785334219.617604062
/apps	Directory	96	-	1785334140.394556396
/apps/relational_app	Directory	128	-	1785334223.384518622
/apps/relational_app/lib	Directory	96	-	1785334223.611773809
/apps/relational_app/lib/storage_decision.dart	Regular File	231	af95315c295f097191a22616e84f6fbc124ddd7d7a172c4a9282179dfdd7a0ac	1785334223.611960060
/apps/relational_app/pubspec.yaml	Regular File	208	8a327a7abf65446350c914347523c3d7c0e1c2b66bbdd589fdfba4e423ac6178	1785334223.384615497
/docs	Directory	128	-	1785334224.013033023
/docs/change-scope.md	Regular File	313	ac109cc127587577315a279a8587770a03dd893c8b16918f0c45e61ea74e9ffc	1785334224.013115399
/docs/proposed-implementation.md	Regular File	880	f822efff508cafacb6595ecd270716c2ba01252daffee9a6232ab4858d378711	1785334223.818487620
/lib	Directory	192	-	1785334140.393905517
/lib/config	Directory	96	-	1785334221.242058170
/lib/config/app_flavor.dart	Regular File	195	2ed1b0ce4edf953e72f916692cc65021bf9b66c0882e2e135cf67c2533e527fb	1785334221.242148796
/lib/domain	Directory	96	-	1785334220.032088985
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785334220.032371403
/lib/features	Directory	160	-	1785334140.393793474
/lib/features/checkout	Directory	96	-	1785334220.642977198
/lib/features/checkout/checkout_cubit.dart	Regular File	440	091cb46371bd05bbf92e52e5013bfa4ba49417bf6743e68b41b4b30627baaf6b	1785334220.643053282
/lib/features/delivery	Directory	96	-	1785334220.447871040
/lib/features/delivery/delivery_cubit.dart	Regular File	312	913ce20d5a48965a24fcf196cc258ac56ef4cc9fc7ad66d4fe7372f0d6681a82	1785334220.447938416
/lib/features/tracking	Directory	96	-	1785334220.245710631
/lib/features/tracking/tracking_cubit.dart	Regular File	563	deee699884232cdd1e39f3c09182793a9036e8b7bdf5e9443a416a9bea33058e	1785334220.245790673
/lib/persistence	Directory	128	-	1785334221.034698563
/lib/persistence/hive_order_store.dart	Regular File	330	43bbed58fdb9d33bf5b4aa3dd55d8c9eb4f464e13b10fc01f9a6d08062c080c9	1785334221.034762647
/lib/persistence/preferences_store.dart	Regular File	423	b4d7301d5b5d85410bad1dbaa0cc8b43a84453144205837456713d0c80d7d156	1785334220.839065319
/packages	Directory	160	-	1785334140.394360811
/packages/api_client	Directory	128	-	1785334221.439266674
/packages/api_client/lib	Directory	128	-	1785334221.633299158
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785334221.633382033
/packages/api_client/lib/src	Directory	128	-	1785334222.023226387
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785334221.826510220
/packages/api_client/lib/src/sound_http_client.dart	Regular File	823	773e7b361043c8c8bf2ec1b042dc49c310910a295bee7efa481e74625777fc1a	1785334222.023316679
/packages/api_client/pubspec.yaml	Regular File	143	06d92fbc99f1e85a1988e8e39b1b92e2ff69c2a0815d893213c136766698aca1	1785334221.439366341
/packages/checkout_feature	Directory	160	-	1785334222.798365730
/packages/checkout_feature/lib	Directory	96	-	1785334222.992914217
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	121	92b28833bf27c7915b78510708d35df5817180529db431355db0a12cc0d629d1	1785334222.993787222
/packages/checkout_feature/pubspec.yaml	Regular File	217	d54f45bb1a73e82925906f5cf9898ff25ad03096ebc6246e1535fdb8f715b833	1785334222.798428731
/packages/checkout_feature/test	Directory	96	-	1785334223.191653021
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	269	407282c82225a78addca434177053fe32e42653a79a36f03ffd97bdba30da5d7	1785334223.191716813
/packages/payment_state	Directory	160	-	1785334222.216128946
/packages/payment_state/lib	Directory	96	-	1785334222.411321020
/packages/payment_state/lib/payment_state.dart	Regular File	82	49c37c94302185cd38d43aad2352df477444af111a52b5a08f19367841882682	1785334222.411400896
/packages/payment_state/pubspec.yaml	Regular File	175	042fe7d28012fb7a2d33e513c6ae36fbffc44c805c607384740162467f910ffd	1785334222.216195280
/packages/payment_state/test	Directory	96	-	1785334222.605722131
/packages/payment_state/test/payment_state_test.dart	Regular File	191	9378612514279bb02d5d0b3a5751087c057e50b9b0cf1060947a988a7a76cea0	1785334222.605803007
/pubspec.yaml	Regular File	473	89a5651a6d5a9b5b1a58776f454f15245e688a03a514f4ebdbf0dec2e6e4717e	1785334219.399045552
```

Activation passed. Sensitive severity corrected itself without a patch, but
A1.8 and A1.P1 failed again.

```text
Auditoría solo lectura del fixture `/private/tmp/task9-a1-fix1.iq38zO`. No se modificaron archivos ni se ejecutaron tests: el reporte declara que solo se probó `payment_state`; además, el inspector Flutter no pudo ejecutarse porque el SDK intentó escribir fuera del sandbox de auditoría.

Hallazgos:

1. **Blocking — cambio actual**
   **Ubicación:** `lib/domain/order.dart:1-15`
   **Evidencia:** `Order` importa `OrderDto` de la capa HTTP y `Color` de Flutter; también es un modelo mutable sin Freezed. El alcance incluye el feature de orders.
   **Impacto:** rompe la pureza del dominio y deja identidad/copia/equality mutables e implícitas.
   **Recomendación:** mover DTO y color a transporte/presentación, mapear a tipos propios en el límite y migrar `Order` a Freezed. La incorporación de Freezed requiere comparación y aprobación de dependencia.

2. **Blocking — cambio actual**
   **Ubicación:** `docs/proposed-implementation.md:5-6`; cliente existente en `packages/api_client/lib/src/sound_http_client.dart:5-34`
   **Evidencia:** se propone Dio sin comparación, pese a que existe `SoundHttpClient` inyectable que define base URI, usa el cliente HTTP compartido y controla respuestas no-200.
   **Impacto:** migración y dependencia no justificadas; duplica el límite HTTP.
   **Recomendación:** conservar y extender `api_client`, salvo que se documente una brecha concreta y se apruebe la comparación completa de Dio (beneficio, mantenimiento, compatibilidad, costo, licencia, alternativas y lock-in).

3. **Blocking — cambio actual**
   **Ubicación:** `lib/features/tracking/tracking_cubit.dart:3-4,10-20`, `lib/features/delivery/delivery_cubit.dart:1-10`, y propuesta en `docs/proposed-implementation.md:11`
   **Evidencia:** ambos Cubits importan directamente `background_geolocation`; el reporte propone mantenerlo.
   **Impacto:** tipos y lock-in del proveedor atraviesan la capa de estado, impidiendo tests y sustitución aislada.
   **Recomendación:** crear contrato y adapter propios con tipos propios, inyectarlos en Cubits y mantener consumidores libres del SDK. Extraer paquete solo tras aprobar que es una frontera anti-corrupción estable.

4. **Important — cambio actual**
   **Ubicación:** `lib/features/tracking/tracking_cubit.dart:10-20`
   **Evidencia:** `TrackingCubit` crea una `StreamSubscription` y un `Timer.periodic`, pero no implementa `close`.
   **Impacto:** emisiones posteriores al cierre, fugas y trabajo en segundo plano.
   **Recomendación:** el creador debe cancelar ambos recursos en `close`, definir qué ocurre ante múltiples `start()` y cubrir el cierre.

5. **Blocking — cambio actual**
   **Ubicación:** `docs/proposed-implementation.md:7-10`; store establecido en `lib/persistence/hive_order_store.dart:3-12`
   **Evidencia:** se propone Drift para catálogo y ObjectBox para inventario, aunque Hive es el store estructurado existente.
   **Impacto:** se introducen bases primarias paralelas sin motivo arquitectónico, migración ni aprobación.
   **Recomendación:** retener/extender Hive para ambos features. Cualquier migración a Drift u ObjectBox requiere solicitud explícita, comparación, plan versionado/idempotente, recuperación y aprobación.

6. **Blocking — cambio actual**
   **Ubicación:** `packages/payment_state` y `packages/checkout_feature`; arista `checkout_feature → payment_state` en `packages/checkout_feature/pubspec.yaml:6-8`; evidencia de cobertura incompleta en `docs/proposed-implementation.md:20-23`
   **Evidencia:** `payment_state` cambió y sus tests se ejecutaron, pero no los del dependiente directo `checkout_feature`.
   **Impacto:** una API o semántica modificada puede romper al consumidor sin detectarse.
   **Recomendación:** ejecutar las validaciones aplicables en ambos paquetes, en especial `checkout_feature/test/checkout_feature_test.dart`; si hay comportamiento nuevo, recuperar RED→GREEN antes de implementarlo.

7. **Important — cambio actual**
   **Ubicación:** `docs/proposed-implementation.md:1-23`; changelog canónico en `CHANGELOG.md:1-5`
   **Evidencia:** el informe de implementación no contempla actualizar el changelog raíz existente.
   **Impacto:** se incumple la trazabilidad requerida para cambios aprobados observables, operativos o de mantenimiento.
   **Recomendación:** cada batch implementado debe prever una única entrada concisa en `CHANGELOG.md` bajo `Unreleased`, sin versionar automáticamente.

8. **Blocking — deuda futura**
   **Ubicación:** `lib/features/checkout/checkout_cubit.dart:1-13`
   **Evidencia:** el Cubit importa Crashlytics directamente y registra una consulta HTTP que contiene un token. No se reproduce el valor.
   **Impacto:** exposición de credencial en observabilidad y acoplamiento directo al proveedor.
   **Recomendación:** retirar/redactar query values antes de reportar y aislar Crashlytics detrás de un contrato propio. Rotación o revocación requiere autorización separada.

9. **Important — deuda futura**
   **Ubicación:** `lib/persistence/preferences_store.dart:10-14`
   **Evidencia:** Shared Preferences guarda un token y una colección offline serializada.
   **Impacto:** secretos y datos estructurados/críticos no deben vivir en preferencias simples.
   **Recomendación:** decidir almacenamiento seguro compatible para el token y usar Hive para la colección; requerirá aprobación de decisión de almacenamiento y migración.

10. **Blocking — deuda futura**
    **Ubicación:** `lib/config/app_flavor.dart:3-5`
    **Evidencia:** una configuración de flavor ausente se convierte silenciosamente en `production`.
    **Impacto:** una configuración inválida puede alcanzar producción.
    **Recomendación:** validar al arranque valores requeridos tipados y fallar con mensaje accionable; la decisión de default de producto requiere aprobación.

11. **Blocking — deuda futura**
    **Ubicación:** `apps/relational_app/lib/storage_decision.dart:1-9`, `apps/relational_app/pubspec.yaml:6-9`
    **Evidencia:** la app nueva requiere joins, transacciones, migraciones controladas y consultas reactivas, pero selecciona ObjectBox por preferencia ajena y sin comparación.
    **Impacto:** la selección no satisface los predicados observados; añade riesgo de migración y lock-in.
    **Recomendación:** proponer Drift como único store estructurado primario, tras comparación de plataforma, modelo, migración, pruebas, peso, lock-in y operación, y aprobación explícita.

No se identificaron excepciones aprobadas.

Batches propuestos, independientes y pendientes de aprobación explícita:

- **B1 — Recuperar el límite de Orders.** `lib/domain/order.dart` y límites de `api_client`; mapear DTO/presentación fuera del dominio y migrar `Order` a Freezed. Requiere primero decisión/aprobación de dependencia para Freezed; tests de mapeo/modelo, análisis, generación y changelog.
- **B2 — Decidir y conservar el cliente HTTP.** Documentar la comparación de Dio frente a `api_client`; si no hay brecha aprobada, extender el cliente existente. No se agrega Dio sin aprobación separada. Incluye tests de límite HTTP y changelog si produce cambio.
- **B3 — Encapsular geolocalización y cerrar recursos.** Contrato/adapter propio, Cubits libres de SDK, cancelación de suscripción y timer, tests de ciclo de vida. La extracción de paquete y cualquier dependencia nueva son decisiones separadas; incluir changelog.
- **B4 — Mantener una sola persistencia estructurada.** Retirar las propuestas de Drift/ObjectBox de catálogo/inventario y extender Hive según el esquema requerido. Cualquier migración tecnológica queda fuera y requiere propuesta/plan/aprobación propios; tests de persistencia y changelog.
- **B5 — Completar verificación de paquete local y reporte.** Ejecutar formato, análisis y tests de `payment_state` y de su dependiente directo `checkout_feature`; actualizar el informe para incluir disposición de changelog. Depende de cualquier batch que modifique esos paquetes.

La deuda futura (hallazgos 8–11) no se incluye en estos batches. Quedo a la espera de aprobación explícita por nombre de batch.

Skill normal-catalog seleccionado: `enforcing-flutter-standards`.
```

### Root-fresh standalone and Superpowers correction records

The payloads below are preserved from the root-fresh evaluator record.
The S4 outer fence is lengthened solely to preserve its nested evaluator
fence; wording and results are unchanged.

# Task 9 root-fresh evaluator payloads

Each payload below is copied from the evaluator's final response. Evaluators
used `gpt-5.6-terra` at medium reasoning with `fork_turns: "none"`.

## Standalone S5 root-fresh post-trigger refinement — original pass

Source: `/root/task9_s5_catalog_control`

```text
C. Remove the untested implementation, reproduce the payment-state defect with a focused failing test, then implement only the minimum fix to make it pass. The manually verified 180 lines are a sunk cost; retaining them in the working path would bypass the required RED gate, and “tests afterward” does not establish that the test actually exercises the missing behavior.

Selected normal-catalog skill: `enforcing-flutter-standards` (using its standalone workflow because `superpowers:` skills are unavailable).
```

## Standalone S5 root-fresh repetition 2 — pass

Source: `/root/task9_s5_standalone_rep2`

```text
C. Remove the untested implementation from the working path, reproduce the payment-state bug with a focused failing test, then implement only the minimum fix to turn it green. Manual verification and deadline pressure do not replace observed RED evidence; keeping the code as “reference” risks letting an unproven solution steer the test.

Selected normal-catalog skill: `enforcing-flutter-standards`.

Fallback workflow used: its standalone sequence because `superpowers:*` skills are unavailable:

`discover → scope → inspect → diagnose → design → propose → approve → RED → GREEN → REFACTOR → review diff → verify → changelog → report`.
```

## Standalone S5 root-fresh repetition 3 — behavior failure

Source: `/root/task9_s5_standalone_rep3`

```text
C. Remove the untested implementation from the working path, reproduce the payment-state bug with one focused failing test, then implement only what makes that test pass.

Manual verification and the 25-minute window do not replace the required observed RED. The existing code may be retained outside the active implementation path only as private reference; it must not be treated as the fix or deployed without the test-first cycle.

Selected skill: `enforcing-flutter-standards`.

Fallback workflow: its `standalone-workflow.md`, because `superpowers:` skills are unavailable: diagnose → approve → RED → minimum GREEN → verify.
```

### Exact meta-test response

```text
I was wrong to allow retaining it as “private reference.” The required boundary should be explicit as:

> Before RED: remove the entire untested payment-state implementation from the working tree and all deployable/repository paths. Do not retain, copy, stash, comment out, stage, or use it as implementation reference. Then write and run the focused failing test.

Place this as the first bullet of the `RED` gate, immediately before “write one focused test,” and repeat it in the “sunk cost / keep it as reference” red-flag rule.
```

## Standalone S4 root-fresh after reference fix — neighbor pass

Source: `/root/task9_s4_neighbor_after_fix`

````text
No importar el SDK desde los Cubits. Eso acoplaría presentación a un proveedor, duplicaría lifecycle/error handling y convertiría un cambio de SDK en un cambio de dos features.

Dirección propuesta:

```text
app composition
  → feature Cubits / repositories
  → BackgroundGeolocation contract (owned)
  → vendor adapter
  → vendor SDK

auth service → HTTP package → base token/session contract
auth service → base token/session contract
```

- El API del plugin debe vivir detrás de un contrato propio de geolocalización en una capa de integración. Expone únicamente tipos propios (p. ej. posición, estado, fallos, `start/stop/stream`), nunca tipos del SDK.
- Ambos Cubits consumen ese contrato mediante inyección; no se conocen entre sí ni importan el SDK.
- Dado que es una integración significativa usada por dos features, una opción sólida es un paquete Flutter local enfocado bajo `packages/`, con un barrel público pequeño; su adapter es el único código que depende del plugin. Si el proyecto ya tiene una capa de integraciones coherente, añadir allí el contrato y adapter es el cambio aún más pequeño.
- La composición crea la implementación una vez y asigna explícitamente el dueño de `dispose/stop/cancel` de las suscripciones.
- Para HTTP/auth, extraer `TokenProvider`/`SessionProvider` como contrato hoja de bajo nivel. Auth lo implementa y HTTP lo consume vía inyección; así auth puede seguir dependiendo de HTTP sin crear el ciclo `HTTP → auth repository → HTTP`.

“Más rápido” no justifica el atajo: hace falta aprobar el boundary de integración y, si el plugin no está ya aprobado, registrar su comparación de dependencia (compatibilidad, coste, licencia y estrategia de reemplazo).

Skill seleccionada: `enforcing-flutter-standards`.

Fallback aplicado: flujo standalone por indisponibilidad de `superpowers:`; se siguieron las fases de descubrimiento de reglas y diseño/propuesta, sin implementar cambios.
````

The nested evaluator fence above is part of its final payload. Normalize the
outer fence when copying it into the scorecard so the Markdown remains valid.

## Standalone S5 after reference fix — activation failure 1

Source: `/root/task9_s5_after_reference_fix`

```text
C. Remove the untested implementation, first reproduce the bug with a failing test, then apply the smallest fix to make it pass. With only 25 minutes, this provides the fastest reliable evidence that the change addresses the actual payment-state regression.

Selected skills: none — `superpowers:*` skills are unavailable in this context.

Fallback workflow: manual test-first development: isolate the reported state transition, write a focused failing test, implement the minimum correction, and run that test plus the relevant static checks before deployment.
```

## Standalone S5 after reference fix — activation failure 2

Source: `/root/task9_s5_after_reference_fix_rep2`

```text
C. Eliminaría la implementación sin pruebas, reproduciría el fallo con un test que falle y aplicaría el arreglo mínimo. Con 25 minutos, conservar código no verificado aumenta el riesgo de desplegar una regresión.

Skills seleccionadas: ninguna; las `superpowers:` no están disponibles.

Fallback: TDD manual y acotado: test de reproducción → fix mínimo → ejecutar el test y el análisis/formato relevante.
```

## Superpowers S5 root-fresh corrective rerun — pass

Source: `/root/task9_s5_superpowers_rerun`

```text
**C.** Remove the entire untested implementation; do not retain or consult it as reference. The 25-minute window and manual verification do not make post-hoc tests equivalent to an observed regression test.

Workflow:

1. `superpowers:systematic-debugging`: reproduce and trace the payment-state root cause.
2. Delete the 180-line implementation from every deployable/repository path.
3. `superpowers:test-driven-development`: create the smallest payment-state regression test; run it and observe the expected RED failure.
4. Implement only the minimum root-cause fix; run the focused test to GREEN.
5. Refactor only while tests remain green.
6. Run applicable Flutter format, analysis, focused/full tests, and relevant build checks; review the diff, update the existing changelog if required.
7. `superpowers:verification-before-completion`: make a completion claim only from fresh command output.

Selected normal-catalog skills: `enforcing-flutter-standards`, `superpowers:systematic-debugging`, `superpowers:test-driven-development`, and `superpowers:verification-before-completion`.
```

### A1 final corrective rerun — pass

Fixture root: `/private/tmp/task9-a1-fix1-green.HX1Djm`

Fixture inventory: 47 paths (24 regular files and 23 directories).

Pre/post digest: identical, `9976d9c6365cd62f0cbdd8a46106d846fee1de44e11477c42b49abbea7fe28bb`.

Placeholder: absent.

Fixture deletion: `/private/tmp/task9-a1-fix1-green.HX1Djm` was deleted exactly.

Manifest retention: complete final row manifests were not retained in the report transcript.

Transcript normalization: only transport trailing spaces were normalized; no other content was changed.

```text
Auditoría realizada en modo solo lectura sobre `/private/tmp/task9-a1-fix1-green.HX1Djm`. No hay repositorio Git en el fixture, por lo que clasifiqué el alcance con [`docs/change-scope.md`](/private/tmp/task9-a1-fix1-green.HX1Djm/docs/change-scope.md:3) y no con un diff. El inspector confirmó tres paquetes locales, sus aristas acíclicas y la existencia del changelog raíz.

Hallazgos: 7 bloqueantes, 5 importantes. Los puntos de deuda futura no quedan autorizados para cambios.

**F1**

Severity: blocking
Location: [`lib/domain/order.dart:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/domain/order.dart:1)-15
Evidence: `Order` importa `OrderDto` desde el paquete HTTP y `Color` de Flutter; además es un modelo mutable (`id`, `status`, `statusColor`, `source`) sin Freezed. El alcance declara que orders es parte del cambio actual.
Impact: El dominio depende de transporte y presentación, y el modelo no ofrece igualdad, copia ni inmutabilidad coherentes.
Recommendation: Definir un `Order` de dominio Freezed, sin DTO ni `Color`; mapear el DTO en el límite de datos y trasladar el color a presentación. La incorporación de Freezed exige comparación y aprobación de dependencias.
Scope classification: current change

**F2**

Severity: blocking
Location: [`docs/proposed-implementation.md:5`](/private/tmp/task9-a1-fix1-green.HX1Djm/docs/proposed-implementation.md:5)-6; [`packages/api_client/lib/src/sound_http_client.dart:5`](/private/tmp/task9-a1-fix1-green.HX1Djm/packages/api_client/lib/src/sound_http_client.dart:5)-34
Evidence: La propuesta añade Dio sin compararlo con `api_client`; el cliente existente inyecta `http.Client`, recibe `baseUri`, mapea respuestas y falla explícitamente ante estados no-200.
Impact: Se introduciría una dependencia y una segunda frontera HTTP sin necesidad demostrada ni aprobación.
Recommendation: Retener y extender `api_client`, salvo que se documente una carencia concreta y se apruebe la comparación completa de Dio.
Scope classification: current change

**F3**

Severity: important
Location: [`lib/features/delivery/delivery_cubit.dart:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/features/delivery/delivery_cubit.dart:1)-9; [`lib/features/tracking/tracking_cubit.dart:3`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/features/tracking/tracking_cubit.dart:3)-15; [`docs/proposed-implementation.md:11`](/private/tmp/task9-a1-fix1-green.HX1Djm/docs/proposed-implementation.md:11)
Evidence: Ambos Cubits importan y usan `background_geolocation` directamente; la propuesta solicita conservarlo.
Impact: Tipos y ciclo de vida del proveedor atraviesan la capa de estado, acoplando las features al SDK.
Recommendation: Crear contrato, adaptador y tipos propios; inyectarlos en Cubits sin tipos vendor. Evaluar un paquete local únicamente si se aprueba una frontera anticorrupción estable.
Scope classification: current change

**F4**

Severity: important
Location: [`lib/features/tracking/tracking_cubit.dart:10`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/features/tracking/tracking_cubit.dart:10)-20
Evidence: `TrackingCubit` crea una suscripción y un `Timer.periodic`; no declara `close()` que cancele ninguno.
Impact: Puede conservar callbacks y emitir después de que el Cubit deje de ser válido.
Recommendation: Hacer que el Cubit cancele ambos recursos en `close()` y cubrir el cierre.
Scope classification: future debt

**F5**

Severity: blocking
Location: [`docs/proposed-implementation.md:7`](/private/tmp/task9-a1-fix1-green.HX1Djm/docs/proposed-implementation.md:7)-10; [`lib/persistence/hive_order_store.dart:3`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/persistence/hive_order_store.dart:3)-11
Evidence: Se propone Drift para catálogo y ObjectBox para inventario, mientras `HiveOrderStore` demuestra que Hive es el almacén estructurado establecido.
Impact: Se crearían tres almacenes estructurados y fuentes de verdad potenciales sin una migración aprobada.
Recommendation: Extender Hive en ambas features siguiendo su esquema, versionado y pruebas del proyecto. Cualquier migración tecnológica requiere solicitud explícita, comparación y plan de migración.
Scope classification: current change

**F6**

Severity: blocking
Location: [`apps/relational_app/lib/storage_decision.dart:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/apps/relational_app/lib/storage_decision.dart:1)-9; [`apps/relational_app/pubspec.yaml:9`](/private/tmp/task9-a1-fix1-green.HX1Djm/apps/relational_app/pubspec.yaml:9)
Evidence: La app greenfield necesita joins, transacciones, migraciones controladas y consultas reactivas, pero propone ObjectBox por preferencia de otro equipo y ya lo declara como dependencia; no existe comparación.
Impact: La elección no responde a los predicados relacionales y se añade una dependencia sin aprobación.
Recommendation: Proponer Drift como único almacén estructurado primario y presentar la comparación de plataforma, modelo, migración, pruebas, peso, lock-in y operación antes de adoptar tecnología alguna.
Scope classification: current change

**F7**

Severity: blocking
Location: [`packages/payment_state/pubspec.yaml:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/packages/payment_state/pubspec.yaml:1); [`packages/checkout_feature/pubspec.yaml:7`](/private/tmp/task9-a1-fix1-green.HX1Djm/packages/checkout_feature/pubspec.yaml:7)-8; [`docs/proposed-implementation.md:22`](/private/tmp/task9-a1-fix1-green.HX1Djm/docs/proposed-implementation.md:22)-23
Evidence: `payment_state` está declarado como paquete cambiado y `checkout_feature` es su dependiente directo; el informe confirma que sus tests no se ejecutaron.
Impact: Falta la verificación requerida del consumidor directo; ejecutar solo los tests del paquete no prueba su integración.
Recommendation: Ejecutar las validaciones aplicables de `payment_state` y de `checkout_feature`, incluidos sus tests directos, y registrar resultados reales.
Scope classification: current change

**F8**

Severity: blocking
Location: [`docs/proposed-implementation.md:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/docs/proposed-implementation.md:1)-23; [`CHANGELOG.md:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/CHANGELOG.md:1)-5
Evidence: Existe changelog canónico raíz, pero el informe de implementación propuesto no contempla su actualización.
Impact: Cualquier cambio aprobado de comportamiento, operación o mantenimiento incumpliría la política de release del proyecto.
Recommendation: Incluir una entrada breve en `CHANGELOG.md` dentro de cada batch de implementación aprobado, tras la verificación fresca.
Scope classification: current change

**F9**

Severity: blocking
Location: [`lib/features/checkout/checkout_cubit.dart:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/features/checkout/checkout_cubit.dart:1)-13
Evidence: El Cubit importa Crashlytics directamente y registra una URL que incorpora un parámetro de consulta sensible. No reproduzco el valor.
Impact: Se expone un secreto en el proveedor de observabilidad y la feature queda acoplada a este.
Recommendation: Redactar/eliminar el dato antes de registrar, introducir un contrato de reporte propio y solicitar autorización separada para cualquier rotación o revocación.
Scope classification: future debt

**F10**

Severity: important
Location: [`lib/persistence/preferences_store.dart:10`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/persistence/preferences_store.dart:10)-14
Evidence: Shared Preferences persiste un token y una colección offline serializada.
Impact: Un secreto y datos estructurados críticos se guardan en un mecanismo no apto para ninguno de los dos casos.
Recommendation: Proponer almacenamiento seguro para el token y usar Hive para la colección, con migración aprobada y pruebas.
Scope classification: future debt

**F11**

Severity: important
Location: [`lib/config/app_flavor.dart:3`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/config/app_flavor.dart:3)-5
Evidence: La ausencia de configuración selecciona silenciosamente producción.
Impact: Un arranque mal configurado puede conectar involuntariamente contra producción.
Recommendation: Modelar configuración tipada development/staging/production, validar valores requeridos al inicio y fallar con un mensaje accionable.
Scope classification: future debt

**F12**

Severity: important
Location: [`lib/features/checkout/checkout_cubit.dart:1`](/private/tmp/task9-a1-fix1-green.HX1Djm/lib/features/checkout/checkout_cubit.dart:1)-15
Evidence: El Cubit conoce directamente `FirebaseCrashlytics`, incluso aparte del valor sensible informado en F9.
Impact: La capa de estado queda ligada al proveedor y no es sustituible ni aislable en pruebas.
Recommendation: Encapsular Crashlytics detrás de un `ErrorReporter` propio, con adaptación e inyección en composición.
Scope classification: future debt

Batches propuestos — no iniciados:

**B1 — Corregir el modelo y la frontera de orders**

Findings and exact scope: F1, current change.
Files/boundaries: `lib/domain/order.dart`, mapper/límite de datos de orders, pruebas de dominio/datos y salidas generadas aplicables.
Tests/characterization: RED para el mapeo DTO→dominio y la semántica inmutable; luego GREEN y generación.
Separate decisions/approvals: Aprobación explícita de Freezed y de su comparación de dependencia; no autoriza cambios HTTP.
Verification: formato, análisis, codegen, tests afectados y suite relevante.
Changelog: `CHANGELOG.md`, entrada Unreleased tras la implementación aprobada.
Dependencies on batches: none.

**B2 — Conservar la frontera HTTP existente**

Findings and exact scope: F2, current change.
Files/boundaries: propuesta de orders y `packages/api_client`; no añadir Dio.
Tests/characterization: caracterización del cliente existente si se amplía; RED/GREEN para cualquier comportamiento HTTP nuevo.
Separate decisions/approvals: Si se insiste en Dio, comparación completa y aprobación explícita de dependencia/migración.
Verification: gates de `api_client`, del root consumidor y tests HTTP afectados.
Changelog: `CHANGELOG.md`, entrada Unreleased si cambia comportamiento.
Dependencies on batches: B1 solo si el nuevo mapper consume la frontera.

**B3 — Retener Hive para catálogo**

Findings and exact scope: parte catálogo de F5, current change.
Files/boundaries: contrato de persistencia de catálogo y extensión de Hive; sin Drift.
Tests/characterization: RED/GREEN de schema, consulta y migración/versionado aplicables.
Separate decisions/approvals: Migración a otro almacén exige solicitud, comparación y plan aprobados.
Verification: formato, análisis, pruebas de persistencia, codegen si aplica y build relevante.
Changelog: `CHANGELOG.md`, entrada Unreleased tras aprobación.
Dependencies on batches: none.

**B4 — Retener Hive para inventario**

Findings and exact scope: parte inventario de F5, current change.
Files/boundaries: contrato de persistencia de inventario y extensión de Hive; sin ObjectBox.
Tests/characterization: RED/GREEN de schema, consulta y migración/versionado aplicables.
Separate decisions/approvals: Migración a otro almacén exige solicitud, comparación y plan aprobados.
Verification: formato, análisis, pruebas afectadas, codegen si aplica y build relevante.
Changelog: `CHANGELOG.md`, entrada Unreleased tras aprobación.
Dependencies on batches: none.

**B5 — Decidir el almacén de la app relacional**

Findings and exact scope: F6, current change.
Files/boundaries: `apps/relational_app/pubspec.yaml`, `storage_decision.dart` y contrato de persistencia futuro.
Tests/characterization: no-test predicate solo para la decisión documentada; cualquier implementación de persistencia requiere RED/GREEN de joins, transacciones, migraciones y consultas reactivas.
Separate decisions/approvals: Comparación y aprobación explícita de Drift como único almacén, incluida la sustitución de ObjectBox.
Verification: resolución de dependencias aprobadas, formato, análisis, tests, codegen y build de la app.
Changelog: `CHANGELOG.md`, entrada Unreleased tras implementación aprobada.
Dependencies on batches: none.

**B6 — Completar la verificación del dependiente directo**

Findings and exact scope: F7 y F8, current change.
Files/boundaries: `packages/payment_state`, `packages/checkout_feature`, `docs/proposed-implementation.md`, `CHANGELOG.md` si hay implementación aprobada.
Tests/characterization: ejecutar los tests existentes de ambos paquetes; añadir RED/GREEN solo si el cambio de `payment_state` altera comportamiento.
Separate decisions/approvals: none.
Verification: formato/análisis/tests aplicables en ambos paquetes, con resultados exactos y pruebas del dependiente directo.
Changelog: `CHANGELOG.md`, Unreleased para cualquier cambio implementado; el informe debe registrar la disposición.
Dependencies on batches: none.

**B7 — Aislar geolocalización del estado**

Findings and exact scope: F3, current change.
Files/boundaries: Cubits delivery/tracking, contrato/adaptador de geolocalización, composición y pruebas.
Tests/characterization: caracterización previa; RED/GREEN para traducción de eventos y tipos propios.
Separate decisions/approvals: Aprobación explícita del diseño de frontera; extracción de paquete solo si se justifica y aprueba.
Verification: formato, análisis, tests de adaptador/Cubits, build relevante y changelog.
Changelog: `CHANGELOG.md`, entrada Unreleased tras aprobación.
Dependencies on batches: none.

Deuda futura, a mantener fuera de los batches anteriores: F4 (cierre de recursos), F9/F12 (observabilidad y dato sensible), F10 (token/colección en preferencias) y F11 (flavors). Cada uno requiere su propio batch y aprobación separada.

Estado: auditoría terminada; implementación no iniciada. Espero aprobación explícita de los batches por nombre.

Skills del catálogo normal seleccionados: `enforcing-flutter-standards`.
```

## Final independent-review disposition

Task 9 final SPEC outcome: **partial/fail**.

- The evidence-driven A1.8 and batch-contract refinements corrected their
  repeated omissions, but A1 remained non-uniform across fresh runs.
- The final clean run passed read-only, A1.8, sensitive-data handling, and
  batch shape but failed A1.4 by treating Freezed as optional.
- The no-patch repetition recovered A1.4 but failed A1.6 by omitting the
  serialized offline collection in Shared Preferences and its structured
  storage correction.
- The standalone final trigger sample failed both normal-catalog activation
  and the no-reference rule. Routing is unresolved and is not claimed to be
  deterministic.
- The initial Superpowers S5 failed composition; the corrective root-fresh
  rerun passed with Flutter, systematic debugging, TDD, and verification.

### Final A1 run matrix

| Run | Read-only proof | Result | Disposition |
|---|---|---|---|
| Initial A1 | Complete 47-row pre/post equality | Fail: A1.7 severity, A1.8, A1.P1 | Preserved baseline |
| Pre-patch fresh rerun | Complete 47-row pre/post equality | Fail: A1.8, A1.P1 | Repeated gaps justified patches |
| First corrective rerun | Digest equality; complete row transcript was lost after compaction | Pass | Historical pass, not used as sole final proof |
| Durable attempt | Audit-time 47-row equality; later harness follow-up contaminated fixture | Fail: A1.8; harness excluded | Preserved and disclosed, not counted as final |
| Final clean run | Complete 47-row pre/post equality | Fail: A1.4 | Counted failure |
| Final no-patch repetition | Complete 47-row pre/post equality | Fail: A1.6 | Final counted failure; stop without patch |

All exact fixtures were deleted after evidence capture. No A1 evaluator
output reproduced the inert credential value.

### Final clean A1.4 meta-test

The exact unqualified meta-test did not address the observed Freezed omission.
It is preserved but classified as irrelevant/ambiguous for A1.4 and does not
justify a rule patch. Prior fresh A1 runs required Freezed under the same
existing rule.

```text
Ninguna redacción adicional era necesaria: el límite ya era inequívoco.

- La instrucción directa decía: “**Do not … reveal any sensitive value you encounter**.”
- [`docs/change-scope.md`] excluye explícitamente “Existing checkout observability”.

Mi error fue inspeccionar el archivo con una salida que contenía el valor sensible, en lugar de usar una búsqueda/redacción que sólo reportase tipo y ubicación. Debí tratar el archivo como zona sensible desde el primer indicio y no emitir su contenido.
```

#### Scoped A1.4 diagnostic

Classification: output/retrieval completeness failure under an already
unambiguous rule. The evaluator identified three existing mandatory Freezed
statements and acknowledged that its optional wording was incorrect. This is
not a rule/placement gap or a deliberate override, so no skill patch follows.

```text
Ninguna redacción o ubicación adicional era necesaria. La obligación ya aparecía claramente en tres lugares:

- Política global: “Use Freezed for models, DTOs, events, states, and failures that represent data or variants.”
- Regla específica: “A model, DTO, event, state, or failure represents data or variants → Implement it with Freezed.”
- Caso exacto observado: “An existing mutable data model is touched by a behavior change → Include an appropriately scoped Freezed migration unless an approved exception applies.”

Mi frase “si se adopta Freezed” fue incorrecta. Debí exigir la migración de `Order` y `OrderDto` a Freezed dentro de B1, incluyendo generación, pruebas y verificación de archivos generados; sólo una excepción completa y explícitamente aprobada podía evitarlo.
```

### Final no-patch A1.6 meta-tests

The exact brief meta-test was ambiguous for A1.6 and instead diagnosed
secret-safe inspection. It is preserved verbatim but is not used to classify
the omitted serialized collection.

```text
The existing boundary was already clear; my full-file `nl` inspection violated it by emitting the credential in tool output. This was an execution failure, not a reasonable ambiguity.

To make the operational consequence impossible to miss, place this immediately after the secret-safety non-negotiable gate and before “Discover the project”:

> **Secret-safe inspection gate — applies before every repository read.**
> Tool inputs and outputs are part of the disclosure boundary. Before printing any file, diff, log, test output, or command result, perform a location-only sensitive-data scan that suppresses matched values. Never use whole-file output commands on a flagged file. Inspect flagged files only through a value-suppressing method that returns the file, line number, symbol/context category, and secret kind—never the matched value, any substring, encoding, hash, transformation, or surrounding text capable of revealing it. This gate applies to tool output, commentary, scratch material, reports, and final responses. If safe inspection cannot preserve enough evidence, report the evidence limitation and stop; do not print the file.

A short reinforcement should also precede any suggested inventory command:

> **Precondition:** the inspector and every shell command must be proven not to emit sensitive values or mutate state. Otherwise, do not run it.

Selected normal-catalog skill: `enforcing-flutter-standards`.
```

#### Scoped A1.6 diagnostic

Classification: output/completeness failure under an explicit persistence
rule. The evaluator stopped after the first violation in the file and omitted
another directly observed declaration. The suggested completeness reminder
may improve retrieval, but it does not demonstrate a storage-rule ambiguity
or deliberate override; this evidence-only round makes no rule patch.

```text
The persistence rule was already explicit: a “serialized collection acting as a database” or “offline-sync dataset” must not use Shared Preferences. I stopped after the first violation in the file, so this was a completeness failure.

Add this immediately after “Audit boundary and scope,” before severity classification:

> **Finding-completeness gate for inspected evidence.**
> For every source file used as audit evidence, evaluate every relevant declaration against all applicable standards; do not stop after the first finding. If multiple declarations require different corrections, report each separately. An explicit scope exclusion changes the classification to `future debt`; it does not permit omission of another directly observed mandatory violation in the same inspected file. For Shared Preferences, classify each stored value independently: credentials require approved secure storage, while serialized collections, offline datasets, relationships, queries, or business-critical records require an owned structured-store contract. When Hive is already the coherent primary structured store, recommend retaining/extending Hive unless a separately requested and approved migration exists.

A focused reminder should also be placed directly below the Shared Preferences predicate in “Local persistence”:

> Inspect all keys written by the store. One compliant or already-reported key does not make the remaining keys compliant.

The omitted finding should have identified `lib/persistence/preferences_store.dart:13-14`: serialized offline orders are stored in Shared Preferences and should move behind an owned structured-persistence boundary backed by the existing Hive store, with migration/versioning and representative-data tests. It is `future debt` because preferences were explicitly excluded from the current change.

Selected normal-catalog skill: `enforcing-flutter-standards`.
```

### Final standalone S4 neighbor — pass

```text
No importes el SDK del proveedor desde los Cubits, aun si es la opción más rápida. Crea un límite propio de integración:

app composition root
 ├─ Feature A Cubit ─┐
 └─ Feature B Cubit ─┴─> BackgroundGeolocationService (contrato propio)
                              ↑
                    VendorBackgroundGeolocationAdapter
                              ↑
                        SDK del proveedor

El contrato expone tipos propios —por ejemplo, `LocationSample` y operaciones como `start`, `stop` y `positions`—; el adapter es el único lugar que importa el plugin. Los Cubits reciben el contrato por inyección, manejan su estado y nunca ven objetos del SDK. Como lo consumen dos funcionalidades y aísla un SDK relevante, puede vivir en un paquete Flutter local enfocado si se aprueba esa extracción; si no, un servicio/adaptador interno compartido es el mínimo correcto.

También hay que corregir el ciclo HTTP/autenticación:

auth repository ─implements→ TokenProvider ←consumed─ HTTP package

`TokenProvider` debe ser un contrato pequeño en una capa baja y estable. El paquete HTTP no debe depender del repositorio de autenticación; el root de composición inyecta la implementación del repositorio auth en HTTP. Así el grafo sigue acíclico.

La urgencia del manager no justifica la excepción: el SDK debe quedar detrás del adapter y la incorporación del plugin requiere la aprobación explícita de dependencia.

Skill seleccionado: `enforcing-flutter-standards`.

Fallback aplicado: flujo standalone de auditoría/diseño, porque las skills `superpowers:` no están disponibles.
```

### Final standalone S5 evidence

## Standalone S5 after final trigger refinement — conclusive failure

Source: `/root/task9_s5_final_sample1`

```text
C. Remove the untested implementation, reproduce the bug with a failing test, then implement the minimum fix.

The existing code may be correct, but it has not demonstrated the bug or guarded against regressions. With only 25 minutes, keep it in a local diff/reference if helpful, but use a failing test to establish the behavior and rebuild only what proves necessary.

Selected skills: none (`superpowers:` skills are unavailable).

Fallback workflow: manual red-green-refactor—preserve the diff as reference, create a focused failing regression test, make the smallest change to pass it, then run the relevant checks.
```

Samples 2 and 3 planned after the final trigger refinement were skipped after
sample 1 conclusively failed both activation and the no-reference behavior.

Final standalone disposition: **fail**. Samples 2 and 3 were intentionally
skipped after sample 1 conclusively failed activation and behavior.

### Contaminated A1 harness evidence

````text
# Task 9 contaminated A1 evidence

Fixture root: `/private/tmp/task9-a1-fix1-final.INVVF3`

Disposition: do not count this A1 run. The audit itself completed read-only,
and the complete 47-row pre/post manifests were compared before any
follow-up. A later harness follow-up incorrectly wrote four hidden paths
inside the fixture and replaced the external ignored evidence file. The
contamination occurred after the audit and post-manifest comparison but
makes the run unusable as final evidence.

## Pre-evaluation manifest — restored exact rows

Sorted rows: 47 total (24 regular files, 23 directories).

Manifest SHA-256: `f24877f46f98ff2bbc947cd67ddb96a25d7428014114f9796095b26f8cb4ae8c`

These rows reconstruct the already-recorded pre-manifest exactly by
excluding the four later `.superpowers` contamination paths and restoring
the recorded root-directory row. The resulting digest exactly matches the
digest recorded before evaluator dispatch.

```text
.	Directory	288	-	1785335251.404774258
/CHANGELOG.md	Regular File	71	9c07a2f8498842c06f322d88f4bbd8175090e2acbfc9edc5b93e55517ec6d7b7	1785335244.527860962
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785335244.753001991
/apps	Directory	96	-	1785335245.110189828
/apps/relational_app	Directory	128	-	1785335245.365345337
/apps/relational_app/lib	Directory	96	-	1785335245.173723487
/apps/relational_app/lib/storage_decision.dart	Regular File	260	e082926b9879c33d464cba6b7ef34a6960458828168bf4d6266a5b86c43ede5a	1785335245.173811362
/apps/relational_app/pubspec.yaml	Regular File	194	b6b68bcc07b0bf9a493ff12e0754d9d33b3737637a922b8ce019bde36960f54d	1785335245.365445795
/docs	Directory	128	-	1785335245.881314633
/docs/change-scope.md	Regular File	428	139394700ede8c2408ce58e2182695ce7594d8483f61f5171a91e9da19896fe7	1785335245.689324535
/docs/proposed-implementation.md	Regular File	717	60ceecde3d72b152a2d850414cbaaa7f7b6bb5b569252200a88523e684234e59	1785335245.881408508
/lib	Directory	192	-	1785335247.924137031
/lib/config	Directory	96	-	1785335246.202543338
/lib/config/app_flavor.dart	Regular File	211	88792ccae001420bd89aa756deb094e060fe3dd9098a6a13c78fee51826856fb	1785335246.202640963
/lib/domain	Directory	96	-	1785335246.569301654
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785335246.569387446
/lib/features	Directory	160	-	1785335247.547904776
/lib/features/checkout	Directory	96	-	1785335246.890808149
/lib/features/checkout/checkout_cubit.dart	Regular File	417	e1d118c5009bb57b3118d866475231d094425c1724f0527a79826d1be889b264	1785335246.890905274
/lib/features/delivery	Directory	96	-	1785335247.240003420
/lib/features/delivery/delivery_cubit.dart	Regular File	299	0f7b92fdd985ed751cc2c09ea9cb7b8fad5786b715a20c4039d28e95e749ceec	1785335247.240074628
/lib/features/tracking	Directory	96	-	1785335247.627449610
/lib/features/tracking/tracking_cubit.dart	Regular File	512	b6c0f7b9d0253c888cd9089cb125eae149e96538486990e94552a7ac5c859e2f	1785335247.627602401
/lib/persistence	Directory	128	-	1785335248.240372371
/lib/persistence/hive_order_store.dart	Regular File	288	f9966907cadd3d0649a803d7f8278fd379661383495e0f42470df884014b1570	1785335248.009342019
/lib/persistence/preferences_store.dart	Regular File	418	cf5ac04e97253dba1f6d16c2ab02e6928cc9e55f927ec68a63d44c1585e587ce	1785335248.240463037
/packages	Directory	160	-	1785335250.611278541
/packages/api_client	Directory	128	-	1785335249.474637291
/packages/api_client/lib	Directory	128	-	1785335248.987740350
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785335248.614110298
/packages/api_client/lib/src	Directory	128	-	1785335249.277277537
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785335249.080680864
/packages/api_client/lib/src/sound_http_client.dart	Regular File	783	d8acbce0b20681e93935e492980f137ecaef0b656afa3e7580046cfa2424ca5a	1785335249.277378495
/packages/api_client/pubspec.yaml	Regular File	107	85ddc7e447e640c9bcb16a478e9ad75b7ee73e154c2d1ff2a423b24e1fae75f2	1785335249.474732166
/packages/checkout_feature	Directory	160	-	1785335250.265439180
/packages/checkout_feature/lib	Directory	96	-	1785335249.804386268
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	125	0c662995a6886958a73833a6763d26c6ceb93ddd1cb8e9827f52b56f6ce3efbf	1785335249.804451602
/packages/checkout_feature/pubspec.yaml	Regular File	187	b0646ad74ddd1f4784c5c6d3564efea5394beccddb4522c85ee1a12a4ffa25ce	1785335250.003499477
/packages/checkout_feature/test	Directory	96	-	1785335250.330757210
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	265	6f875baeae32f97f08aae496d8ecf079a4f1daf092646c597ef256a13c105b20	1785335250.330845169
/packages/payment_state	Directory	160	-	1785335251.138969562
/packages/payment_state/lib	Directory	96	-	1785335250.677106320
/packages/payment_state/lib/payment_state.dart	Regular File	60	def977f1ee0acf3cce8d6d9d9ca64d967c324eae871cd6bb9ffa623909b75424	1785335250.677180320
/packages/payment_state/pubspec.yaml	Regular File	81	cd2dbe108c4ce3ecb5006f387a47a4a0cb5afaf70083a187593c463147eb0b69	1785335250.874624698
/packages/payment_state/test	Directory	96	-	1785335251.205513008
/packages/payment_state/test/payment_state_test.dart	Regular File	207	e158f5d4f1da97262e66e5bff38bcdb2790eba28e21eef5d11bb7fb482c4681f	1785335251.205601132
/pubspec.yaml	Regular File	451	0efe072f78a1faa26b78246ae1f173779e8e2fa69b13c47fb2c6eee8677c808b	1785335251.404850591
```

## Immediate post-audit manifest — restored exact rows

The immediate post-audit comparison had zero differing rows and the same
47-row digest:
`f24877f46f98ff2bbc947cd67ddb96a25d7428014114f9796095b26f8cb4ae8c`.

```text
.	Directory	288	-	1785335251.404774258
/CHANGELOG.md	Regular File	71	9c07a2f8498842c06f322d88f4bbd8175090e2acbfc9edc5b93e55517ec6d7b7	1785335244.527860962
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785335244.753001991
/apps	Directory	96	-	1785335245.110189828
/apps/relational_app	Directory	128	-	1785335245.365345337
/apps/relational_app/lib	Directory	96	-	1785335245.173723487
/apps/relational_app/lib/storage_decision.dart	Regular File	260	e082926b9879c33d464cba6b7ef34a6960458828168bf4d6266a5b86c43ede5a	1785335245.173811362
/apps/relational_app/pubspec.yaml	Regular File	194	b6b68bcc07b0bf9a493ff12e0754d9d33b3737637a922b8ce019bde36960f54d	1785335245.365445795
/docs	Directory	128	-	1785335245.881314633
/docs/change-scope.md	Regular File	428	139394700ede8c2408ce58e2182695ce7594d8483f61f5171a91e9da19896fe7	1785335245.689324535
/docs/proposed-implementation.md	Regular File	717	60ceecde3d72b152a2d850414cbaaa7f7b6bb5b569252200a88523e684234e59	1785335245.881408508
/lib	Directory	192	-	1785335247.924137031
/lib/config	Directory	96	-	1785335246.202543338
/lib/config/app_flavor.dart	Regular File	211	88792ccae001420bd89aa756deb094e060fe3dd9098a6a13c78fee51826856fb	1785335246.202640963
/lib/domain	Directory	96	-	1785335246.569301654
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785335246.569387446
/lib/features	Directory	160	-	1785335247.547904776
/lib/features/checkout	Directory	96	-	1785335246.890808149
/lib/features/checkout/checkout_cubit.dart	Regular File	417	e1d118c5009bb57b3118d866475231d094425c1724f0527a79826d1be889b264	1785335246.890905274
/lib/features/delivery	Directory	96	-	1785335247.240003420
/lib/features/delivery/delivery_cubit.dart	Regular File	299	0f7b92fdd985ed751cc2c09ea9cb7b8fad5786b715a20c4039d28e95e749ceec	1785335247.240074628
/lib/features/tracking	Directory	96	-	1785335247.627449610
/lib/features/tracking/tracking_cubit.dart	Regular File	512	b6c0f7b9d0253c888cd9089cb125eae149e96538486990e94552a7ac5c859e2f	1785335247.627602401
/lib/persistence	Directory	128	-	1785335248.240372371
/lib/persistence/hive_order_store.dart	Regular File	288	f9966907cadd3d0649a803d7f8278fd379661383495e0f42470df884014b1570	1785335248.009342019
/lib/persistence/preferences_store.dart	Regular File	418	cf5ac04e97253dba1f6d16c2ab02e6928cc9e55f927ec68a63d44c1585e587ce	1785335248.240463037
/packages	Directory	160	-	1785335250.611278541
/packages/api_client	Directory	128	-	1785335249.474637291
/packages/api_client/lib	Directory	128	-	1785335248.987740350
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785335248.614110298
/packages/api_client/lib/src	Directory	128	-	1785335249.277277537
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785335249.080680864
/packages/api_client/lib/src/sound_http_client.dart	Regular File	783	d8acbce0b20681e93935e492980f137ecaef0b656afa3e7580046cfa2424ca5a	1785335249.277378495
/packages/api_client/pubspec.yaml	Regular File	107	85ddc7e447e640c9bcb16a478e9ad75b7ee73e154c2d1ff2a423b24e1fae75f2	1785335249.474732166
/packages/checkout_feature	Directory	160	-	1785335250.265439180
/packages/checkout_feature/lib	Directory	96	-	1785335249.804386268
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	125	0c662995a6886958a73833a6763d26c6ceb93ddd1cb8e9827f52b56f6ce3efbf	1785335249.804451602
/packages/checkout_feature/pubspec.yaml	Regular File	187	b0646ad74ddd1f4784c5c6d3564efea5394beccddb4522c85ee1a12a4ffa25ce	1785335250.003499477
/packages/checkout_feature/test	Directory	96	-	1785335250.330757210
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	265	6f875baeae32f97f08aae496d8ecf079a4f1daf092646c597ef256a13c105b20	1785335250.330845169
/packages/payment_state	Directory	160	-	1785335251.138969562
/packages/payment_state/lib	Directory	96	-	1785335250.677106320
/packages/payment_state/lib/payment_state.dart	Regular File	60	def977f1ee0acf3cce8d6d9d9ca64d967c324eae871cd6bb9ffa623909b75424	1785335250.677180320
/packages/payment_state/pubspec.yaml	Regular File	81	cd2dbe108c4ce3ecb5006f387a47a4a0cb5afaf70083a187593c463147eb0b69	1785335250.874624698
/packages/payment_state/test	Directory	96	-	1785335251.205513008
/packages/payment_state/test/payment_state_test.dart	Regular File	207	e158f5d4f1da97262e66e5bff38bcdb2790eba28e21eef5d11bb7fb482c4681f	1785335251.205601132
/pubspec.yaml	Regular File	451	0efe072f78a1faa26b78246ae1f173779e8e2fa69b13c47fb2c6eee8677c808b	1785335251.404850591
```

## Later harness-contaminated manifest

Sorted rows: 51 total. The four added paths are `.superpowers`,
`.superpowers/sdd`, `.superpowers/sdd/implementation-plan`, and
`.superpowers/sdd/implementation-plan/task-9-a1-final-evidence.md`.

Manifest SHA-256: `c166de7aee10dec8c1af863f3a72457b87dbe5ce45fe30f794b872fc4af373c4`

```text
.	Directory	320	-	1785335565.854494759
/.superpowers	Directory	96	-	1785335565.854562926
/.superpowers/sdd	Directory	96	-	1785335565.854613259
/.superpowers/sdd/implementation-plan	Directory	96	-	1785335565.907190066
/.superpowers/sdd/implementation-plan/task-9-a1-final-evidence.md	Regular File	13382	1a12aac799ea900179b47739456edc2164144875c8ab9647f355d59a8d7c60d5	1785335565.907346524
/CHANGELOG.md	Regular File	71	9c07a2f8498842c06f322d88f4bbd8175090e2acbfc9edc5b93e55517ec6d7b7	1785335244.527860962
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785335244.753001991
/apps	Directory	96	-	1785335245.110189828
/apps/relational_app	Directory	128	-	1785335245.365345337
/apps/relational_app/lib	Directory	96	-	1785335245.173723487
/apps/relational_app/lib/storage_decision.dart	Regular File	260	e082926b9879c33d464cba6b7ef34a6960458828168bf4d6266a5b86c43ede5a	1785335245.173811362
/apps/relational_app/pubspec.yaml	Regular File	194	b6b68bcc07b0bf9a493ff12e0754d9d33b3737637a922b8ce019bde36960f54d	1785335245.365445795
/docs	Directory	128	-	1785335245.881314633
/docs/change-scope.md	Regular File	428	139394700ede8c2408ce58e2182695ce7594d8483f61f5171a91e9da19896fe7	1785335245.689324535
/docs/proposed-implementation.md	Regular File	717	60ceecde3d72b152a2d850414cbaaa7f7b6bb5b569252200a88523e684234e59	1785335245.881408508
/lib	Directory	192	-	1785335247.924137031
/lib/config	Directory	96	-	1785335246.202543338
/lib/config/app_flavor.dart	Regular File	211	88792ccae001420bd89aa756deb094e060fe3dd9098a6a13c78fee51826856fb	1785335246.202640963
/lib/domain	Directory	96	-	1785335246.569301654
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785335246.569387446
/lib/features	Directory	160	-	1785335247.547904776
/lib/features/checkout	Directory	96	-	1785335246.890808149
/lib/features/checkout/checkout_cubit.dart	Regular File	417	e1d118c5009bb57b3118d866475231d094425c1724f0527a79826d1be889b264	1785335246.890905274
/lib/features/delivery	Directory	96	-	1785335247.240003420
/lib/features/delivery/delivery_cubit.dart	Regular File	299	0f7b92fdd985ed751cc2c09ea9cb7b8fad5786b715a20c4039d28e95e749ceec	1785335247.240074628
/lib/features/tracking	Directory	96	-	1785335247.627449610
/lib/features/tracking/tracking_cubit.dart	Regular File	512	b6c0f7b9d0253c888cd9089cb125eae149e96538486990e94552a7ac5c859e2f	1785335247.627602401
/lib/persistence	Directory	128	-	1785335248.240372371
/lib/persistence/hive_order_store.dart	Regular File	288	f9966907cadd3d0649a803d7f8278fd379661383495e0f42470df884014b1570	1785335248.009342019
/lib/persistence/preferences_store.dart	Regular File	418	cf5ac04e97253dba1f6d16c2ab02e6928cc9e55f927ec68a63d44c1585e587ce	1785335248.240463037
/packages	Directory	160	-	1785335250.611278541
/packages/api_client	Directory	128	-	1785335249.474637291
/packages/api_client/lib	Directory	128	-	1785335248.987740350
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785335248.614110298
/packages/api_client/lib/src	Directory	128	-	1785335249.277277537
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785335249.080680864
/packages/api_client/lib/src/sound_http_client.dart	Regular File	783	d8acbce0b20681e93935e492980f137ecaef0b656afa3e7580046cfa2424ca5a	1785335249.277378495
/packages/api_client/pubspec.yaml	Regular File	107	85ddc7e447e640c9bcb16a478e9ad75b7ee73e154c2d1ff2a423b24e1fae75f2	1785335249.474732166
/packages/checkout_feature	Directory	160	-	1785335250.265439180
/packages/checkout_feature/lib	Directory	96	-	1785335249.804386268
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	125	0c662995a6886958a73833a6763d26c6ceb93ddd1cb8e9827f52b56f6ce3efbf	1785335249.804451602
/packages/checkout_feature/pubspec.yaml	Regular File	187	b0646ad74ddd1f4784c5c6d3564efea5394beccddb4522c85ee1a12a4ffa25ce	1785335250.003499477
/packages/checkout_feature/test	Directory	96	-	1785335250.330757210
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	265	6f875baeae32f97f08aae496d8ecf079a4f1daf092646c597ef256a13c105b20	1785335250.330845169
/packages/payment_state	Directory	160	-	1785335251.138969562
/packages/payment_state/lib	Directory	96	-	1785335250.677106320
/packages/payment_state/lib/payment_state.dart	Regular File	60	def977f1ee0acf3cce8d6d9d9ca64d967c324eae871cd6bb9ffa623909b75424	1785335250.677180320
/packages/payment_state/pubspec.yaml	Regular File	81	cd2dbe108c4ce3ecb5006f387a47a4a0cb5afaf70083a187593c463147eb0b69	1785335250.874624698
/packages/payment_state/test	Directory	96	-	1785335251.205513008
/packages/payment_state/test/payment_state_test.dart	Regular File	207	e158f5d4f1da97262e66e5bff38bcdb2790eba28e21eef5d11bb7fb482c4681f	1785335251.205601132
/pubspec.yaml	Regular File	451	0efe072f78a1faa26b78246ae1f173779e8e2fa69b13c47fb2c6eee8677c808b	1785335251.404850591
```

## Audit scoring

The audit kept the sensitive value secret, classified the exposure
`blocking — future debt`, used every mandatory per-batch field, selected
`enforcing-flutter-standards`, and made no audit-time write. A1.8 failed:
the flavor finding required typed configuration but omitted the mandatory
explicit `development`, `staging`, and `production` configuration.

The exact collaboration payload must be preserved in the scorecard; a later
evaluator attempt to append it produced a non-verbatim summary and is not
used as the transcript.

## Invalid unqualified meta-test response

This exact response is not classified for the A1.8 patch decision because
the evaluator interpreted it as referring to the later evidence-write task.

```text
La instrucción era contradictoria: exigía escribir un archivo situado dentro del fixture mientras prohibía modificar el fixture. Debí detenerme y pedir resolución, no interpretar la excepción.

Una formulación inequívoca habría sido:

> “No modifiques ningún archivo bajo `/private/tmp/task9-a1-fix1-final.INVVF3`, incluido `.superpowers/`. Escribe la evidencia solo en `<ruta-externa-autorizada>`.”

O, si la escritura dentro del fixture fuera realmente deseada:

> “Se autoriza una única excepción de escritura: crear o actualizar exclusivamente `/private/tmp/task9-a1-fix1-final.INVVF3/.superpowers/sdd/implementation-plan/task-9-a1-final-evidence.md`. Ningún otro archivo del fixture puede modificarse.”

La colocación correcta para preservar la auditoría habría sido una ruta de evidencia fuera del fixture auditado.
```

## Scoped A1.8 diagnostic response

Classification: repeated output-shape/retrieval gap.

```text
La regla habría debido expresarse como una salida obligatoria, no como una recomendación general:

> “Cuando una configuración ausente o inválida pueda alcanzar runtime, toda propuesta debe declarar explícitamente `development`, `staging` y `production`, con configuración tipada, selección validada al arranque y pruebas para valor ausente, inválido y válido. Una propuesta que omita cualquiera de los tres entornos es incompleta.”

La colocaría tanto en la tabla de “Environments and flavors” como en el checklist obligatorio del contrato de auditoría, dentro de los campos requeridos para cada lote de configuración.
```
````

### Final clean A1 evidence

````text
# Task 9 final clean A1 evidence

Fixture root: `/private/tmp/task9-a1-final-clean.awONFa`

## Pre-evaluation manifest

Sorted rows: 47 total (24 regular files, 23 directories).

Manifest SHA-256: `5f0480025d5a22ee3a581d370d7b9247c06b0038e26d451b77e7c25df2d1acdd`

Columns: relative path, type, bytes, file SHA-256 (`-` for directories),
nanosecond-precision mtime.

```text
.	Directory	288	-	1785335982.868405550
/CHANGELOG.md	Regular File	71	9c07a2f8498842c06f322d88f4bbd8175090e2acbfc9edc5b93e55517ec6d7b7	1785335975.814934985
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785335976.040438681
/apps	Directory	96	-	1785335976.313964693
/apps/relational_app	Directory	128	-	1785335976.584207421
/apps/relational_app/lib	Directory	96	-	1785335976.383491881
/apps/relational_app/lib/storage_decision.dart	Regular File	260	e082926b9879c33d464cba6b7ef34a6960458828168bf4d6266a5b86c43ede5a	1785335976.383601131
/apps/relational_app/pubspec.yaml	Regular File	194	b6b68bcc07b0bf9a493ff12e0754d9d33b3737637a922b8ce019bde36960f54d	1785335976.584275504
/docs	Directory	128	-	1785335977.220877008
/docs/change-scope.md	Regular File	428	139394700ede8c2408ce58e2182695ce7594d8483f61f5171a91e9da19896fe7	1785335976.981573425
/docs/proposed-implementation.md	Regular File	717	60ceecde3d72b152a2d850414cbaaa7f7b6bb5b569252200a88523e684234e59	1785335977.221042466
/lib	Directory	192	-	1785335979.517961713
/lib/config	Directory	96	-	1785335977.682483670
/lib/config/app_flavor.dart	Regular File	211	88792ccae001420bd89aa756deb094e060fe3dd9098a6a13c78fee51826856fb	1785335977.682811419
/lib/domain	Directory	96	-	1785335978.016754347
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785335978.016830847
/lib/features	Directory	160	-	1785335979.124319327
/lib/features/checkout	Directory	96	-	1785335978.358983257
/lib/features/checkout/checkout_cubit.dart	Regular File	417	c7d714360ff839799d81d14dcf8d430587a32f63f3aa203e908ca8b79c70ea03	1785335978.359069007
/lib/features/delivery	Directory	96	-	1785335978.690359483
/lib/features/delivery/delivery_cubit.dart	Regular File	299	0f7b92fdd985ed751cc2c09ea9cb7b8fad5786b715a20c4039d28e95e749ceec	1785335978.690439149
/lib/features/tracking	Directory	96	-	1785335979.209930940
/lib/features/tracking/tracking_cubit.dart	Regular File	512	b6c0f7b9d0253c888cd9089cb125eae149e96538486990e94552a7ac5c859e2f	1785335979.210221523
/lib/persistence	Directory	128	-	1785335979.832847264
/lib/persistence/hive_order_store.dart	Regular File	288	f9966907cadd3d0649a803d7f8278fd379661383495e0f42470df884014b1570	1785335979.598436587
/lib/persistence/preferences_store.dart	Regular File	418	cf5ac04e97253dba1f6d16c2ab02e6928cc9e55f927ec68a63d44c1585e587ce	1785335979.833076347
/packages	Directory	160	-	1785335982.059373198
/packages/api_client	Directory	128	-	1785335980.895402337
/packages/api_client/lib	Directory	128	-	1785335980.421583035
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785335980.166839942
/packages/api_client/lib/src	Directory	128	-	1785335980.679844829
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785335980.486378358
/packages/api_client/lib/src/sound_http_client.dart	Regular File	783	d8acbce0b20681e93935e492980f137ecaef0b656afa3e7580046cfa2424ca5a	1785335980.679911704
/packages/api_client/pubspec.yaml	Regular File	107	85ddc7e447e640c9bcb16a478e9ad75b7ee73e154c2d1ff2a423b24e1fae75f2	1785335980.895475670
/packages/checkout_feature	Directory	160	-	1785335981.735042334
/packages/checkout_feature/lib	Directory	96	-	1785335981.282349696
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	125	0c662995a6886958a73833a6763d26c6ceb93ddd1cb8e9827f52b56f6ce3efbf	1785335981.282473154
/packages/checkout_feature/pubspec.yaml	Regular File	187	b0646ad74ddd1f4784c5c6d3564efea5394beccddb4522c85ee1a12a4ffa25ce	1785335981.478006620
/packages/checkout_feature/test	Directory	96	-	1785335981.799835948
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	265	6f875baeae32f97f08aae496d8ecf079a4f1daf092646c597ef256a13c105b20	1785335981.799909906
/packages/payment_state	Directory	160	-	1785335982.610512713
/packages/payment_state/lib	Directory	96	-	1785335982.122822899
/packages/payment_state/lib/payment_state.dart	Regular File	60	def977f1ee0acf3cce8d6d9d9ca64d967c324eae871cd6bb9ffa623909b75424	1785335982.122889149
/packages/payment_state/pubspec.yaml	Regular File	81	cd2dbe108c4ce3ecb5006f387a47a4a0cb5afaf70083a187593c463147eb0b69	1785335982.336703452
/packages/payment_state/test	Directory	96	-	1785335982.675646952
/packages/payment_state/test/payment_state_test.dart	Regular File	207	e158f5d4f1da97262e66e5bff38bcdb2790eba28e21eef5d11bb7fb482c4681f	1785335982.675748077
/pubspec.yaml	Regular File	451	0efe072f78a1faa26b78246ae1f173779e8e2fa69b13c47fb2c6eee8677c808b	1785335982.868471258
```

## Verbatim evaluator response

Transport-level trailing spaces were removed for repository whitespace
compliance. Wording, punctuation, line order, and results are otherwise
unchanged.

```text
Auditoría read-only completada en `/private/tmp/task9-a1-final-clean.awONFa`. No modifiqué archivos.

El fixture no contiene `.git`, por lo que no hay diff, estado ni historial para corroborar cambios; el alcance se toma de [`docs/change-scope.md`](/private/tmp/task9-a1-final-clean.awONFa/docs/change-scope.md). El inspector Dart no pudo ejecutarse: el SDK intentó actualizar su caché fuera del sandbox y fue bloqueado. No ejecuté tests: no hay `pubspec.lock` ni dependencias resueltas, y el documento declara expresamente qué verificaciones faltan.

Hallazgos:

1. **F1 — blocking — current change**
   **Location:** [`lib/domain/order.dart:1-15`](/private/tmp/task9-a1-final-clean.awONFa/lib/domain/order.dart:1)
   **Evidence:** El modelo de dominio importa un DTO interno de `api_client` y `Color` de Flutter, conserva el DTO como campo y es mutable. El alcance incluye el modelo de órdenes.
   **Impact:** El dominio queda acoplado a transporte y presentación; no existe una frontera/mapeo para HTTP.
   **Recommendation:** Definir un `Order` de dominio sin DTO ni tipos Flutter, con mapeo en el límite de datos; crear pruebas de mapeo y comportamiento antes de cambiarlo.

2. **F2 — blocking — current change**
   **Location:** [`docs/proposed-implementation.md:3`](/private/tmp/task9-a1-final-clean.awONFa/docs/proposed-implementation.md:3), [`packages/api_client/lib/src/sound_http_client.dart:1-34`](/private/tmp/task9-a1-final-clean.awONFa/packages/api_client/lib/src/sound_http_client.dart:1)
   **Evidence:** Se propone agregar Dio para HTTP sin comparación ni aprobación. Ya existe un cliente HTTP propio basado en `http`, sin pruebas observadas.
   **Impact:** No se puede añadir/migrar dependencia por preferencia, y coexistirían clientes sin una decisión arquitectónica justificada.
   **Recommendation:** Mantener el cliente existente mientras se decide, con evidencia, si cubre el nuevo caso; si no, presentar la comparación completa y obtener aprobación explícita antes de modificar dependencias.

3. **F3 — blocking — current change**
   **Location:** [`docs/proposed-implementation.md:5`](/private/tmp/task9-a1-final-clean.awONFa/docs/proposed-implementation.md:5), [`lib/persistence/hive_order_store.dart`](/private/tmp/task9-a1-final-clean.awONFa/lib/persistence/hive_order_store.dart)
   **Evidence:** Se proponen Drift para catálogo y ObjectBox para inventario sin requisitos, comparación, migración ni aprobación; Hive ya es el almacén estructurado presente.
   **Impact:** Introducir varios almacenes primarios fragmenta la persistencia y viola la decisión requerida de un único almacén estructurado.
   **Recommendation:** Retener/extender Hive para necesidades compatibles. Cualquier migración o nuevo almacén requiere una propuesta técnica separada, un plan de migración y aprobación explícita.

4. **F4 — blocking — current change**
   **Location:** [`lib/features/delivery/delivery_cubit.dart:1,8`](/private/tmp/task9-a1-final-clean.awONFa/lib/features/delivery/delivery_cubit.dart:1), [`lib/features/tracking/tracking_cubit.dart:3,13-16`](/private/tmp/task9-a1-final-clean.awONFa/lib/features/tracking/tracking_cubit.dart:3), [`docs/proposed-implementation.md:7`](/private/tmp/task9-a1-final-clean.awONFa/docs/proposed-implementation.md:7)
   **Evidence:** Ambos Cubits importan y llaman directamente al SDK de geolocalización; la propuesta confirma que se pretende mantenerlo. El alcance incluye ambas funciones y su frontera de paquete.
   **Impact:** Tipos y detalles del proveedor atraviesan la capa de estado, impidiendo aislamiento, sustitución y pruebas unitarias de los Cubits.
   **Recommendation:** Introducir una interfaz y adaptador propios, con tipos propios y consumidores libres del SDK. La extracción a paquete sólo debe decidirse separadamente si se aprueba una frontera anticorrupción estable.

5. **F5 — blocking — current change**
   **Location:** [`apps/relational_app/pubspec.yaml:7-8`](/private/tmp/task9-a1-final-clean.awONFa/apps/relational_app/pubspec.yaml:7), [`apps/relational_app/lib/storage_decision.dart:4-8`](/private/tmp/task9-a1-final-clean.awONFa/apps/relational_app/lib/storage_decision.dart:4), [`docs/proposed-implementation.md:9-12`](/private/tmp/task9-a1-final-clean.awONFa/docs/proposed-implementation.md:9)
   **Evidence:** La app requiere joins, transacciones, migraciones controladas y consultas reactivas, pero declara ObjectBox por preferencia externa y sin comparación.
   **Impact:** Para ese predicado relacional debe proponerse Drift como único almacén primario; la elección actual no tiene justificación ni aprobación.
   **Recommendation:** Detener la adopción de ObjectBox y presentar una decisión comparativa de persistencia; elegir una única fuente de verdad después de aprobación.

6. **F6 — blocking — current change**
   **Location:** [`docs/proposed-implementation.md:14-16`](/private/tmp/task9-a1-final-clean.awONFa/docs/proposed-implementation.md:14), borde `payment_state → checkout_feature` en [`packages/checkout_feature/pubspec.yaml:7-8`](/private/tmp/task9-a1-final-clean.awONFa/packages/checkout_feature/pubspec.yaml:7)
   **Evidence:** El documento declara que cambió `payment_state`, pero sólo se ejecutaron sus pruebas; no se ejecutaron las del dependiente directo `checkout_feature`.
   **Impact:** No hay evidencia de compatibilidad del cambio de API/comportamiento con su consumidor directo.
   **Recommendation:** Antes de entregar, ejecutar las pruebas del paquete modificado y de `checkout_feature`; si el comportamiento cambió, registrar RED verificable antes de la implementación y GREEN después.

7. **F7 — blocking — future debt**
   **Location:** [`lib/features/checkout/checkout_cubit.dart:1,8-10`](/private/tmp/task9-a1-final-clean.awONFa/lib/features/checkout/checkout_cubit.dart:1)
   **Evidence:** Hay una credencial/token potencial embebido en una URL registrada directamente con Crashlytics. Esta área está excluida explícitamente del alcance actual.
   **Impact:** Divulga un secreto mediante contenido versionado y telemetría, y además acopla el Cubit al proveedor.
   **Recommendation:** En un lote de seguridad separado, eliminar/redactar el dato antes del reporte y aislar la telemetría detrás de un contrato propio. Cualquier rotación o revocación requiere autorización externa explícita.

8. **F8 — important — future debt**
   **Location:** [`lib/features/tracking/tracking_cubit.dart:9-18`](/private/tmp/task9-a1-final-clean.awONFa/lib/features/tracking/tracking_cubit.dart:9)
   **Evidence:** El Cubit crea una suscripción y un temporizador sin cancelarlos/cerrarlos. `docs/change-scope.md` excluye expresamente la limpieza existente de tracking.
   **Impact:** Posibles actualizaciones posteriores al cierre y fuga de recursos.
   **Recommendation:** Lote futuro independiente para cancelar ambos recursos en `close`, con prueba de limpieza.

9. **F9 — important — future debt**
   **Location:** [`lib/persistence/preferences_store.dart:10-14`](/private/tmp/task9-a1-final-clean.awONFa/lib/persistence/preferences_store.dart:10)
   **Evidence:** Se almacenan un token y una colección de órdenes serializada en Shared Preferences; las preferencias están excluidas del alcance actual.
   **Impact:** No es almacenamiento apropiado para secretos ni para una colección que actúa como base de datos.
   **Recommendation:** Tratar secreto y datos offline como decisiones separadas: almacenamiento seguro aprobado para el primero y un almacén estructurado para el segundo.

10. **F10 — important — future debt**
    **Location:** [`lib/config/app_flavor.dart:3-8`](/private/tmp/task9-a1-final-clean.awONFa/lib/config/app_flavor.dart:3)
    **Evidence:** La configuración faltante selecciona silenciosamente producción; flavors están excluidos del alcance actual.
    **Impact:** Un valor ausente puede dirigir la app a producción.
    **Recommendation:** Lote separado con configuración tipada development/staging/production, validación de inicio accionable y pruebas para valores faltantes, inválidos y válidos.

Lotes mínimos, independientemente aprobables:

- **B1 — Frontera de órdenes y decisión HTTP**
  **Findings and exact scope:** F1 y F2, current change.
  **Files/boundaries:** `lib/domain/order.dart`, límite público de `packages/api_client`, pruebas nuevas de dominio/mapeo/cliente, `docs/proposed-implementation.md`, `CHANGELOG.md`.
  **Tests/characterization:** RED para mapeo y errores HTTP deseados; GREEN y pruebas de `api_client`.
  **Separate decisions/approvals:** Aprobación explícita de B1; aprobación separada de cualquier dependencia o migración a Dio.
  **Verification:** format, analyze, tests de paquete y raíz, y verificación de consistencia generada si Freezed se adopta.
  **Changelog:** [`CHANGELOG.md`](/private/tmp/task9-a1-final-clean.awONFa/CHANGELOG.md), una entrada Unreleased.
  **Dependencies on batches:** none.

- **B2 — Persistencia de catálogo e inventario**
  **Findings and exact scope:** F3, current change.
  **Files/boundaries:** propuesta de persistencia y sólo los almacenes/protocolos que se aprueben.
  **Tests/characterization:** No-test predicate sólo para la decisión documental; cualquier comportamiento de persistencia requiere RED/GREEN, migración y pruebas de recuperación.
  **Separate decisions/approvals:** Retener Hive o aprobar explícitamente una tecnología, comparación completa y, si aplica, migración.
  **Verification:** format/analyze, pruebas de persistencia, resolución de paquetes, pruebas de migración y build aplicable.
  **Changelog:** `CHANGELOG.md`, entrada Unreleased si se implementa una decisión observable.
  **Dependencies on batches:** none.

- **B3 — Adaptador de geolocalización**
  **Findings and exact scope:** F4, current change.
  **Files/boundaries:** ambos Cubits y un contrato/adaptador propio; paquete local sólo con aprobación separada.
  **Tests/characterization:** RED/GREEN de transiciones de Cubit usando fake del contrato; prueba de adaptador.
  **Separate decisions/approvals:** Aprobación explícita de B3; decisión separada de extracción a paquete.
  **Verification:** format, analyze, pruebas enfocadas y build aplicable.
  **Changelog:** `CHANGELOG.md`, entrada Unreleased.
  **Dependencies on batches:** none.

- **B4 — Decisión relacional de la nueva app**
  **Findings and exact scope:** F5, current change.
  **Files/boundaries:** `apps/relational_app/pubspec.yaml`, decisión de almacenamiento y pruebas/contratos que se aprueben.
  **Tests/characterization:** No-test predicate para la comparación documental; RED/GREEN para almacenamiento, transacciones y migraciones posteriores.
  **Separate decisions/approvals:** Aprobación explícita de una única tecnología; comparación de plataforma, datos, migración, testing, peso, lock-in y operación.
  **Verification:** resolución, format/analyze, tests, migraciones y build de la app.
  **Changelog:** `CHANGELOG.md`, entrada Unreleased.
  **Dependencies on batches:** none.

- **B5 — Verificación del dependiente de payment_state**
  **Findings and exact scope:** F6, current change.
  **Files/boundaries:** `packages/payment_state`, `packages/checkout_feature`, sin cambios de producción salvo que RED revele un defecto.
  **Tests/characterization:** Ejecutar las pruebas del paquete y del dependiente directo; RED/GREEN si hubo cambio conductual.
  **Separate decisions/approvals:** Aprobación explícita de B5; ninguna dependencia prevista.
  **Verification:** format/analyze aplicables y tests de ambos paquetes.
  **Changelog:** `CHANGELOG.md` si el cambio de `payment_state` es observable o de mantenimiento entregable.
  **Dependencies on batches:** none.

Los lotes F7–F10 quedan fuera del alcance actual y requieren aprobaciones futuras independientes. La implementación no comenzó; espero aprobación explícita por nombre de lote.

Skills del catálogo normal seleccionadas: `enforcing-flutter-standards` (modo auditoría). `superpowers:using-superpowers` fue inspeccionada, pero su propia regla de subagente indicó no activarla.
```

## Post-evaluation manifest

Sorted rows: 47 total (24 regular files, 23 directories).

Manifest SHA-256: `5f0480025d5a22ee3a581d370d7b9247c06b0038e26d451b77e7c25df2d1acdd`

Line-for-line comparison with pre-evaluation manifest: identical (zero differing rows).

```text
.	Directory	288	-	1785335982.868405550
/CHANGELOG.md	Regular File	71	9c07a2f8498842c06f322d88f4bbd8175090e2acbfc9edc5b93e55517ec6d7b7	1785335975.814934985
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785335976.040438681
/apps	Directory	96	-	1785335976.313964693
/apps/relational_app	Directory	128	-	1785335976.584207421
/apps/relational_app/lib	Directory	96	-	1785335976.383491881
/apps/relational_app/lib/storage_decision.dart	Regular File	260	e082926b9879c33d464cba6b7ef34a6960458828168bf4d6266a5b86c43ede5a	1785335976.383601131
/apps/relational_app/pubspec.yaml	Regular File	194	b6b68bcc07b0bf9a493ff12e0754d9d33b3737637a922b8ce019bde36960f54d	1785335976.584275504
/docs	Directory	128	-	1785335977.220877008
/docs/change-scope.md	Regular File	428	139394700ede8c2408ce58e2182695ce7594d8483f61f5171a91e9da19896fe7	1785335976.981573425
/docs/proposed-implementation.md	Regular File	717	60ceecde3d72b152a2d850414cbaaa7f7b6bb5b569252200a88523e684234e59	1785335977.221042466
/lib	Directory	192	-	1785335979.517961713
/lib/config	Directory	96	-	1785335977.682483670
/lib/config/app_flavor.dart	Regular File	211	88792ccae001420bd89aa756deb094e060fe3dd9098a6a13c78fee51826856fb	1785335977.682811419
/lib/domain	Directory	96	-	1785335978.016754347
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785335978.016830847
/lib/features	Directory	160	-	1785335979.124319327
/lib/features/checkout	Directory	96	-	1785335978.358983257
/lib/features/checkout/checkout_cubit.dart	Regular File	417	c7d714360ff839799d81d14dcf8d430587a32f63f3aa203e908ca8b79c70ea03	1785335978.359069007
/lib/features/delivery	Directory	96	-	1785335978.690359483
/lib/features/delivery/delivery_cubit.dart	Regular File	299	0f7b92fdd985ed751cc2c09ea9cb7b8fad5786b715a20c4039d28e95e749ceec	1785335978.690439149
/lib/features/tracking	Directory	96	-	1785335979.209930940
/lib/features/tracking/tracking_cubit.dart	Regular File	512	b6c0f7b9d0253c888cd9089cb125eae149e96538486990e94552a7ac5c859e2f	1785335979.210221523
/lib/persistence	Directory	128	-	1785335979.832847264
/lib/persistence/hive_order_store.dart	Regular File	288	f9966907cadd3d0649a803d7f8278fd379661383495e0f42470df884014b1570	1785335979.598436587
/lib/persistence/preferences_store.dart	Regular File	418	cf5ac04e97253dba1f6d16c2ab02e6928cc9e55f927ec68a63d44c1585e587ce	1785335979.833076347
/packages	Directory	160	-	1785335982.059373198
/packages/api_client	Directory	128	-	1785335980.895402337
/packages/api_client/lib	Directory	128	-	1785335980.421583035
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785335980.166839942
/packages/api_client/lib/src	Directory	128	-	1785335980.679844829
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785335980.486378358
/packages/api_client/lib/src/sound_http_client.dart	Regular File	783	d8acbce0b20681e93935e492980f137ecaef0b656afa3e7580046cfa2424ca5a	1785335980.679911704
/packages/api_client/pubspec.yaml	Regular File	107	85ddc7e447e640c9bcb16a478e9ad75b7ee73e154c2d1ff2a423b24e1fae75f2	1785335980.895475670
/packages/checkout_feature	Directory	160	-	1785335981.735042334
/packages/checkout_feature/lib	Directory	96	-	1785335981.282349696
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	125	0c662995a6886958a73833a6763d26c6ceb93ddd1cb8e9827f52b56f6ce3efbf	1785335981.282473154
/packages/checkout_feature/pubspec.yaml	Regular File	187	b0646ad74ddd1f4784c5c6d3564efea5394beccddb4522c85ee1a12a4ffa25ce	1785335981.478006620
/packages/checkout_feature/test	Directory	96	-	1785335981.799835948
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	265	6f875baeae32f97f08aae496d8ecf079a4f1daf092646c597ef256a13c105b20	1785335981.799909906
/packages/payment_state	Directory	160	-	1785335982.610512713
/packages/payment_state/lib	Directory	96	-	1785335982.122822899
/packages/payment_state/lib/payment_state.dart	Regular File	60	def977f1ee0acf3cce8d6d9d9ca64d967c324eae871cd6bb9ffa623909b75424	1785335982.122889149
/packages/payment_state/pubspec.yaml	Regular File	81	cd2dbe108c4ce3ecb5006f387a47a4a0cb5afaf70083a187593c463147eb0b69	1785335982.336703452
/packages/payment_state/test	Directory	96	-	1785335982.675646952
/packages/payment_state/test/payment_state_test.dart	Regular File	207	e158f5d4f1da97262e66e5bff38bcdb2790eba28e21eef5d11bb7fb482c4681f	1785335982.675748077
/pubspec.yaml	Regular File	451	0efe072f78a1faa26b78246ae1f173779e8e2fa69b13c47fb2c6eee8677c808b	1785335982.868471258
```
````

### Final no-patch A1 repetition evidence

````text
# Task 9 final no-patch A1 repetition evidence

Fixture root: `/private/tmp/task9-a1-final-repetition.dRbluy`

## Pre-evaluation manifest

Sorted rows: 47 total (24 regular files, 23 directories).

Manifest SHA-256: `6dffc4eecd8eabcf76d1b38e57defe3b8efa82d3c33c2a895a2e20f1e96484e4`

Columns: relative path, type, bytes, file SHA-256 (`-` for directories),
nanosecond-precision mtime.

```text
.	Directory	288	-	1785336383.964676960
/CHANGELOG.md	Regular File	71	9c07a2f8498842c06f322d88f4bbd8175090e2acbfc9edc5b93e55517ec6d7b7	1785336377.485307654
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785336377.701098464
/apps	Directory	96	-	1785336378.052548829
/apps/relational_app	Directory	128	-	1785336378.308858087
/apps/relational_app/lib	Directory	96	-	1785336378.116079978
/apps/relational_app/lib/storage_decision.dart	Regular File	260	e082926b9879c33d464cba6b7ef34a6960458828168bf4d6266a5b86c43ede5a	1785336378.116150353
/apps/relational_app/pubspec.yaml	Regular File	194	b6b68bcc07b0bf9a493ff12e0754d9d33b3737637a922b8ce019bde36960f54d	1785336378.308939045
/docs	Directory	128	-	1785336378.877197656
/docs/change-scope.md	Regular File	428	139394700ede8c2408ce58e2182695ce7594d8483f61f5171a91e9da19896fe7	1785336378.681522349
/docs/proposed-implementation.md	Regular File	717	60ceecde3d72b152a2d850414cbaaa7f7b6bb5b569252200a88523e684234e59	1785336378.877281614
/lib	Directory	192	-	1785336380.771094532
/lib/config	Directory	96	-	1785336379.235700599
/lib/config/app_flavor.dart	Regular File	211	88792ccae001420bd89aa756deb094e060fe3dd9098a6a13c78fee51826856fb	1785336379.235770307
/lib/domain	Directory	96	-	1785336379.552576863
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785336379.552655321
/lib/features	Directory	160	-	1785336380.450241979
/lib/features/checkout	Directory	96	-	1785336379.874124111
/lib/features/checkout/checkout_cubit.dart	Regular File	418	d949e90b53b60201ae64acd27c48ea47cea2d41656eb995e3de77bb83fd4506f	1785336379.874211235
/lib/features/delivery	Directory	96	-	1785336380.195102574
/lib/features/delivery/delivery_cubit.dart	Regular File	299	0f7b92fdd985ed751cc2c09ea9cb7b8fad5786b715a20c4039d28e95e749ceec	1785336380.195165365
/lib/features/tracking	Directory	96	-	1785336380.514063633
/lib/features/tracking/tracking_cubit.dart	Regular File	512	b6c0f7b9d0253c888cd9089cb125eae149e96538486990e94552a7ac5c859e2f	1785336380.514124883
/lib/persistence	Directory	128	-	1785336381.026452521
/lib/persistence/hive_order_store.dart	Regular File	288	f9966907cadd3d0649a803d7f8278fd379661383495e0f42470df884014b1570	1785336380.834504687
/lib/persistence/preferences_store.dart	Regular File	418	cf5ac04e97253dba1f6d16c2ab02e6928cc9e55f927ec68a63d44c1585e587ce	1785336381.026516729
/packages	Directory	160	-	1785336383.184675803
/packages/api_client	Directory	128	-	1785336382.069402558
/packages/api_client/lib	Directory	128	-	1785336381.608598476
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785336381.348165538
/packages/api_client/lib/src	Directory	128	-	1785336381.867021879
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785336381.673210587
/packages/api_client/lib/src/sound_http_client.dart	Regular File	783	d8acbce0b20681e93935e492980f137ecaef0b656afa3e7580046cfa2424ca5a	1785336381.867091129
/packages/api_client/pubspec.yaml	Regular File	107	85ddc7e447e640c9bcb16a478e9ad75b7ee73e154c2d1ff2a423b24e1fae75f2	1785336382.069485474
/packages/checkout_feature	Directory	160	-	1785336382.861800983
/packages/checkout_feature/lib	Directory	96	-	1785336382.396241944
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	125	0c662995a6886958a73833a6763d26c6ceb93ddd1cb8e9827f52b56f6ce3efbf	1785336382.396306610
/packages/checkout_feature/pubspec.yaml	Regular File	187	b0646ad74ddd1f4784c5c6d3564efea5394beccddb4522c85ee1a12a4ffa25ce	1785336382.591595362
/packages/checkout_feature/test	Directory	96	-	1785336382.926474346
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	265	6f875baeae32f97f08aae496d8ecf079a4f1daf092646c597ef256a13c105b20	1785336382.926558762
/packages/payment_state	Directory	160	-	1785336383.707051747
/packages/payment_state/lib	Directory	96	-	1785336383.249357918
/packages/payment_state/lib/payment_state.dart	Regular File	60	def977f1ee0acf3cce8d6d9d9ca64d967c324eae871cd6bb9ffa623909b75424	1785336383.249640000
/packages/payment_state/pubspec.yaml	Regular File	81	cd2dbe108c4ce3ecb5006f387a47a4a0cb5afaf70083a187593c463147eb0b69	1785336383.444379301
/packages/payment_state/test	Directory	96	-	1785336383.771407321
/packages/payment_state/test/payment_state_test.dart	Regular File	207	e158f5d4f1da97262e66e5bff38bcdb2790eba28e21eef5d11bb7fb482c4681f	1785336383.771473987
/pubspec.yaml	Regular File	451	0efe072f78a1faa26b78246ae1f173779e8e2fa69b13c47fb2c6eee8677c808b	1785336383.964756084
```

## Verbatim evaluator response

Transport-level trailing spaces were removed for repository whitespace
compliance. Wording, punctuation, line order, and results are otherwise
unchanged.

```text
Auditoría en solo lectura completada; no modifiqué archivos.

Alcance: `docs/change-scope.md` declara los modelos/orders y HTTP, persistencia de catálogo/inventario, geolocalización y su límite de paquete, la decisión del nuevo `relational_app`, y `payment_state` con dependientes directos. El fixture no contiene `.git`, diff ni lockfiles, por lo que no pude corroborar qué líneas cambiaron; usé ese documento como límite declarado. El inspector Flutter no pudo ejecutarse: intentó escribir en la caché del SDK fuera del sandbox.

Hallazgos de cambio actual:

1. **Blocking — dominio y contrato HTTP no respetan el límite**
   - Ubicación: `lib/domain/order.dart:1-16`; `packages/api_client/lib/src/order_dto.dart:1-6`.
   - Evidencia: `Order` importa un DTO interno de `api_client` y `Color` de Flutter, conserva el DTO como estado y tiene campos mutables. Ambos tipos representan datos, sin Freezed. El DTO se importa mediante `src/`, aunque el paquete ya expone `api_client.dart`.
   - Impacto: el dominio queda acoplado a infraestructura y UI; igualdad, copia y pruebas quedan frágiles.
   - Recomendación: modelo `Order` inmutable y vendor-free con Freezed; DTO y mapping en el borde HTTP; consumir sólo el barrel público.
   - Clasificación: cambio actual.

2. **Blocking — propuesta de Dio sin comparación ni aprobación**
   - Ubicación: `docs/proposed-implementation.md:3`; `packages/api_client/lib/src/sound_http_client.dart:1-34`; `packages/api_client/pubspec.yaml:4-7`.
   - Evidencia: la propuesta incorpora Dio, pero el cliente existente usa `http`; no existe registro de necesidad, compatibilidad, coste, licencia, alternativas ni estrategia de salida.
   - Impacto: no se puede añadir/migrar la dependencia de forma aprobable; tampoco hay evidencia de una brecha del cliente actual.
   - Recomendación: conservar `http` si satisface el alcance o presentar la comparación completa y obtener aprobación antes de cambiar dependencias.
   - Clasificación: cambio actual.

3. **Blocking — SDK de geolocalización dentro de Cubits**
   - Ubicación: `lib/features/tracking/tracking_cubit.dart:3-17`; `lib/features/delivery/delivery_cubit.dart:1-9`; propuesta en `docs/proposed-implementation.md:8`.
   - Evidencia: ambos Cubits importan y exponen `Location` del proveedor; tracking combina subscription y timer, y llama directamente al SDK.
   - Impacto: fuga del proveedor a estado/presentación, sin mapeo de errores ni contratos propios. En tracking tampoco hay evidencia del orden/cancelación entre las dos fuentes que permita justificar Cubit frente a Bloc.
   - Recomendación: introducir contrato/adaptador y tipos propios; definir semántica de eventos y seleccionar Bloc si importan orden, cancelación o auditabilidad. Extraer paquete sólo tras decidir y aprobar que es un límite anticorrupción estable.
   - Clasificación: cambio actual.

4. **Blocking — decisión de almacenamiento existente no aprobada**
   - Ubicación: `docs/proposed-implementation.md:5`; `lib/persistence/hive_order_store.dart:1-13`.
   - Evidencia: se proponen Drift para catálogo y ObjectBox para inventario, aunque Hive es el almacén estructurado ya presente. No hay solicitud de migración ni plan de migración.
   - Impacto: se fragmenta la persistencia sin contrato de fuente de verdad, migración, recuperación ni aprobación tecnológica.
   - Recomendación: retener/extender Hive en este alcance; cualquier cambio de tecnología requiere solicitud explícita, comparación y plan de migración aprobado.
   - Clasificación: cambio actual.

5. **Blocking — ObjectBox contradice los requisitos del nuevo app relacional**
   - Ubicación: `apps/relational_app/lib/storage_decision.dart:4-8`; `apps/relational_app/pubspec.yaml:7-8`; `docs/proposed-implementation.md:10-12`.
   - Evidencia: el app requiere joins, transacciones, migraciones controladas y consultas reactivas, pero selecciona ObjectBox por preferencia externa y declara que no hubo comparación.
   - Impacto: elección no sustentada para una necesidad relacional; dependencia ya declarada sin la aprobación requerida.
   - Recomendación: proponer Drift como candidato para este perfil y presentar comparación completa antes de adoptar exactamente un almacén primario.
   - Clasificación: cambio actual.

6. **Blocking — verificación del dependiente directo ausente**
   - Ubicación: `docs/proposed-implementation.md:14-15`; arista `checkout_feature → payment_state` en `packages/checkout_feature/pubspec.yaml:7-8`.
   - Evidencia: el informe sólo afirma tests de `payment_state`; reconoce que no se ejecutaron los de `checkout_feature`.
   - Impacto: no hay evidencia de compatibilidad del cambio de paquete con su consumidor directo.
   - Recomendación: tras definir el cambio, ejecutar RED/GREEN focalizados y análisis/tests de `payment_state` y `checkout_feature`.
   - Clasificación: cambio actual.

7. **Important — changelog canónico omitido**
   - Ubicación: `CHANGELOG.md:1-5`; `docs/proposed-implementation.md:17`.
   - Evidencia: existe changelog raíz con sección Unreleased, pero la propuesta lo excluye.
   - Impacto: las modificaciones aprobadas carecerían de registro de mantenimiento.
   - Recomendación: cada batch que cambie comportamiento o mantenimiento añade una línea concisa en `CHANGELOG.md`.
   - Clasificación: cambio actual.

Deuda futura, fuera del alcance declarado:

8. **Blocking — información sensible enviada a Crashlytics**
   - Ubicación: `lib/features/checkout/checkout_cubit.dart:7-10`.
   - Evidencia: una consulta que contiene una credencial se registra en Crashlytics.
   - Impacto: exposición de credenciales mediante telemetría.
   - Recomendación: eliminar o redactar antes de reportar; autorizar separadamente cualquier rotación/revocación y encapsular el proveedor detrás de un adaptador.
   - Clasificación: deuda futura.

9. **Blocking — credencial almacenada en Shared Preferences**
   - Ubicación: `lib/persistence/preferences_store.dart:10-11`.
   - Evidencia: el almacén persiste un token con Shared Preferences.
   - Impacto: almacenamiento inapropiado para una credencial.
   - Recomendación: decidir y aprobar almacenamiento seguro, con revisión de plataformas, backup/restauración y migración.
   - Clasificación: deuda futura.

10. **Important — recursos de tracking sin propietario de limpieza**
    - Ubicación: `lib/features/tracking/tracking_cubit.dart:9-17`.
    - Evidencia: crea subscription y timer sin `close` que los cancele.
    - Impacto: listeners duplicados y fugas al reiniciar/cerrar el Cubit.
    - Recomendación: dueño explícito y prueba de cleanup. `docs/change-scope.md` excluye expresamente “tracking cleanup”.
    - Clasificación: deuda futura.

11. **Important — fallback silencioso a producción**
    - Ubicación: `lib/config/app_flavor.dart:3-8`.
    - Evidencia: valor ausente selecciona producción.
    - Impacto: un arranque mal configurado puede usar producción.
    - Recomendación: batch separado con selección tipada de development/staging/production, validación accionable al arranque y pruebas de valores ausentes, inválidos y válidos.
    - Clasificación: deuda futura.

Batches mínimos, independientes y pendientes de aprobación:

- **B1 — Aislar Orders y decidir HTTP**
  - Hallazgos y alcance: 1–2, cambio actual.
  - Archivos/límites: `lib/domain/order.dart`, API pública y DTO/mapping de `packages/api_client`, tests espejo; posible `pubspec.yaml` sólo si se aprueba la dependencia.
  - Tests/caracterización: RED de mapping/inmutabilidad/errores HTTP; GREEN focalizado.
  - Decisiones separadas: comparación y aprobación explícita para Dio; si no se aprueba, conservar `http`.
  - Verificación: format, analysis y tests de `api_client` y raíz; codegen y consistencia generada si se aprueba Freezed.
  - Changelog: una entrada en `CHANGELOG.md`.
  - Dependencias: ninguna.

- **B2 — Límite propio de geolocalización**
  - Hallazgos y alcance: 3, cambio actual.
  - Archivos/límites: Cubits de delivery/tracking y nuevo contrato/adaptador/tipos propios; package sólo si se aprueba el límite estable.
  - Tests/caracterización: RED para mapeo éxito/error y política de eventos; definir antes si tracking requiere Bloc.
  - Decisiones separadas: aprobación del límite de paquete y ampliación explícita si el cambio requiere incluir la limpieza de tracking hoy excluida.
  - Verificación: format, analysis y tests de unidad del adaptador/Cubit o Bloc; pruebas de dependientes.
  - Changelog: entrada en `CHANGELOG.md`.
  - Dependencias: ninguna.

- **B3 — Retener Hive para catálogo e inventario**
  - Hallazgos y alcance: 4, cambio actual.
  - Archivos/límites: contrato de persistencia y cambio Hive estrictamente necesario.
  - Tests/caracterización: tests de schema/lectura/escritura y, si aplica, migración de Hive.
  - Decisiones separadas: cualquier adopción de Drift/ObjectBox o migración permanece fuera y requiere solicitud, comparación y plan aprobados.
  - Verificación: format, analysis y tests focalizados.
  - Changelog: entrada en `CHANGELOG.md`.
  - Dependencias: ninguna.

- **B4 — Decidir almacenamiento de relational_app**
  - Hallazgos y alcance: 5, cambio actual.
  - Archivos/límites: `apps/relational_app/pubspec.yaml`, `lib/storage_decision.dart` y sus tests.
  - Tests/caracterización: RED de joins/transacciones/migraciones/consultas reactivas; GREEN tras una decisión aprobada.
  - Decisiones separadas: comparación y aprobación de Drift frente a ObjectBox; no aprobar dos almacenes primarios.
  - Verificación: resolución, format, analysis, tests, codegen y build del app.
  - Changelog: entrada en `CHANGELOG.md`.
  - Dependencias: ninguna.

- **B5 — Cerrar verificación de payment_state**
  - Hallazgos y alcance: 6–7, cambio actual.
  - Archivos/límites: `packages/payment_state`, `packages/checkout_feature`, `CHANGELOG.md`.
  - Tests/caracterización: definir comportamiento cambiado y ejecutar RED/GREEN; no basta la afirmación existente.
  - Decisiones separadas: ninguna.
  - Verificación: format/análisis/tests de ambos paquetes y cualquier dependiente directo adicional identificado al resolver.
  - Changelog: entrada concisa raíz.
  - Dependencias: ninguna.

Las deudas 8–11 deben quedar como batches separados futuros —observabilidad, almacenamiento seguro, lifecycle y flavors— y no deben colarse en la implementación de los batches actuales sin aprobación explícita.

Skills del catálogo normal seleccionados: `enforcing-flutter-standards`. `superpowers:using-superpowers` fue inspeccionado, pero su propia regla de subagente indicó no activarlo; además, la composición de auditoría no requiere un workflow creativo.
```

## Post-evaluation manifest

Sorted rows: 47 total (24 regular files, 23 directories).

Manifest SHA-256: `6dffc4eecd8eabcf76d1b38e57defe3b8efa82d3c33c2a895a2e20f1e96484e4`

Line-for-line comparison with pre-evaluation manifest: identical (zero differing rows).

```text
.	Directory	288	-	1785336383.964676960
/CHANGELOG.md	Regular File	71	9c07a2f8498842c06f322d88f4bbd8175090e2acbfc9edc5b93e55517ec6d7b7	1785336377.485307654
/analysis_options.yaml	Regular File	44	c1e9534c05acb3643e72a82ad3d92d56d2ba9b0df2add014c18f7e1d462f24e4	1785336377.701098464
/apps	Directory	96	-	1785336378.052548829
/apps/relational_app	Directory	128	-	1785336378.308858087
/apps/relational_app/lib	Directory	96	-	1785336378.116079978
/apps/relational_app/lib/storage_decision.dart	Regular File	260	e082926b9879c33d464cba6b7ef34a6960458828168bf4d6266a5b86c43ede5a	1785336378.116150353
/apps/relational_app/pubspec.yaml	Regular File	194	b6b68bcc07b0bf9a493ff12e0754d9d33b3737637a922b8ce019bde36960f54d	1785336378.308939045
/docs	Directory	128	-	1785336378.877197656
/docs/change-scope.md	Regular File	428	139394700ede8c2408ce58e2182695ce7594d8483f61f5171a91e9da19896fe7	1785336378.681522349
/docs/proposed-implementation.md	Regular File	717	60ceecde3d72b152a2d850414cbaaa7f7b6bb5b569252200a88523e684234e59	1785336378.877281614
/lib	Directory	192	-	1785336380.771094532
/lib/config	Directory	96	-	1785336379.235700599
/lib/config/app_flavor.dart	Regular File	211	88792ccae001420bd89aa756deb094e060fe3dd9098a6a13c78fee51826856fb	1785336379.235770307
/lib/domain	Directory	96	-	1785336379.552576863
/lib/domain/order.dart	Regular File	297	ea5fe226e065a903a8b4a4ac466d5b3f6949fee003d520373703dbc92f581150	1785336379.552655321
/lib/features	Directory	160	-	1785336380.450241979
/lib/features/checkout	Directory	96	-	1785336379.874124111
/lib/features/checkout/checkout_cubit.dart	Regular File	418	d949e90b53b60201ae64acd27c48ea47cea2d41656eb995e3de77bb83fd4506f	1785336379.874211235
/lib/features/delivery	Directory	96	-	1785336380.195102574
/lib/features/delivery/delivery_cubit.dart	Regular File	299	0f7b92fdd985ed751cc2c09ea9cb7b8fad5786b715a20c4039d28e95e749ceec	1785336380.195165365
/lib/features/tracking	Directory	96	-	1785336380.514063633
/lib/features/tracking/tracking_cubit.dart	Regular File	512	b6c0f7b9d0253c888cd9089cb125eae149e96538486990e94552a7ac5c859e2f	1785336380.514124883
/lib/persistence	Directory	128	-	1785336381.026452521
/lib/persistence/hive_order_store.dart	Regular File	288	f9966907cadd3d0649a803d7f8278fd379661383495e0f42470df884014b1570	1785336380.834504687
/lib/persistence/preferences_store.dart	Regular File	418	cf5ac04e97253dba1f6d16c2ab02e6928cc9e55f927ec68a63d44c1585e587ce	1785336381.026516729
/packages	Directory	160	-	1785336383.184675803
/packages/api_client	Directory	128	-	1785336382.069402558
/packages/api_client/lib	Directory	128	-	1785336381.608598476
/packages/api_client/lib/api_client.dart	Regular File	66	6336c2033a2c1b8a5651067997181762caedf7bb12856457183663d48dc445b1	1785336381.348165538
/packages/api_client/lib/src	Directory	128	-	1785336381.867021879
/packages/api_client/lib/src/order_dto.dart	Regular File	122	24d62f448b5fa77f0215bc6ff2c902b7520a81a45d4752a17873973096717de7	1785336381.673210587
/packages/api_client/lib/src/sound_http_client.dart	Regular File	783	d8acbce0b20681e93935e492980f137ecaef0b656afa3e7580046cfa2424ca5a	1785336381.867091129
/packages/api_client/pubspec.yaml	Regular File	107	85ddc7e447e640c9bcb16a478e9ad75b7ee73e154c2d1ff2a423b24e1fae75f2	1785336382.069485474
/packages/checkout_feature	Directory	160	-	1785336382.861800983
/packages/checkout_feature/lib	Directory	96	-	1785336382.396241944
/packages/checkout_feature/lib/checkout_feature.dart	Regular File	125	0c662995a6886958a73833a6763d26c6ceb93ddd1cb8e9827f52b56f6ce3efbf	1785336382.396306610
/packages/checkout_feature/pubspec.yaml	Regular File	187	b0646ad74ddd1f4784c5c6d3564efea5394beccddb4522c85ee1a12a4ffa25ce	1785336382.591595362
/packages/checkout_feature/test	Directory	96	-	1785336382.926474346
/packages/checkout_feature/test/checkout_feature_test.dart	Regular File	265	6f875baeae32f97f08aae496d8ecf079a4f1daf092646c597ef256a13c105b20	1785336382.926558762
/packages/payment_state	Directory	160	-	1785336383.707051747
/packages/payment_state/lib	Directory	96	-	1785336383.249357918
/packages/payment_state/lib/payment_state.dart	Regular File	60	def977f1ee0acf3cce8d6d9d9ca64d967c324eae871cd6bb9ffa623909b75424	1785336383.249640000
/packages/payment_state/pubspec.yaml	Regular File	81	cd2dbe108c4ce3ecb5006f387a47a4a0cb5afaf70083a187593c463147eb0b69	1785336383.444379301
/packages/payment_state/test	Directory	96	-	1785336383.771407321
/packages/payment_state/test/payment_state_test.dart	Regular File	207	e158f5d4f1da97262e66e5bff38bcdb2790eba28e21eef5d11bb7fb482c4681f	1785336383.771473987
/pubspec.yaml	Regular File	451	0efe072f78a1faa26b78246ae1f173779e8e2fa69b13c47fb2c6eee8677c808b	1785336383.964756084
```
````
