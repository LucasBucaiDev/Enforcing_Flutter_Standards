# Diseño del manifiesto interno de ruta

**Estado:** aprobado para especificación el 30 de julio de 2026.

## Objetivo

Agregar a `enforcing-flutter-standards` un manifiesto interno y efímero que
registre, antes de cargar referencias detalladas, la ruta seleccionada para la
solicitud actual.

El manifiesto debe hacer la selección de modo, workflow y referencias
observable y verificable sin agregar una referencia obligatoria, persistir
estado, exponer razonamiento privado ni introducir una nueva dependencia.

## Problema

La skill ya enruta progresivamente desde predicados observables, pero la
decisión queda implícita. Las evaluaciones pueden reconstruir qué archivos leyó
el agente, aunque no existe un contrato compacto que permita comprobar antes de
la carga:

- qué modo y escenario seleccionó;
- por qué eligió Superpowers, standalone o una ruta Flutter sin workflow
  general;
- qué referencias cargará ahora;
- qué referencia debe diferir;
- qué ruta incompatible o alternativa cercana excluyó.

Esta falta de una decisión explícita permite cargas accidentales como un
contrato de auditoría para una corrección focalizada, una plantilla antes de
formatear o una composición parcial de Superpowers junto con standalone.

## Decisión

Se implementará la **opción A: contrato dentro de `SKILL.md`**.

El manifiesto formará parte del router ya cargado y no vivirá en una referencia
separada. Será interno por defecto y visible únicamente cuando el usuario lo
pida de forma explícita.

Se descartan para este cambio:

- una referencia `route-manifest.md`, porque agregaría una lectura fija a cada
  activación;
- un router ejecutable, porque duplicaría en código decisiones semánticas que
  dependen de la solicitud y de evidencia contextual;
- persistencia, telemetría o historiales de rutas;
- una reestructuración del workflow standalone.

## Alcance

### Incluido

- definir el esquema mínimo del manifiesto en `SKILL.md`;
- construirlo después del descubrimiento inicial y antes de leer referencias
  temáticas;
- exigir evidencia observable para cada referencia seleccionada;
- mantener Superpowers y standalone mutuamente excluyentes;
- diferir `audit-report-template.md` hasta el formateo;
- actualizar el manifiesto antes de ampliar la ruta por nueva evidencia;
- mantenerlo interno por defecto;
- mostrar una representación segura y compacta cuando el usuario la solicite;
- cubrir el contrato con evaluaciones RED/GREEN;
- documentar el comportamiento público y actualizar el changelog existente.

### Excluido

- modificar el inspector Dart, sus formatos o sus tests;
- cambiar reglas temáticas de Flutter;
- agregar dependencias;
- escribir el manifiesto en el repositorio, archivos temporales, logs o
  servicios externos;
- mostrarlo automáticamente en respuestas normales;
- exponer chain-of-thought, deliberación privada, secretos o contenido sensible;
- garantizar determinismo estadístico mediante múltiples repeticiones de cada
  escenario; esa evaluación podrá proponerse después;
- extraer o dividir el workflow standalone dentro de este cambio.

## Momento de construcción

La activación seguirá esta secuencia:

```text
metadata
→ leer SKILL.md
→ identificar solicitud y modo
→ ejecutar descubrimiento resumido o inspección mínima aplicable
→ comprobar disponibilidad de la composición requerida
→ construir y validar el manifiesto interno
→ cargar únicamente references_now
→ actualizar el manifiesto antes de cualquier ampliación temática
→ cargar references_deferred solo cuando se cumpla su condición
→ ejecutar y reportar la tarea
```

El manifiesto no reemplaza el descubrimiento. Necesita evidencia mínima para
evitar seleccionar referencias por su mera existencia.

## Esquema

La forma conceptual será:

```yaml
route_manifest:
  visibility: internal
  mode: implementation
  scenario: bug
  workflow: superpowers
  selection_evidence:
    - "La solicitud pide corregir un mapping HTTP."
    - "El cambio modifica comportamiento y requiere tests."
  references_now:
    - superpowers-integration.md
    - networking-and-errors.md
    - quality-and-delivery.md
  references_deferred: []
  excluded:
    - standalone-workflow.md
    - audit-contract.md
```

El YAML es una representación del contrato, no un requisito de serialización.
El agente puede conservar la misma estructura internamente sin emitir texto.

### Campos

