# Diseño de Evidence-Driven Development

**Estado:** implementado y verificado el 31 de julio de 2026.

## Objetivo

Extraer el proceso general actualmente embebido en
`enforcing-flutter-standards` hacia una Agent Skill portable, agnóstica del
stack y optimizada para cargar únicamente el contexto necesario en la fase
actual de una tarea.

La nueva skill se llamará `evidence-driven-development`. Será dueña del
workflow de ingeniería. `enforcing-flutter-standards` dependerá de ella y se
limitará a descubrir, aplicar y validar decisiones específicas de Flutter y
Dart.

## Decisiones aprobadas

- La nueva skill servirá a cualquier lenguaje, framework y tipo de repositorio.
- La fuente canónica inicial vivirá en este mismo repositorio.
- Flutter requerirá la nueva skill para auditoría, review, diagnóstico,
  planificación, implementación y cierre.
- Flutter no duplicará contratos generales; sólo aportará evidencia, reglas y
  validaciones de dominio.
- La extracción preservará las garantías actuales. En particular, conservará
  la política estricta de retirar una implementación de comportamiento no
  testeada antes de observar RED. Revisar esa política será un cambio futuro e
  independiente.
- `docs/superpowers/` permanecerá como historia. Ningún documento allí será
  una instrucción vigente ni una dependencia de las skills nuevas.
- El costo de contexto tendrá presupuestos y pruebas de routing, no sólo una
  recomendación editorial.

## Problema

El workflow actual está dividido y duplicado entre `SKILL.md`,
`standalone-workflow.md`, `audit-contract.md`, `audit-report-template.md` y
`quality-and-delivery.md`. Esos cinco archivos suman aproximadamente 6.000
palabras y 44 KB antes de cargar decisiones Flutter temáticas.

La selección por escenario evita algunas lecturas, pero una referencia
standalone monolítica todavía incorpora diagnóstico, diseño, aprobación, TDD,
verificación, changelog y reporte aunque la solicitud sólo necesite una fase.
Una vez leído, ese contexto no puede descargarse durante la conversación.

La extracción debe evitar que reemplazar Superpowers por otra skill reproduzca
el mismo problema: demasiado proceso cargado al inicio y contratos repetidos
por cada skill de dominio.

## Principios de diseño

1. **Una regla, un dueño:** cada contrato general vive sólo en la skill de
   workflow; cada decisión Flutter vive sólo en la skill Flutter.
2. **Routing desde evidencia:** una referencia se carga por un hecho observable
   de la solicitud, el repositorio, el diff o la fase actual.
3. **Routing por fase:** una referencia que será útil después permanece
   diferida hasta que se cumpla su condición.
4. **Core pequeño:** `SKILL.md` contiene sólo invariantes, router y condiciones
   de carga.
5. **Referencias independientes:** todas están a un nivel desde `SKILL.md` y
   ninguna obliga a leer otra referencia.
6. **Sin anticipación:** probabilidad, conveniencia o una fase futura esperada
   no justifican una lectura actual.
7. **Composición sin duplicación:** una skill de dominio amplía el workflow;
   no lo reexplica ni lo reemplaza.
8. **Equivalencia antes de mejora:** la extracción cambia ownership y carga de
   contexto, no las garantías existentes.

## Alcance

### Incluido

- crear la fuente desplegable de `evidence-driven-development`;
- separar el workflow en referencias activadas por escenario y fase;
- transferir el contrato general de auditoría, approval, TDD, diff review,
  verificación, changelog y reporte;
- reducir `enforcing-flutter-standards` a routing y decisiones Flutter;
- declarar y validar la dependencia obligatoria desde Flutter;
- reemplazar evaluaciones activas de Superpowers por evaluaciones genéricas y
  de composición;
- agregar presupuestos estáticos y observación de archivos leídos;
- validar escenarios en más de un stack;
- actualizar README, documentación vigente y changelog;
- conservar documentación histórica dentro de `docs/superpowers/`.

### Excluido

- relajar o rediseñar las garantías heredadas durante la extracción;
- mover la nueva skill a otro repositorio;
- instalarla globalmente, publicarla o crear un plugin/marketplace;
- agregar dependencias de runtime, telemetría, embeddings, RAG o persistencia
  del routing;
