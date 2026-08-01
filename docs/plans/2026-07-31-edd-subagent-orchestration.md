# Plan aislado B: orquestación segura de subagentes

**Plan:** Refinamiento de Evidence-Driven Development
**Batch:** B — Subagentes con coordinación segura
**Revisión aprobada:** 1
**Prerequisitos:** Batches P y A completos e integrados
**Orden recomendado:** ejecutar tercero
**Estado inicial:** aprobado para implementación

## Prompt para pegar en un chat nuevo

```text
Implementá únicamente el Batch B, revisión 1, descripto en:
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/docs/plans/2026-07-31-edd-subagent-orchestration.md

Leé el plan completo antes de actuar. Usá $skill-creator y
$evidence-driven-development. Confirmá primero que los Batches P y A ya están
integrados. Respetá AGENTS.md y preservá el working tree existente. No
rediseñes planificación ni baseline TDD, no hagas commit, push ni PR. Usá
subagentes sólo para los forward-tests autorizados por este plan, con contexto
mínimo y sin filtrarles la rúbrica. La revisión 1 ya está explícitamente
aprobada.
```

## Resultado para el usuario

La skill puede usar subagentes para líneas de trabajo realmente independientes
sin perder una única fase, un único alcance aprobado ni una verificación final
coordinada. El paralelismo es opcional; las mutaciones permanecen seriales salvo
que el aislamiento esté demostrado.

## Evidencia de entrada

- La skill vigente define una sola ruta secuencial y no contiene contrato de
  delegación.
- Las fases deben seguir siendo secuenciales porque diagnóstico, aprobación,
  implementación y verificación tienen gates dependientes.
- Investigación, hipótesis y gates independientes sí pueden distribuirse.
- En el entorno de agentes, un working tree puede ser compartido; mutaciones
  paralelas pueden colisionar aunque las tareas parezcan distintas.

## Criterios de aceptación

1. El coordinador conserva modo, escenario, fase, scope y aprobación.
2. La delegación sólo se activa cuando hay capacidad disponible y al menos dos
   líneas independientes con beneficio superior al costo de coordinación.
3. Cada tarea delegada declara propósito, acceso, scope, evidencia, dependencias,
   prohibiciones, stop conditions y forma de retorno.
4. Un subagente no puede ampliar alcance ni inferir aprobación.
5. Un subagente no puede redelegar salvo autorización explícita.
6. Inspecciones e hipótesis independientes pueden ejecutarse en paralelo.
7. Cada comportamiento implementado conserva su propio RED–GREEN–REFACTOR.
8. Las mutaciones paralelas requieren aislamiento comprobado: worktrees
   separados o límites disjuntos sin archivos, APIs, generados ni lockfiles
   compartidos.
9. Si el aislamiento no está demostrado, las mutaciones se serializan.
10. Resultados contradictorios se tratan como evidencia no resuelta.
11. Los resultados retornados se identifican como evidencia delegada.
12. El coordinador revisa el diff agregado y confirma los gates críticos.
13. Formato, codegen y otros gates mutantes se serializan.
14. Una integración posterior invalida los gates afectados.
15. Routing y presupuestos de contexto continúan pasando.

## Alcance de archivos

### Crear

- `.agents/skills/evidence-driven-development/references/delegation-and-concurrency.md`

### Modificar

- `.agents/skills/evidence-driven-development/SKILL.md`
- `.agents/skills/evidence-driven-development/references/design-and-approve.md`
- `.agents/skills/evidence-driven-development/references/verify-and-complete.md`
- `skill-evals/evidence-driven-development/context_budget_test.dart`
- `skill-evals/evidence-driven-development/behavior-scenarios.md`
- `skill-evals/evidence-driven-development/scorecard.md`, sólo después de
  evidencia nueva
- `CHANGELOG.md`

### No modificar

- La política de baseline TDD integrada por A.
- El contrato de revisión aprobada integrado por P, salvo agregar la topología
  de ejecución sin alterar sus garantías.
- Skills o referencias Flutter.
- Infraestructura externa, plugins, dependencias o límites fijos de cantidad de
  agentes.
- Documentación histórica.

## Contrato de delegación

La nueva referencia debe exigir para cada tarea:

```text
Task: stable identifier
Phase: current phase
Purpose: one bounded question or outcome
Access: read-only | mutation
Scope: exact files, symbols, systems or commands
Required evidence: reproducible facts and return artifacts
Dependencies: task identifiers or none
Prohibited actions: explicit boundaries
Stop conditions: conflicts, ambiguity or missing authority
Return: observations, commands/results, conflicts and missing evidence
```

El coordinador debe ser el único dueño de:

- route record;
- síntesis de causa raíz;
- plan y revisiones;
- interacción de aprobación;
- resolución de contradicciones;
- integración del diff;
- verificación final y reporte.

## Reglas por fase

- **Inspect:** paralelizar arquitectura, tests, configuración, dependencias y
  convenciones cuando los scopes sean independientes.
- **Diagnose:** distribuir discriminadores de hipótesis; ningún subagente
  declara por sí solo la causa raíz definitiva.
- **Design:** permitir evaluación read-only de alternativas o impacto; el
  coordinador produce un único plan revisado.
- **Approve:** sólo el coordinador registra aprobación del usuario.
- **Implement:** paralelizar mutaciones sólo con aislamiento demostrado; cada
  tarea conserva TDD y revisión aprobada.
- **Verify:** distribuir gates no mutantes e independientes; serializar gates
  que escriben; revisar el diff agregado y repetir gates invalidados.
- **Report:** sintetizar únicamente desde el coordinador.

## Topología en los planes

Agregar al contrato de batch aprobado:

```text
Execution topology:
  coordinator: owner
  delegated tasks: identifiers or none
  isolation: evidence or serial
  integration order: ordered task identifiers
  final verification owner: coordinator
```

Mantener este bloque corto y no duplicar el contrato completo de la nueva
referencia dentro de `design-and-approve.md`.

## Matriz de evaluación

| Escenario | Conducta esperada |
|---|---|
| Tres inspecciones independientes | Delegación read-only y síntesis única |
| Dos hipótesis contradictorias | Estado no resuelto y nuevo discriminador |
| Batches en worktrees aislados | Mutación paralela permitida dentro del scope |
| Batches en working tree compartido | Mutación serial o rechazo del paralelismo |
| Lockfile/generado compartido | No paralelizar mutaciones |
| Gates no mutantes independientes | Distribución permitida con procedencia |
| Formato o codegen | Ejecución serial y revisión posterior del diff |
| Cambio tras verificación delegada | Invalidar y repetir gate afectado |

## Secuencia test-first

1. Confirmar la presencia de P y A y revisar el diff preexistente.
2. Agregar escenarios de la matriz y observar fallos de la skill vigente.
3. Crear `delegation-and-concurrency.md` con responsabilidades y límites.
4. Agregar routing condicional mínimo a `SKILL.md`.
5. Incorporar `Execution topology` al contrato de planificación.
6. Incorporar procedencia, serialización e invalidación a verificación.
7. Actualizar el inventario de referencias del budget test.
8. Ejecutar budget y validación estructural.
9. Forward-testear escenarios con subagentes en contextos frescos y sin rúbrica.
10. Iterar hasta que routing y conducta sean GREEN.
11. Actualizar scorecard y changelog con evidencia observada.
12. Revisar el diff agregado y confirmar que A y P no fueron debilitados.

## Verificación

```bash
dart run skill-evals/evidence-driven-development/context_budget_test.dart
python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/quick_validate.py .agents/skills/evidence-driven-development
git diff --check
```

Para forward-testing:

- iniciar contextos independientes;
- pasar la skill y un pedido realista, no una consigna de evaluación;
- no revelar sospechas, solución deseada ni rúbrica;
- capturar tareas delegadas, scopes, archivos leídos, resultados y síntesis;
- limpiar artefactos temporales antes de la siguiente corrida;
- considerar fallo cualquier paralelismo mutante sin aislamiento demostrado.

## Stop conditions

Detenerse y reportar si:

- la API de agentes disponible no permite imponer el contrato diseñado;
- la delegación requiere duplicar contratos de otras fases;
- el router necesita cargar referencias futuras prematuramente;
- el paralelismo pone en riesgo cambios del usuario;
- los presupuestos requieren retirar garantías existentes;
- un forward-test sólo pasa cuando recibe contexto filtrado.

## Handoff requerido

Entregar:

- cuándo y por qué se delega;
- contrato final de coordinador y subagentes;
- evidencia de rechazo de concurrencia insegura;
- resultados de forward-tests y presupuestos;
- archivos modificados, comandos y exit status;
- changelog y revisión final del diff.