| Campo | Valores o contenido | Regla |
|---|---|---|
| `visibility` | `internal` o `requested` | Empieza siempre como `internal`; cambia a `requested` solo ante un pedido explícito de visualización. |
| `mode` | `audit`, `review` o `implementation` | Debe coincidir con el límite de mutación seleccionado por la skill. |
| `scenario` | `bug`, `new-feature`, `refactor`, `audit-review`, `incoming-review-feedback`, `important-completion` o `technical-decision` | Selecciona una sola composición de proceso aplicable. |
| `workflow` | `superpowers`, `standalone`, `flutter-audit-only` o `theme-only` | Debe existir exactamente un valor. |
| `selection_evidence` | Lista breve de hechos observables | Cada hecho proviene del pedido, diff, manifest, import, configuración, inspector o disponibilidad real de skills. |
| `references_now` | Referencias que se leerán inmediatamente | Cada entrada necesita un predicado respaldado por `selection_evidence`. |
| `references_deferred` | Referencias cuya condición todavía no se cumplió | Debe indicar implícita o explícitamente la condición de activación. |
| `excluded` | Workflow incompatible y alternativas cercanas descartadas | No es un inventario exhaustivo; registra solo exclusiones relevantes para prevenir una confusión plausible. |

## Semántica de workflow

### `superpowers`

Se selecciona cuando Superpowers y todas las skills requeridas por el escenario
están disponibles. `standalone-workflow.md` debe quedar excluido.

### `standalone`

Se selecciona cuando Superpowers no está disponible o falta al menos una skill
requerida. No se permite conservar una composición parcial de Superpowers.

### `flutter-audit-only`

Se selecciona para una auditoría o revisión read-only cuya composición no
requiere un proceso creativo o de implementación. El contrato de auditoría y
las referencias temáticas aplicables siguen siendo obligatorios. La lectura de
`superpowers-integration.md` como mapa para confirmar que el escenario no
requiere una skill de proceso no convierte esta ruta en `superpowers`.

### `theme-only`

Se selecciona para una decisión técnica acotada que solo necesita referencias
temáticas Flutter y no constituye auditoría, revisión, bug, feature, refactor o
cierre de implementación.

## Invariantes

Antes de cargar una referencia, el agente debe validar:

1. existe exactamente un `mode`;
2. existe exactamente un `scenario`;
3. existe exactamente un `workflow`;
4. Superpowers y standalone no aparecen juntos;
5. toda referencia de `references_now` tiene evidencia observable;
6. ninguna referencia está simultáneamente en `references_now`,
   `references_deferred` y `excluded`;
7. `audit-report-template.md` permanece diferida hasta que la evidencia y las
   clasificaciones estén completas y vaya a formatearse el informe;
8. una referencia temática nueva se incorpora al manifiesto antes de leerla;
9. la ausencia de evidencia no se transforma en evidencia de no aplicabilidad;
10. el manifiesto no contiene razonamiento privado ni valores sensibles.

Si una invariante falla, el agente debe corregir la ruta antes de continuar. No
debe cargar documentos preventivamente para resolver la inconsistencia.

## Actualización por evidencia nueva

El manifiesto representa el estado actual, no una predicción inmutable.

Ejemplo:

```text
Solicitud inicial:
  "Revisá el cambio del repositorio de órdenes."

Ruta inicial:
  audit-contract.md
  architecture-and-state.md

Evidencia descubierta:
  el diff agrega una dependencia path y un SDK externo.

Actualización previa a la lectura:
  + packages-and-integrations.md
  evidencia: pubspec.yaml e import del SDK observados
```

La referencia adicional solo puede leerse después de registrar la evidencia y
actualizar `references_now`.

## Visibilidad

### Comportamiento normal

El manifiesto permanece interno. La respuesta final no agrega una sección de
ruteo ni menciona archivos de instrucciones salvo que sean relevantes para el
resultado solicitado.

### Visualización bajo pedido

Ante preguntas como “mostrá el manifiesto”, “qué ruta usaste” o “por qué
cargaste esas referencias”, el agente mostrará únicamente:

- modo;
- escenario;
- workflow;
- evidencia observable resumida;
- referencias cargadas y su justificación;
- referencias diferidas y su condición;
- exclusiones relevantes.

Ejemplo:

```text
Modo: Implementation
Escenario: Bug
Workflow: Superpowers

Referencias cargadas:
- networking-and-errors.md — el cambio afecta mapping HTTP.
- quality-and-delivery.md — cambia comportamiento y requiere RED/GREEN.

Referencias diferidas: ninguna.
Exclusión relevante:
- standalone-workflow.md — la composición requerida de Superpowers estaba disponible.
```