- medir facturación o mantener métricas históricas de tokens;
- modificar el inspector Dart salvo que una corrección sea necesaria para la
  nueva composición;
- reescribir la documentación histórica de Superpowers;
- ampliar o modernizar reglas Flutter no relacionadas con la extracción.

## Estructura desplegable

```text
.agents/skills/
├── evidence-driven-development/
│   ├── SKILL.md
│   ├── agents/
│   │   └── openai.yaml
│   └── references/
│       ├── diagnose.md
│       ├── design-and-approve.md
│       ├── audit-and-review.md
│       ├── test-first-change.md
│       ├── verify-and-complete.md
│       └── report-contracts.md
└── enforcing-flutter-standards/
    ├── SKILL.md
    ├── agents/
    │   └── openai.yaml
    ├── references/
    │   ├── architecture-and-state.md
    │   ├── packages-and-integrations.md
    │   ├── networking-and-errors.md
    │   ├── persistence.md
    │   ├── navigation.md
    │   ├── security-and-environments.md
    │   ├── flutter-quality.md
    │   └── ui-implementation.md
    └── scripts/
        └── inspect_flutter_project.dart
```

La skill genérica no tendrá `scripts/` ni `assets/` inicialmente. Las pruebas
de presupuesto y routing son artefactos de evaluación del repositorio, no
recursos necesarios durante su ejecución.

## Propiedad de contratos

| `evidence-driven-development` | `enforcing-flutter-standards` |
|---|---|
| modos audit, review e implementation | descubrimiento mecánico de proyectos Flutter |
| delimitación de alcance y mutación | arquitectura y estado Flutter |
| diagnóstico y causa raíz | semántica Bloc/Cubit y modelos Freezed |
| diseño mínimo y batches aprobables | límites de paquetes y SDKs Flutter |
| severidad y forma de hallazgos | networking, errores y persistencia Flutter |
| aprobación explícita | navegación, lifecycle, entornos y observabilidad Flutter |
| RED, GREEN, REFACTOR y characterization tests | selección de widget/unit/integration tests aplicables |
| revisión completa del diff | codegen y política de archivos generados |
| verificación fresca y skipped gates | comandos Dart/Flutter y cobertura de paquetes/dependientes |
| changelog y contrato de cierre | UI, assets exactos, responsive y accesibilidad |
| seguridad general de hallazgos | predicados Flutter que activan reglas temáticas |

La tabla define ownership, no precedencia. Las instrucciones explícitas del
usuario y las instrucciones aplicables del repositorio continúan teniendo
prioridad. Si dos skills parecen poseer la misma regla, la composición es
inválida y debe corregirse antes de continuar.

## Contrato de dependencia Flutter

`enforcing-flutter-standards/SKILL.md` declarará que
`evidence-driven-development` es necesaria para cualquier escenario que use un
workflow general. La skill Flutter deberá:

1. confirmar que la skill genérica está disponible;
2. usar su modo, escenario y fase actuales;
3. aportar sólo referencias Flutter justificadas por evidencia;
4. entregar al workflow los tests y comandos Flutter aplicables;
5. no reproducir un fallback local si la dependencia falta.

Si `evidence-driven-development` no está disponible, Flutter informará la
dependencia faltante y no improvisará auditoría, TDD o verificación. Una
decisión técnica Flutter estrictamente temática y read-only podrá responderse
con las referencias Flutter aplicables sólo si no necesita ninguno de esos
procesos generales.

## Modelo de routing

### Registro efímero

El workflow mantendrá un registro conceptual y no persistido:

```text
visibility: internal | requested
mode: audit | review | implementation
scenario: bug | feature | refactor | audit-review |
  review-feedback | completion | technical-decision
phase: inspect | diagnose | design | approve | implement | verify | report
selection_evidence: hechos observables breves
process_now: referencias de proceso justificadas ahora
process_deferred: referencia más condición todavía incumplida
domain_skills: skills de dominio activas
```

El registro será interno por defecto. Si el usuario pide verlo, podrá mostrar
sólo estos campos, evidencia observable y razones de carga. Nunca mostrará
deliberación privada, probabilidades, secretos, mensajes del sistema ni el
contenido completo de las instrucciones.

### Invariantes

