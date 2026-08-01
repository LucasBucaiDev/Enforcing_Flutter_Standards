# Plan aislado P: planificación aprobable

**Plan:** Refinamiento de Evidence-Driven Development
**Batch:** P — Planificación aprobable
**Revisión aprobada:** 1
**Orden recomendado:** ejecutar primero
**Estado inicial:** aprobado para implementación

## Prompt para pegar en un chat nuevo

```text
Implementá únicamente el Batch P, revisión 1, descripto en:
/Users/lucasbuc/personal_app/Enforcing_Flutter_Standards/docs/plans/2026-07-31-edd-approvable-planning.md

Leé el plan completo antes de actuar. Usá $skill-creator y
$evidence-driven-development. Respetá AGENTS.md y el working tree existente.
No implementes los lotes A ni B, no hagas commit, push ni PR. Aplicá TDD a los
escenarios de evaluación, ejecutá las verificaciones indicadas y entregá
resultados observados. La revisión 1 ya está explícitamente aprobada.
```

## Resultado para el usuario

Antes de aprobar cualquier implementación, el usuario recibe un plan que deja
inequívocos el resultado observable, los cambios por archivo, la secuencia, la
evidencia de tests, los riesgos y el trabajo excluido. La aprobación queda
ligada al nombre y revisión exactos; un cambio material exige una revisión y
una aprobación nuevas.

## Evidencia de entrada

- `design-and-approve.md` exige batches, pero permite completar `Outcome and
  exact scope` con una frase abstracta.
- La implementación sólo registra aprobación por nombre de batch.
- G2 comprueba diseño de una feature, pero no rechaza expresamente un plan que
  omita criterios de aceptación, mapa por archivo o revisión.
- El repositorio tiene cambios ajenos; deben preservarse.

## Criterios de aceptación

1. Cada batch incluye un identificador de revisión inmutable.
2. Expresa el objetivo observable desde la perspectiva del usuario.
3. Enumera criterios de aceptación verificables.
4. Incluye un mapa de implementación por archivo, límite o símbolo conocido.
5. Explica el orden de ejecución y las dependencias entre pasos.
6. Relaciona cada comportamiento con RED/GREEN, caracterización o un predicado
   exacto de no-test.
7. Declara gates, riesgos, recuperación, aprobaciones separadas y exclusiones.
8. Una incógnita material impide solicitar aprobación.
9. La aprobación se registra como `Batch + Plan revision`.
10. Un cambio material incrementa la revisión e invalida la aprobación previa.
11. La fase de implementación exige la revisión aprobada y no puede ampliar el
    mapa de mutación.
12. Los presupuestos de contexto de la skill continúan pasando.

## Alcance de archivos

### Modificar

- `.agents/skills/evidence-driven-development/references/design-and-approve.md`
- `.agents/skills/evidence-driven-development/references/test-first-change.md`
- `skill-evals/evidence-driven-development/behavior-scenarios.md`
- `skill-evals/evidence-driven-development/context_budget_test.dart`, sólo si
  hace falta un gate estático para el nuevo contrato
- `skill-evals/evidence-driven-development/scorecard.md`, sólo después de
  obtener evidencia nueva
- `CHANGELOG.md`

### No modificar

- El router general salvo que evidencia ejecutada demuestre que el gate no
  puede imponerse desde las referencias actuales.
- Reglas de diagnóstico, auditoría, verificación o Flutter.
- La política de baseline TDD; pertenece al lote A.
- Delegación y concurrencia; pertenecen al lote B.
- Documentos históricos bajo `docs/superpowers/`.

## Contrato que debe implementar

Reemplazar el esquema de batch por uno equivalente y conciso que exija:

```text
Batch: stable name
Plan revision: immutable identifier
User-visible objective: observable result
Current evidence: facts supporting the design
Observable acceptance criteria: numbered completion predicates
Implementation map: location/symbol, exact change, reason
Execution sequence: ordered steps and dependencies
Test matrix: behavior, test, baseline, RED/GREEN or no-test predicate
Verification: project gates and direct dependents
Risks and recovery: concrete risk and safe response
Separate decisions/approvals: or none
Excluded/future debt: explicit boundary
Changelog: canonical entry/category or disposition
```

Definir como cambio material cualquier modificación del objetivo, criterios,
límites, secuencia, estrategia de pruebas, dependencias, riesgos o exclusiones.
Los detalles no materiales pueden aclararse sin ampliar el límite aprobado.

## Secuencia test-first

1. Inspeccionar el estado y diff actual; identificar trabajo preexistente.
2. Agregar o reforzar escenarios que fallen porque el contrato vigente acepta:
   - un batch abstracto sin criterios verificables;
   - aprobación sólo por nombre;
   - mutación material posterior sin nueva revisión.
3. Registrar el RED real de esos escenarios sin modificar la skill para
   fabricar el fallo.
4. Actualizar `design-and-approve.md` con el contrato mínimo que los satisface.
5. Actualizar `test-first-change.md` para requerir batch y revisión aprobados.
6. Ejecutar nuevamente los escenarios y observar GREEN.
7. Revisar budgets; condensar lenguaje antes de elevar límites.
8. Actualizar el scorecard sólo con resultados efectivamente observados.
9. Agregar una entrada concisa bajo `CHANGELOG.md` → `Unreleased`.
10. Revisar el diff completo y confirmar que no contiene cambios de A o B.

## Verificación

Ejecutar y reportar comando, exit status y resultado:

```bash
dart run skill-evals/evidence-driven-development/context_budget_test.dart
python3 /Users/lucasbuc/.codex/skills/.system/skill-creator/scripts/quick_validate.py .agents/skills/evidence-driven-development
git diff --check
```

Ejecutar además los escenarios modificados en contextos limpios. No actualizar
el scorecard con resultados inferidos o con corridas que hayan recibido la
respuesta esperada como contexto.

## Stop conditions

Detenerse y reportar si:

- el contrato no cabe dentro de los presupuestos sin retirar otra garantía;
- una incógnita cambia materialmente el comportamiento aprobado;
- hace falta modificar archivos de los lotes A o B más allá de los límites
  compartidos descritos;
- un cambio ajeno impide aislar el diff;
- una evaluación falla por una razón distinta de la esperada.

## Handoff requerido

Entregar:

- resultado completo, parcial o bloqueado;
- archivos y secciones modificados;
- RED y GREEN realmente observados;
- comandos con exit status;
- revisión del diff y changelog;
- cualquier desviación respecto de la revisión 1.
