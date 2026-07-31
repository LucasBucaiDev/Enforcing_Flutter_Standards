# Plan de implementación de Evidence-Driven Development

**Objetivo:** reemplazar el workflow general embebido en
`enforcing-flutter-standards` por `evidence-driven-development`, una Agent Skill
portable y agnóstica del stack, sin debilitar garantías ni cargar referencias
de fases futuras.

**Arquitectura:** `evidence-driven-development` será la única dueña de los
modos, fases, diagnóstico, diseño, aprobación, auditoría, TDD, verificación,
changelog y reportes. `enforcing-flutter-standards` será una extensión de
dominio: descubrirá evidencia Flutter, cargará únicamente referencias Flutter
justificadas y aportará tests y comandos aplicables al workflow general.

**Tecnologías:** Agent Skills en Markdown, `agents/openai.yaml`, Dart sin
dependencias externas para los gates estáticos y evaluaciones en contextos
aislados.

## Estado de entrada confirmado

- La arquitectura y la especificación están aprobadas.
- B1 está completo y forma parte del working tree actual:
  - `skill-evals/evidence-driven-development/behavior-scenarios.md` contiene
    G1–G10;
  - `skill-evals/enforcing-flutter-standards/behavior-scenarios.md` contiene
    F1–F6;
  - ambos scorecards contienen los resultados RED observados;
  - `context_budget_test.dart` falla actualmente por nueve razones esperadas.
- El RED estático observado el 31 de julio de 2026 es:
  - falta la fuente de `evidence-driven-development`;
  - el core Flutter excede líneas, palabras y bytes;
  - tres archivos activos todavía mencionan Superpowers;
  - permanecen cuatro contratos generales embebidos en Flutter.
- Los cambios locales de B1 y el plan de auditoría no relacionado deben
  preservarse. No reemplazarlos, descartarlos ni incluirlos incidentalmente en
  otro batch.

## Restricciones globales

- Trabajar desde la raíz de este repositorio.
- Usar `skill-creator` para inicializar y validar la skill nueva.
- Escribir las dos skills desplegables y sus referencias en inglés; mantener
  documentación y reportes del repositorio en español.
- No instalar globalmente, publicar, crear plugin o marketplace, ni mover la
  fuente canónica a otro repositorio.
- No agregar dependencias, scripts de runtime, assets, telemetría, RAG,
  embeddings ni persistencia del routing.
- Mantener cada referencia a un solo nivel de `SKILL.md`; una referencia no
  puede requerir otra referencia.
- Mantener una sola regla y un solo dueño. Si una garantía queda duplicada o
  sin dueño, detener el batch y corregir el mapa antes de continuar.
- Preservar sin rediseñar las garantías heredadas, incluida la retirada total
  de comportamiento no testeado antes del RED aplicable.
- No retirar contratos Flutter legacy antes de equivalencia GREEN genérica y
  de composición.
- No modificar el inspector Dart salvo que una regresión reproducible de la
  nueva composición lo exija.
- Mantener `docs/superpowers/` únicamente como historia no ejecutable.
- Usar `apply_patch` para ediciones manuales. No formatear ni reescribir archivos
  ajenos al batch activo.
- No crear commits ni hacer staging como parte de este plan salvo pedido
  explícito posterior; el working tree ya contiene trabajo de B1.

## Presupuestos vinculantes

| Artefacto | Máximo |
|---|---:|
| Descripción de activación | 80 palabras |
| `evidence-driven-development/SKILL.md` | 700 palabras, 120 líneas, 6 KB |
| `enforcing-flutter-standards/SKILL.md` | 800 palabras, 140 líneas, 7 KB |
| Cada referencia genérica | 800 palabras, 140 líneas, 8 KB |
| Activación genérica inicial | core + una referencia; 1.300 palabras y dos archivos desplegables |
| `report-contracts.md` antes de `report` | 0 lecturas |
| `test-first-change.md` antes de aprobación | 0 lecturas |

## Mapa de archivos

### Crear

- `.agents/skills/evidence-driven-development/SKILL.md`
- `.agents/skills/evidence-driven-development/agents/openai.yaml`
- `.agents/skills/evidence-driven-development/references/diagnose.md`
- `.agents/skills/evidence-driven-development/references/design-and-approve.md`
- `.agents/skills/evidence-driven-development/references/audit-and-review.md`
- `.agents/skills/evidence-driven-development/references/test-first-change.md`
- `.agents/skills/evidence-driven-development/references/verify-and-complete.md`
- `.agents/skills/evidence-driven-development/references/report-contracts.md`