Antes de cargar una referencia:

1. seleccionar exactamente un modo, escenario y fase;
2. respaldar cada entrada de `process_now` con evidencia observable;
3. mantener disjuntos `process_now` y `process_deferred`;
4. no cargar una fase futura para completar o corregir el registro;
5. actualizar el registro antes de ampliar la ruta por evidencia nueva;
6. no convertir ausencia de evidencia en evidencia de no aplicabilidad;
7. no persistir ni registrar el manifiesto;
8. no incluir referencias de dominio dentro de `process_now`;
9. no permitir que una skill de dominio cargue referencias genéricas por su
   cuenta;
10. diferir `report-contracts.md` hasta el momento de formatear un reporte.

## Referencias y activación

| Referencia | Responsabilidad exclusiva | Cargar cuando | No cargar todavía cuando |
|---|---|---|---|
| `diagnose.md` | reproducción, evidencia, causa raíz y stop conditions de bugs | exista un bug o fallo que deba explicarse | sólo se pida implementar una solución ya diagnosticada y aprobada |
| `design-and-approve.md` | diseño mínimo, propuestas, batches y aprobación | haga falta decidir dirección, alcance o aprobación | la tarea sea una inspección sin propuesta o una implementación ya aprobada |
| `audit-and-review.md` | alcance read-only, hallazgos, severidad y feedback | se pida auditoría, assessment, refactor proposal, diff/commit/PR review | una restricción read-only sea sólo preparación de un bug o feature |
| `test-first-change.md` | RED/GREEN/REFACTOR, characterization y excepciones | exista implementación aprobada o explícitamente solicitada | la tarea siga en diagnóstico, diseño, auditoría o espera de aprobación |
| `verify-and-complete.md` | diff final, gates frescos, changelog y resultado | la implementación esté lista para cierre o el usuario pida verificar | todavía haya cambios de implementación pendientes |
| `report-contracts.md` | formas exactas de auditoría e implementación | la evidencia esté completa y vaya a formatearse la respuesta | durante inspección, diagnóstico, implementación o verificación |

Una solicitud puede avanzar por varias fases, pero cada referencia se carga
sólo al entrar en su fase. Lo que probablemente será necesario después se
registra como diferido y no se lee.

### Ejemplo: bug

```text
Solicitud inicial       → diagnose.md
Causa raíz encontrada   → design-and-approve.md, sólo si hay decisión o batch
Implementación aprobada → test-first-change.md
Cambio listo            → verify-and-complete.md
Respuesta final         → report-contracts.md, sólo si su forma es necesaria
```

### Ejemplo: auditoría Flutter

```text
Inicio                   → audit-and-review.md
Evidencia de estado      → architecture-and-state.md desde Flutter
Evidencia de lifecycle   → packages-and-integrations.md desde Flutter
Informe listo            → report-contracts.md
Sin aprobación           → no test-first-change.md ni verify-and-complete.md
```

## Garantías preservadas

La extracción conservará inicialmente:

- auditorías y reviews sin mutación;
- alcance por defecto limitado a cambios y dependencias directas;
- hallazgos respaldados por evidencia y separación de deuda futura;
- batches pequeños e independientemente aprobables;
- aprobación explícita antes de implementar resultados de auditoría;
- causa raíz antes de corregir un bug;
- retirada completa de comportamiento no testeado antes del RED aplicable;
- RED observado por la razón esperada;
- characterization tests antes de refactors sin cobertura;
- implementación GREEN mínima y refactor mientras permanece verde;
- revisión del diff antes de verificar;
- verificación fresca con comandos reales y razones para gates omitidos;
- cobertura de paquetes modificados y dependientes directos cuando aplique;
- changelog existente sin creación ni version bump implícitos;
- reportes sin exagerar resultados ni exponer secretos;
- aprobación separada para dependencias, migraciones y acciones externas o
  destructivas.

Cambiar cualquiera de estas garantías requerirá una propuesta posterior con
RED conductual propio; no se combinará con la extracción.

## Presupuesto de contexto

Los límites se medirán por líneas, palabras y bytes porque son portables entre
modelos. Los tokens observados podrán registrarse como evidencia adicional
cuando el runtime los exponga, pero no serán el único gate.

