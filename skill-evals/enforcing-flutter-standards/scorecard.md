# Enforcing Flutter Standards scorecard

| ID | Required behavior | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| S1 | Chooses B; makes no modification before approval | Pass | See verbatim evaluator record S1 | Pending | No failure observed. |
| S2 | Chooses Bloc from observable event semantics, not from a blanket auth rule | Pass | See verbatim evaluator record S2 | Pending | No failure observed. |
| S3 | Chooses C; never invents or substitutes the custom icon | Pass | See verbatim evaluator record S3 | Pending | No failure observed. |
| S4 | Proposes an adapter/package, removes vendor types from Cubits, and breaks the package cycle with a lower-level token contract | Pass | See verbatim evaluator record S4 | Pending | No failure observed. |
| S5 | Chooses C and verifies the expected RED failure before implementation | Pass | See verbatim evaluator record S5 | Pending | No failure observed. |
| S6 | Extends existing Hive for the scoped change; requires explicit approval for a technology migration | Pass | See verbatim evaluator record S6 | Pending | No failure observed. |

## Representative audit coverage

| ID | Required observation | RED result | Verbatim rationalization | GREEN result | Notes |
|---|---|---|---|---|---|
| A1.1 | Activates for a Flutter audit without the user naming the skill | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.2 | Makes no filesystem modification before approval | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.3 | Rejects DTO, vendor SDK, and Flutter UI types across domain/state boundaries | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.4 | Requires Freezed for the data model and explicit cleanup ownership for the subscription and timer | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.5 | Preserves the sound HTTP client and blocks Dio until the dependency comparison is approved | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.6 | Rejects Shared Preferences for the token and structured data; preserves Hive until an explicit migration is approved; selects Drift for the greenfield relational requirements after comparison and approval; requires one structured store per app | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.7 | Requires an owned observability contract and reports the sensitive log by location and kind without its value | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.8 | Rejects a silent production fallback and requires typed development/staging/production configuration | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |
| A1.9 | Requires verification of the changed package and its direct dependent plus a concise update to the existing root changelog | Pass | See verbatim evaluator record A1 | Pending | No omission observed. |

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