### Modificar

- `.agents/skills/enforcing-flutter-standards/SKILL.md`
- `.agents/skills/enforcing-flutter-standards/agents/openai.yaml`
- `.agents/skills/enforcing-flutter-standards/references/quality-and-delivery.md`
  mediante rename a `flutter-quality.md` y reducción de alcance
- `skill-evals/evidence-driven-development/scorecard.md`
- `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- `skill-evals/enforcing-flutter-standards/scorecard.md`
- `README.md`
- `docs/design.md`
- `docs/implementation-plan.md`
- `docs/specs/2026-07-31-evidence-driven-development-design.md`
- `CHANGELOG.md`

### Retirar sólo después de GREEN

- `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`
- `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`
- `.agents/skills/enforcing-flutter-standards/references/audit-contract.md`
- `.agents/skills/enforcing-flutter-standards/references/audit-report-template.md`

## Ownership de la migración

| Fuente actual | Destino exclusivo |
|---|---|
| Gates de reproducción, investigación y causa raíz del standalone | `diagnose.md` |
| Scope, diseño mínimo, propuestas, batches y aprobación | `design-and-approve.md` |
| Read-only, severidad, hallazgos, deuda futura y review feedback | `audit-and-review.md` |
| RED/GREEN/REFACTOR, characterization, recuperación estricta y no-test predicates | `test-first-change.md` |
| Revisión de diff, gates frescos, dependientes, changelog y cierre | `verify-and-complete.md` |
| Forma exacta de informes de auditoría e implementación | `report-contracts.md` |
| Tests Flutter, widget tests, codegen, comandos Dart/Flutter y cobertura | `flutter-quality.md` |
| Arquitectura, estado, paquetes, networking, persistencia, navegación, seguridad y UI Flutter | referencias temáticas Flutter existentes |

---

## B2 — Fuente genérica mínima

### Tarea 1: Reconfirmar el RED de entrada

**Archivos:** ninguno.

- [ ] Ejecutar:

  ```bash
  dart run skill-evals/evidence-driven-development/context_budget_test.dart
  ```

- [ ] Confirmar exactamente nueve fallos y las mismas categorías registradas
  en B1. Si el número o la causa cambió, actualizar primero el diagnóstico; no
  adaptar la implementación para ocultar un RED inesperado.
- [ ] Revisar `git status --short` y preservar todos los cambios locales
  anteriores a B2.

### Tarea 2: Inicializar la skill desplegable

**Archivos:** crear el directorio de `evidence-driven-development`, su
`SKILL.md`, `agents/openai.yaml` y `references/`.

- [ ] Ejecutar el inicializador de `skill-creator` desde su ubicación instalada:

  ```bash
  python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/init_skill.py evidence-driven-development --path .agents/skills --resources references --interface 'display_name=Evidence-Driven Development' --interface 'short_description=Evidence-led engineering workflow gates' --interface 'default_prompt=Use $evidence-driven-development to diagnose, plan, implement, and verify this repository change from observable evidence.'
  ```

- [ ] Mantener en el frontmatter únicamente `name` y `description`.
- [ ] No crear `scripts/`, `assets/`, README ni documentación auxiliar dentro
  de la skill.
- [ ] Eliminar todos los placeholders generados antes de continuar.

### Tarea 3: Extraer las seis referencias genéricas

**Archivos:** crear los seis archivos de `references/`.

- [ ] Escribir `diagnose.md` con reproducción, evidencia, causa raíz, límites
  de investigación y condiciones para detenerse. No incluir diseño, TDD ni
  verificación futura.
- [ ] Escribir `design-and-approve.md` con diseño mínimo, alcance, alternativas
  respaldadas por evidencia, batches pequeños, decisiones separadas y gate de
  aprobación. No incluir instrucciones de implementación.
- [ ] Escribir `audit-and-review.md` con alcance read-only, dependencias
  directas, severidades, forma obligatoria de hallazgo, clasificación
  `current change | future debt`, manejo seguro de secretos y evaluación de
  feedback por evidencia.
- [ ] Escribir `test-first-change.md` con:
  - characterization antes de refactor sin cobertura;
  - retirada completa de comportamiento no testeado previo al RED;
  - RED observado por la razón esperada;
  - GREEN mínimo y refactor mientras permanece verde;
  - predicados exactos de excepción y validación no-test;
  - registro completo de toda excepción aprobada.
- [ ] Escribir `verify-and-complete.md` con revisión del diff completo, gates
  frescos descubiertos en el repo, paquetes y dependientes directos, gates
  omitidos con motivo, changelog canónico existente, prohibición de version
  bump implícito y evidencia real de cierre.
- [ ] Escribir `report-contracts.md` con las formas exactas y concisas de
  auditoría e implementación. Mantener ejemplos sólo cuando la forma sea lo
  bastante frágil para requerir baja libertad.
- [ ] Comparar cada regla contra `standalone-workflow.md`, `audit-contract.md`,
  `audit-report-template.md`, `quality-and-delivery.md` y el core Flutter.
  Registrar temporalmente una tabla de cobertura durante la revisión del diff;
  no persistirla dentro de la skill.
- [ ] Verificar que ninguna referencia genérica enlace o requiera otra.

### Tarea 4: Implementar el core y el router por fase

**Archivo:** `.agents/skills/evidence-driven-development/SKILL.md`.

- [ ] Definir una descripción que active la skill para diagnóstico, diseño,
  planificación, auditoría/review, implementación test-first y cierre en
  cualquier stack.
- [ ] Mantener el contrato de prioridad: usuario, instrucciones aplicables del
  repo y convenciones coherentes preceden a la skill.
- [ ] Seleccionar exactamente un valor de cada eje:

  ```text
  mode: audit | review | implementation
  scenario: bug | feature | refactor | audit-review |
    review-feedback | completion | technical-decision
  phase: inspect | diagnose | design | approve | implement | verify | report
  ```

- [ ] Mantener el registro efímero seguro con:

  ```text
  visibility: internal | requested
  selection_evidence: hechos observables
  process_now: referencias justificadas en la fase actual
  process_deferred: referencia y condición incumplida
  domain_skills: skills de dominio activas
  ```

- [ ] Hacer el registro interno por defecto y mostrar sólo el schema seguro
  cuando el usuario lo solicite.
- [ ] Enrutar cada fase directamente a una referencia y cargar como máximo una
  referencia de proceso al inicio.
- [ ] Actualizar el registro antes de ampliar la ruta con evidencia nueva.
- [ ] Prohibir anticipación de `test-first-change.md`,
  `verify-and-complete.md` y `report-contracts.md`.
- [ ] Declarar composición: las skills de dominio aportan evidencia,
  referencias y comandos propios; no cargan ni duplican contratos generales.

### Tarea 5: Validar B2 en aislamiento

**Archivos:** skill genérica y scorecard genérico.

- [ ] Ejecutar el validador estructural:

  ```bash
  python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/quick_validate.py .agents/skills/evidence-driven-development
  ```

- [ ] Ejecutar el budget test. En B2 todavía puede fallar únicamente por el
  core y los cuatro archivos legacy de Flutter; la fuente genérica y todas sus
  referencias deben pasar sus presupuestos.
- [ ] Ejecutar G1–G10 en contextos aislados, exponiendo sólo la skill terminada
  y la evidencia sintética del prompt.
- [ ] Capturar para cada corrida: skills, modo/escenario/fase, archivos leídos
  en orden, palabras/bytes, requeridos/diferidos/prohibidos y conducta
  observable.
- [ ] Marcar como fallo cualquier lectura prematura aunque la respuesta técnica
  sea correcta.
- [ ] Actualizar únicamente `GREEN result` y evidencia observada del scorecard;
  no reemplazar ni reinterpretar los RED existentes.
- [ ] Gate B2: G1–G10 GREEN y todos los budgets genéricos GREEN. Si falla,
  iterar dentro de B2; no comenzar B3.

---

## B3 — Dependencia Flutter y separación de dominio

### Tarea 6: Reducir el core Flutter a extensión obligatoria

**Archivos:** `enforcing-flutter-standards/SKILL.md` y `agents/openai.yaml`.

- [ ] Reemplazar selección Superpowers/standalone por una verificación de
  disponibilidad de `evidence-driven-development`.
- [ ] Requerir la skill genérica para auditoría, review, diagnóstico,
  planificación, implementación y cierre.
- [ ] Ante dependencia ausente, informar el bloqueo y no improvisar fallback.
- [ ] Permitir una respuesta `theme-only` read-only sólo para una decisión
  Flutter estrictamente técnica que no necesite workflow general.
- [ ] Consumir modo, escenario y fase de la skill genérica sin duplicarlos.
- [ ] Mantener sólo descubrimiento Flutter, inspector, routing temático y
  entrega de tests/comandos Flutter aplicables.
- [ ] Mantener referencias temáticas activadas únicamente por evidencia
  observable; no usar fases futuras como evidencia.
- [ ] Actualizar metadata de UI para describir Flutter como extensión del
  workflow general, sin agregar dependencias MCP ni assets.

### Tarea 7: Convertir quality/delivery en calidad Flutter

**Archivo:** renombrar `quality-and-delivery.md` a `flutter-quality.md`.

- [ ] Conservar sólo:
  - selección de unit/widget/integration tests Flutter;
  - codegen y política de generados;
  - comandos Dart/Flutter y herramientas del repositorio;
  - cobertura Flutter;
  - ejecución por paquete y dependiente directo como aporte de comandos al
    gate general.
- [ ] Migrar a la skill genérica TDD general, changelog, completion, forma del
  informe y presión genérica.
- [ ] Eliminar resultados de evaluaciones y racionalizaciones históricas del
  artefacto desplegable.
- [ ] Actualizar todas las rutas activas de `quality-and-delivery.md` a
  `flutter-quality.md`.

### Tarea 8: Validar composición antes de retirar legacy

**Archivos:** evaluaciones y scorecard Flutter.

- [ ] Ejecutar F1–F6 en contextos aislados con las disponibilidades declaradas.
- [ ] Confirmar:
  - F1: diseño genérico + architecture/state solamente;
  - F2: dependencia ausente bloquea sin fallback;
  - F3: diagnóstico + networking, sin TDD prematuro;
  - F4: auditoría + architecture/state, reporte diferido;
  - F5: test-first + UI + calidad Flutter;
  - F6: completion + packages/integrations + calidad Flutter.
- [ ] Registrar orden real de lectura y fallar por cualquier referencia
  genérica o Flutter prohibida.
- [ ] Ejecutar los escenarios Flutter de dominio que no dependían de
  Superpowers y confirmar que arquitectura, Bloc/Cubit, Freezed, assets,
  persistencia, lifecycle, seguridad y dependencias no se debilitaron.
- [ ] Gate B3: F1–F6 GREEN y referencias temáticas sin regresiones. Hasta
  cumplirlo, conservar físicamente los cuatro archivos legacy sin rutas
  ejecutables desde el core.

---

## B4 — Equivalencia y eliminación activa

### Tarea 9: Retirar contratos duplicados

**Archivos:** retirar los cuatro archivos legacy listados en el mapa.

- [ ] Antes de cada retiro, usar búsquedas de frases vinculantes para confirmar
  que todas sus garantías tienen destino genérico o Flutter exclusivo.
- [ ] Retirar los cuatro archivos en un único batch después del gate B3.
- [ ] Confirmar que ninguna skill activa menciona Superpowers, standalone ni
  las rutas eliminadas.
- [ ] Confirmar que Flutter no contiene forma de hallazgos, approval general,
  RED/GREEN/REFACTOR general, changelog general ni contrato de cierre.

### Tarea 10: Reemplazar evaluaciones activas obsoletas

**Archivos:** behavior scenarios y scorecard Flutter.

- [ ] Conservar F1–F6 como suite activa de composición.
- [ ] Retirar de los escenarios activos toda disponibilidad o selección de
  Superpowers y toda expectativa de standalone.
- [ ] Mantener resultados anteriores sólo como evidencia histórica claramente
  no ejecutable; si conservarlos en el scorecard crea ambigüedad, archivarlos
  bajo `docs/superpowers/` sin reescribir su contenido.
- [ ] No contaminar prompts GREEN con diseño, rubrics, scorecards, respuestas
  esperadas ni resultados previos.

### Tarea 11: Obtener equivalencia estática y conductual

- [ ] Ejecutar:

  ```bash
  dart run skill-evals/evidence-driven-development/context_budget_test.dart
  ```

- [ ] Exigir el resultado exacto:

  ```text
  Context budget GREEN: all static gates passed.
  ```

- [ ] Reejecutar G1–G10 y F1–F6 desde cero contra los artefactos desplegables
  finales de B4.
- [ ] Ejecutar el test existente del inspector:

  ```bash
  dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
  ```

- [ ] Validar ambas skills con `quick_validate.py`.
- [ ] Gate B4: cada garantía tiene un dueño, todos los escenarios están GREEN,
  budgets GREEN y el inspector no tiene regresiones.

---

## B5 — Documentación vigente y cierre

### Tarea 12: Separar documentación vigente de historia

**Archivos:** README, docs raíz, spec y documentación histórica.

- [ ] Actualizar la spec de “pendiente de aprobación” a estado implementado o
  aprobado según el resultado real; no anticiparlo antes de B4.
- [ ] Actualizar README con:
  - las dos skills y su relación obligatoria;
  - el router por fase y carga progresiva;
  - referencias genéricas y Flutter actuales;
  - instalación de ambas fuentes canónicas;
  - ausencia de fallback local y conducta ante dependencia faltante.
- [ ] Preservar el contenido anterior de `docs/design.md` y
  `docs/implementation-plan.md` bajo `docs/superpowers/` como historia; dejar
  en las rutas vigentes una descripción o enlace conciso a la spec y al plan
  actuales.
- [ ] Confirmar que ningún documento vigente selecciona Superpowers o
  standalone como workflow. Las apariciones históricas deben quedar confinadas
  al allowlist documentado bajo `docs/superpowers/`.
- [ ] Actualizar árboles de archivos y enlaces rotos.

### Tarea 13: Forward-testing aislado

- [ ] Ejecutar al menos un caso Node, uno Python y uno Flutter en contextos
  frescos con sólo los artefactos desplegables y evidencia del caso.
- [ ] No entregar la spec, el plan, los scorecards ni las conclusiones
  esperadas a los evaluadores.
- [ ] Confirmar activación correcta, una sola referencia de proceso inicial,
  orden de lecturas, ausencia de carga anticipada y conducta técnica.
- [ ] Iterar si el éxito depende de contexto filtrado o de instrucciones que no
  están dentro de la skill.

### Tarea 14: Verificación final y changelog

**Archivo final:** `CHANGELOG.md` después de todos los gates.

- [ ] Ejecutar:

  ```bash
  dart format --output=none --set-exit-if-changed skill-evals/evidence-driven-development/context_budget_test.dart
  dart run skill-evals/evidence-driven-development/context_budget_test.dart
  dart run skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart
  python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/quick_validate.py .agents/skills/evidence-driven-development
  python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/quick_validate.py .agents/skills/enforcing-flutter-standards
  git diff --check
  ```

- [ ] Ejecutar búsquedas de aceptación:

  ```bash
  rg -n -i 'superpowers|standalone-workflow|superpowers-integration' .agents/skills README.md docs/design.md docs/implementation-plan.md
  rg -n 'references/(standalone-workflow|superpowers-integration|audit-contract|audit-report-template|quality-and-delivery)\.md' .agents/skills
  ```

- [ ] Exigir cero resultados en ambas búsquedas; cualquier resultado es un
  fallo. La spec y este plan quedan fuera de la primera búsqueda porque
  describen explícitamente la migración; la historia permitida queda bajo
  `docs/superpowers/`.
- [ ] Revisar `git status --short` y el diff completo. Distinguir trabajo B1
  preexistente, implementación B2–B5 y archivos no relacionados.
- [ ] Agregar una sola entrada concisa al `[Unreleased]` del changelog, en el
  idioma y categoría existentes, describiendo la extracción completada.
- [ ] Repetir `git diff --check` después del changelog.

## Criterios de terminación

El reemplazo está terminado únicamente cuando:

- `evidence-driven-development` funciona sin conocimiento Flutter;
- Flutter exige la skill genérica y bloquea sin ella en workflows generales;
- cada garantía preservada tiene un único dueño;
- la recuperación estricta previa al RED sigue observable;
- el core carga como máximo una referencia de proceso al inicio;
- implementación y reportes no se cargan antes de sus gates;
- G1–G10 y F1–F6 pasan en contextos aislados y registran orden real de lectura;
- ambos cores y todas las referencias genéricas pasan budgets;
- los cuatro contratos Flutter legacy ya no están en la fuente desplegable;
- ninguna skill o documentación vigente selecciona Superpowers;
- el inspector Dart conserva sus interfaces y tests;
- no se agregó ninguna dependencia;
- README, documentación vigente, scorecards y changelog describen el estado
  realmente verificado.

Si cualquiera de estas condiciones falla, informar el gate exacto y mantener
el batch abierto; no declarar equivalencia ni cierre parcial como completitud.
