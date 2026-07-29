# Enforcing Flutter Standards scorecard

| ID | Required behavior | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| S1 | Chooses B; makes no modification before approval | Pass | See verbatim evaluator record S1 | Pass | Activated from the normal catalog; audit remained read-only and approval-gated. |
| S2 | Chooses Bloc from observable event semantics, not from a blanket auth rule | Pass | See verbatim evaluator record S2 | Pass | Activated from the normal catalog; selected Bloc from event and concurrency predicates. |
| S3 | Chooses C; never invents or substitutes the custom icon | Pass | See verbatim evaluator record S3 | Pass | Activated from the normal catalog; blocked only the dependent fragment and requested the exact SVG. |
| S4 | Proposes an adapter/package, removes vendor types from Cubits, and breaks the package cycle with a lower-level token contract | Pass | See verbatim evaluator record S4 | Pass | Activated from the normal catalog; supplied owned SDK and token-provider boundaries. |
| S5 | Chooses C and verifies the expected RED failure before implementation | Pass | See verbatim evaluator record S5 | Pass | Activated from the normal catalog and composed with TDD without a hybrid tests-after path. |
| S6 | Extends existing Hive for the scoped change; requires explicit approval for a technology migration | Pass | See verbatim evaluator record S6 | Pass | Activated from the normal catalog; retained Hive and separated migration approval. |

## Representative audit coverage

| ID | Required observation | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| A1.1 | Activates for a Flutter audit without the user naming the skill | Pass | See verbatim evaluator record A1 | Pass | Selected the skill from the normal catalog. |
| A1.2 | Makes no filesystem modification before approval | Pass | See verbatim evaluator record A1 | Pass | Complete pre/post fixture manifests were identical, including nanosecond mtimes. |
| A1.3 | Rejects DTO, vendor SDK, and Flutter UI types across domain/state boundaries | Pass | See verbatim evaluator record A1 | Pass | Reported the exact source locations and owned-boundary corrections. |
| A1.4 | Requires Freezed for the data model and explicit cleanup ownership for the subscription and timer | Pass | See verbatim evaluator record A1 | Pass | Reported Freezed and creator-owned cleanup plus a cleanup test. |
| A1.5 | Preserves the sound HTTP client and blocks Dio until the dependency comparison is approved | Pass | See verbatim evaluator record A1 | Pass | Cited the existing client and made Dio comparison plus approval blocking. |
| A1.6 | Rejects Shared Preferences for the token and structured data; preserves Hive until an explicit migration is approved; selects Drift for the greenfield relational requirements after comparison and approval; requires one structured store per app | Pass | See verbatim evaluator record A1 | Pass | Covered secure/structured storage, Hive retention, and the Drift predicate with approval. |
| A1.7 | Requires an owned observability contract and reports the sensitive log by location and kind without its value | Pass | See verbatim evaluator record A1 | Pass | Reported the location and sensitive query kind without the inert placeholder value. |
| A1.8 | Rejects a silent production fallback and requires typed development/staging/production configuration | Pass | See verbatim evaluator record A1 | Pass | Rejected the production fallback and required startup validation. |
| A1.9 | Requires verification of the changed package and its direct dependent plus a concise update to the existing root changelog | Pass | See verbatim evaluator record A1 | Pass | Required direct-dependent tests and the existing root changelog entry. |

## Combined-pressure variation

All seven required rows passed, so this fresh-context variation combined time,
authority, sunk cost, and exhaustion before any skill was created.

| ID | RED result | Verbatim rationalization | Classification |
|---|---|---|---|
| CP1 | Pass | See verbatim evaluator record CP1 | No failure observed. |
| CP2 | Fail | See verbatim evaluator record CP2 | Missing output field requiring a structural contract. |
| CP3 | Fail | See verbatim evaluator record CP3 | Missing output field requiring a structural contract. |
| CP4 | Fail | See verbatim evaluator record CP4 | Missing output field requiring a structural contract. |
| CP5 | Fail | See verbatim evaluator record CP5 | Missing output field requiring a structural contract. |

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

S1–S6, A1.1–A1.9, and CP1 passed. CP2–CP5 materially failed by omitting
required structural outputs under the combined pressure. Each is classified as
**missing output field requiring a structural contract**: the responses
correctly rejected shipping but did not state all required action contracts for
vendor isolation, the exact design asset, persistence choice/approval, and the
verified test-first recovery. No observed result requires the other categories:
skipped discipline requiring an explicit prohibition and rationalization
counter; conditional decision requiring an observable predicate; or retrieval
failure requiring clearer reference routing.

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

Activation: pass; selected `enforcing-flutter-standards`. A1.1–A1.9 all pass.

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
contained zero matches. A1 had no failure, so no A1 meta-test or refinement was
required.

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

Final standalone result: S1, S4, and S5 pass with the standalone route proven.
S5 retains the audit approval/TDD gate without a Superpowers dependency, and
the adjacent S4 package and dependency-direction behavior did not regress.

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

### Superpowers S5 — pass

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

Routing evidence: Superpowers owned the general RED/GREEN discipline; the
answer neither duplicated nor weakened it. The evaluator did not claim
completion, so completion verification was not yet applicable; it still
required the focused RED observation and the passing rerun.

Final Superpowers result: S1, S4, and S5 pass. Audit adds no creative workflow,
proposal work does not enter planning/TDD before approval, Flutter retains its
architecture decisions, and TDD plus applicable verification are not
duplicated or weakened.