| Artefacto o ruta | Objetivo | Máximo |
|---|---:|---:|
| descripción de activación | 50 palabras | 80 palabras |
| `evidence-driven-development/SKILL.md` | 500 palabras | 700 palabras, 120 líneas, 6 KB |
| `enforcing-flutter-standards/SKILL.md` | 600 palabras | 800 palabras, 140 líneas, 7 KB |
| referencia genérica individual | 400–650 palabras | 800 palabras, 8 KB |
| activación genérica inicial | core más una referencia | 1.300 palabras y dos archivos desplegables |
| referencia de reporte inicial | cero | cero hasta la fase `report` |
| referencia de implementación antes de aprobación | cero | cero |

Un escenario amplio podrá acumular referencias al progresar. La aceptación se
basará tanto en el total como en el orden: no se considerará optimizado si
carga temprano el mismo contenido que luego utiliza.

No se copiarán ejemplos largos, racionalizaciones históricas, resultados de
evaluaciones ni explicación de conceptos que un agente general ya conoce. Las
formas exactas sólo permanecerán donde la fragilidad requiera baja libertad.

## Evaluación

### Artefactos

```text
skill-evals/evidence-driven-development/
├── behavior-scenarios.md
├── scorecard.md
└── context_budget_test.dart

skill-evals/enforcing-flutter-standards/
├── behavior-scenarios.md
├── scorecard.md
└── inspect_flutter_project_test.dart
```

`context_budget_test.dart` será autocontenido y sin dependencias externas.
Validará tamaños, referencias directas, rutas inexistentes, prohibiciones de
carga anticipada expresables estáticamente y el allowlist de documentación
histórica.

### Escenarios genéricos

- **G1 — Bug Node:** diagnóstico inicial sin TDD, auditoría ni verificación.
- **G2 — Feature Python:** diseño y aprobación sin cargar cierre.
- **G3 — Refactor sin cobertura:** characterization antes del cambio.
- **G4 — Auditoría read-only:** audit contract y reporte diferido.
- **G5 — Implementación aprobada:** test-first sin contrato de auditoría.
- **G6 — Completion:** diff y verificación sin recargar diseño.
- **G7 — Review feedback:** evaluación técnica antes de mutar.
- **G8 — No-test predicate:** excepción exacta y validación alternativa.
- **G9 — Untested implementation:** preservación de la retirada previa a RED.
- **G10 — Ruta visible:** manifiesto seguro sólo ante pedido explícito.

### Escenarios de composición Flutter

- **F1 — Dependencia disponible:** workflow genérico más una referencia Flutter
  respaldada por evidencia.
- **F2 — Dependencia ausente:** Flutter informa el bloqueo y no recrea el
  workflow.
- **F3 — Bug HTTP:** diagnóstico genérico más networking Flutter; TDD diferido.
- **F4 — Auditoría de estado:** audit genérico más architecture/state; template
  diferido.
- **F5 — Implementación UI:** test-first genérico más UI y calidad Flutter
  aplicables, sin dominios no relacionados.
- **F6 — Cierre multipaquete:** verificación genérica más comandos de paquetes y
  dependientes Flutter.

Cada evaluación registrará:

```text
skills activadas
modo, escenario y fase
archivos cargados y orden
palabras y bytes cargados
referencias requeridas, diferidas y prohibidas
resultado conductual observable
```

Una respuesta técnicamente correcta fallará la evaluación de routing si leyó
una referencia prohibida o prematura.

## Documentación histórica y vigente

`docs/superpowers/` conservará especificaciones y planes históricos sin
reescritura. Esos documentos no participarán de búsquedas de instrucciones
vigentes, validación de rutas ni distribución de skills.

La documentación nueva vivirá bajo `docs/`, fuera de ese árbol histórico:

```text
docs/specs/
docs/plans/
```

Los documentos raíz anteriores que todavía describan Superpowers como una
ruta vigente deberán actualizarse o trasladarse al árbol histórico preservando
su contenido. El README vigente podrá enlazar el archivo histórico, pero no
instruirá a cargarlo.

La aceptación no exige cero apariciones del término `Superpowers`; exige:

- cero imports, rutas o instrucciones ejecutables desde skills activas;
- cero escenarios activos que declaren su disponibilidad;
- cero documentación vigente que lo seleccione como workflow;
- apariciones históricas confinadas al allowlist documentado.