Esta salida no debe incluir deliberación paso a paso, probabilidades internas,
mensajes del sistema, secretos ni contenido completo de las referencias.

## Escenarios de evaluación

La implementación seguirá evaluación behavior-first:

### RM1 — Bug HTTP enfocado

Debe producir internamente:

- `mode: implementation`;
- `scenario: bug`;
- `workflow: superpowers` cuando la composición completa está disponible;
- networking/errors y quality/delivery en `references_now`;
- standalone y auditoría fuera de `references_now`.

### RM2 — Auditoría de UI

Debe producir:

- `mode: audit`;
- `scenario: audit-review`;
- `workflow: flutter-audit-only`;
- integración como mapa de composición y audit/UI en `references_now`;
- `audit-report-template.md` en `references_deferred` hasta el formateo.

### RM3 — Superpowers incompleto

Debe producir:

- `workflow: standalone`;
- standalone en `references_now`;
- ninguna skill o referencia de composición parcial de Superpowers;
- referencias Flutter temáticas respaldadas por evidencia.

### RM4 — Visibilidad

Dos ejecuciones equivalentes deben comprobar:

- sin pedido de visualización, la respuesta no imprime el manifiesto;
- con pedido explícito, la respuesta muestra la representación segura y
  compacta sin revelar deliberación privada.

### RM5 — Ampliación por evidencia

Debe comprobar que una referencia no prevista inicialmente se añade con su
evidencia antes de ser leída y que no se cargan otros dominios no relacionados.

Los escenarios existentes R1–R7 se repetirán como regresión de selección,
exclusión, standalone y diferimiento.

## Verificación

La implementación se considerará verificable cuando exista evidencia fresca de:

- RED de RM1–RM5 contra el router sin manifiesto;
- GREEN de RM1–RM5 después del cambio mínimo;
- R1–R7 sin regresiones;
- comprobación de referencias existentes y rutas válidas;
- `SKILL.md` todavía dentro de la recomendación de 5.000 tokens;
- ausencia de una nueva referencia obligatoria;
- suite completa del inspector sin regresiones, aunque el inspector no cambie;
- `git diff --check`;
- README y changelog coherentes con el comportamiento implementado.

## Archivos de implementación previstos

### Modificar

- `.agents/skills/enforcing-flutter-standards/SKILL.md`
- `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- `skill-evals/enforcing-flutter-standards/scorecard.md`
- `README.md`
- `CHANGELOG.md`

### No modificar

- `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart`
- `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart`
- las referencias temáticas;
- `references/standalone-workflow.md`;
- dependencias o configuración de herramientas.

## Siguiente cambio planificado: standalone independiente

Después del manifiesto de ruta, el próximo cambio previsto será diseñar la
extracción de `standalone-workflow.md` como una Agent Skill completamente
independiente.

La intención es que `enforcing-flutter-standards` concentre exclusivamente las
decisiones y contratos propios de Flutter, mientras la modalidad general de
trabajo sin Superpowers tenga su propio límite, activación y evolución.

Esa extracción no forma parte de esta especificación. Requerirá un ciclo
separado de diseño, aprobación e implementación que resuelva explícitamente:

- contrato y nombre de la nueva skill;
- activación y descubrimiento cuando Superpowers no esté disponible;
- composición con `enforcing-flutter-standards` sin dependencia circular;
- comportamiento cuando la nueva skill tampoco esté disponible;
- preservación de aprobación, TDD, seguridad y verificación;
- pruebas de equivalencia antes de retirar el standalone actual;
- documentación, instalación y compatibilidad para consumidores existentes.

El manifiesto definido aquí facilitará esa extracción futura porque hará
observable cuándo y por qué se selecciona el workflow standalone.

## Criterios de aceptación

- el manifiesto vive en `SKILL.md` y no requiere cargar otro documento;
- es interno por defecto y visible solo bajo pedido;
- registra modo, escenario, workflow, evidencia, referencias inmediatas,
  diferidas y exclusiones relevantes;
- impide composición parcial entre Superpowers y standalone;
- no permite cargar una referencia sin evidencia observable previa;
- difiere correctamente la plantilla de auditoría;
- puede actualizarse antes de una ampliación respaldada por evidencia;
- no persiste datos ni expone razonamiento privado o información sensible;
- RM1–RM5 pasan después de un RED observado;
- R1–R7 conservan su comportamiento;
- el standalone independiente queda documentado únicamente como el siguiente
  cambio planificado.