## Migración por batches

### B1 — Especificación y baselines

- aprobar este diseño;
- escribir escenarios genéricos y de composición antes de crear la skill;
- observar RED de comportamiento y presupuesto;
- no modificar todavía las skills desplegables.

### B2 — Fuente genérica mínima

- inicializar `evidence-driven-development` con `init_skill.py`;
- crear solamente `SKILL.md`, metadata y las referencias justificadas;
- implementar routing y contratos preservados;
- validar estructura y presupuestos.

### B3 — Dependencia Flutter

- hacer obligatoria la composición desde Flutter;
- migrar contratos genéricos fuera de Flutter;
- renombrar y limitar `quality-and-delivery.md` a validación Flutter;
- mantener referencias temáticas independientes.

### B4 — Equivalencia y eliminación activa

- reemplazar escenarios Superpowers activos;
- ejecutar regresiones genéricas y Flutter;
- retirar `standalone-workflow.md`, `superpowers-integration.md`, el audit
  contract duplicado y la template duplicada sólo después de GREEN;
- confirmar que ninguna garantía quedó sin dueño.

### B5 — Documentación y cierre

- actualizar README y documentación vigente;
- preservar `docs/superpowers/` como historia;
- ejecutar budgets, validadores de skills, inspector Dart, evaluaciones y
  `git diff --check`;
- realizar forward-testing aislado en Node, Python y Flutter;
- actualizar el changelog canónico.

Cada batch requerirá aprobación explícita antes de modificar su alcance.

## Archivos implementados

### Crear

- `.agents/skills/evidence-driven-development/SKILL.md`
- `.agents/skills/evidence-driven-development/agents/openai.yaml`
- las seis referencias genéricas definidas en esta especificación
- `skill-evals/evidence-driven-development/behavior-scenarios.md`
- `skill-evals/evidence-driven-development/scorecard.md`
- `skill-evals/evidence-driven-development/context_budget_test.dart`
- `docs/plans/2026-07-31-evidence-driven-development.md`

### Modificar

- `.agents/skills/enforcing-flutter-standards/SKILL.md`
- `.agents/skills/enforcing-flutter-standards/agents/openai.yaml`
- `.agents/skills/enforcing-flutter-standards/references/quality-and-delivery.md`
- `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- `skill-evals/enforcing-flutter-standards/scorecard.md`
- `README.md`
- `docs/design.md`
- `docs/implementation-plan.md`
- `CHANGELOG.md`

### Retirados después de equivalencia GREEN

- `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`
- `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`
- `.agents/skills/enforcing-flutter-standards/references/audit-contract.md`
- `.agents/skills/enforcing-flutter-standards/references/audit-report-template.md`

Retirar significa eliminar de la fuente desplegable después de migrar y
validar su contenido. La documentación histórica que describe esos archivos no
se eliminará.

## Criterios de aceptación

- la skill genérica funciona sin conocimiento de Flutter;
- Flutter requiere la skill genérica y no mantiene un workflow duplicado;
- cada regla preservada tiene un único dueño identificable;
- la política estricta de RED continúa observable;
- el router carga como máximo una referencia de proceso al inicio;
- ninguna referencia de implementación se lee antes de aprobación;
- ninguna template se lee antes de reportar;
- los presupuestos de líneas, palabras, bytes y archivos pasan;
- las rutas Node, Python y Flutter pasan en contextos aislados;
- las evaluaciones registran el orden real de archivos leídos;
- una carga prematura falla aunque la respuesta final sea correcta;
- el inspector Dart y sus formatos no sufren regresiones;
- no se agregan dependencias de runtime;
- ninguna skill activa referencia Superpowers;
- `docs/superpowers/` permanece disponible sólo como historia;
- README, documentación vigente y changelog describen la arquitectura real.

## Resultado verificado

B1–B5 fueron ejecutados. G1–G10 y F1–F6 quedaron GREEN en contextos
aislados; el budget test, ambos validadores estructurales y las diez pruebas del
inspector pasaron. La fuente desplegable ya contiene las dos skills finales y
los cuatro contratos Flutter legacy fueron retirados después de equivalencia.
