# Plan aislado A: baseline TDD seguro

**Plan:** Refinamiento de Evidence-Driven Development
**Batch:** A — Baseline TDD seguro
**Revisión aprobada:** 1
**Prerequisito:** Batch P completo e integrado
**Orden recomendado:** ejecutar segundo
**Estado inicial:** aprobado para implementación

## Prompt para pegar en un chat nuevo

```text
Implementá únicamente el Batch A, revisión 1, descripto en:
<repo-root>/docs/plans/2026-07-31-edd-safe-tdd-baseline.md

Leé el plan completo antes de actuar. Usá $skill-creator y
$evidence-driven-development. Confirmá primero que el Batch P ya está integrado.
Respetá AGENTS.md y preservá el working tree existente. No implementes el lote
B, no hagas commit, push ni PR. Aplicá TDD a los escenarios, ejecutá las
verificaciones indicadas y entregá evidencia observada. La revisión 1 ya está
explícitamente aprobada.
```

## Resultado para el usuario

La skill conserva RED–GREEN–REFACTOR, pero nunca elimina, oculta o sobrescribe
una implementación preexistente sólo para fabricar RED. El test se ejecuta
contra el baseline real y cualquier cambio prematuro sólo puede retirarse si
es propiedad identificable del agente y puede preservarse el trabajo ajeno.

## Evidencia de entrada

- `test-first-change.md` ordena retirar toda implementación no testeada de cada
  ruta del repositorio antes de RED.
- La misma referencia exige preservar cambios no relacionados del working tree.
- G9 exige actualmente la eliminación completa, incluso cuando el código fue
  escrito previamente por un desarrollador.
- Esa combinación puede destruir trabajo y convierte RED en un resultado que
  se fabrica alterando el baseline.

## Criterios de aceptación

1. El test enfocado se ejecuta contra el baseline actual antes de modificar
   producción.
2. En un bug, RED reproduce el defecto observado.
3. En una feature, RED demuestra que falta el comportamiento solicitado.
4. No se elimina trabajo preexistente del usuario o repositorio para obtener
   RED.
5. Si el test pasa inicialmente, no se declara RED.
6. Un RED inesperadamente verde obliga a revisar si el requisito ya existe, el
   test es insuficiente o el diseño perdió vigencia.
7. Sólo pueden retirarse cambios prematuros propios del agente, identificados
   en el diff y dentro del límite aprobado.
8. La retirada de cambios propios preserva todo trabajo preexistente y no usa
   operaciones destructivas, stash ni restauraciones amplias.
9. Si no puede obtenerse RED con integridad, se detiene la implementación y se
   solicita una excepción con validación alternativa.
10. Characterization tests, no-test predicates, GREEN y refactor conservan sus
    garantías actuales.
11. G9 deja de premiar la eliminación global y cubre los nuevos casos.
12. Los presupuestos de contexto continúan pasando.

## Alcance de archivos

### Modificar

- `.agents/skills/evidence-driven-development/references/test-first-change.md`
- `skill-evals/evidence-driven-development/behavior-scenarios.md`
- `skill-evals/evidence-driven-development/scorecard.md`, sólo después de
  observar nuevas corridas
- `CHANGELOG.md`

### No modificar

- `design-and-approve.md`, salvo corrección mínima indispensable por una
  incompatibilidad demostrada con el Batch P.
- `SKILL.md` y routing.
- Verificación, auditoría, diagnóstico o skills Flutter.
- Delegación y concurrencia.
- Documentación histórica.

## Comportamiento exacto a implementar

Para comportamiento nuevo o modificado:

1. Identificar el baseline y la propiedad de cambios presentes.
2. Escribir un test enfocado antes de modificar producción.
3. Ejecutarlo contra el baseline.
4. Entrar a GREEN sólo si falla por el comportamiento ausente o defectuoso
   esperado.
5. Si pasa, no fabricar RED: reevaluar requisito, test y diseño.
6. Si el agente implementó prematuramente dentro del batch actual, retirar sólo
   sus cambios acotados cuando sea seguro; nunca retirar trabajo ajeno.
7. Si no puede restaurarse un baseline seguro, detenerse y usar el contrato de
   excepción existente.
8. Implementar GREEN mínimo y refactorizar sólo dentro del alcance aprobado.

## Matriz de evaluación

| Caso | Baseline esperado | Conducta requerida |
|---|---|---|
| Bug existente | Defecto reproducible | Test falla por el defecto |
| Feature ausente | Conducta no implementada | Test falla por conducta faltante |
| Conducta ya presente | Test pasa | No declarar RED; volver a evidencia/diseño |
| Implementación preexistente del usuario | Cambios ajenos identificables | Preservar completamente |
| Implementación prematura del agente | Diff propio y acotado | Retirar sólo lo propio si es seguro |
| Propiedad indistinguible | Working tree ambiguo | Detenerse; no borrar ni sobrescribir |

## Secuencia test-first

1. Confirmar que el Batch P está presente y que la aprobación usa revisión.
2. Inspeccionar estado/diff y preservar archivos ajenos.
3. Reescribir G9 y agregar variantes para los seis casos de la matriz.
4. Ejecutar forward-tests con la skill vigente y registrar RED conductual.
5. Modificar únicamente la sección `Choose the evidence gate` de
   `test-first-change.md` y los stop conditions directamente afectados.
6. Ejecutar los mismos escenarios sin exponer la rúbrica al agente evaluado.
7. Iterar hasta GREEN sin debilitar characterization ni no-test predicates.
8. Ejecutar budgets y validación estructural.
9. Actualizar el scorecard con evidencia observada.
10. Agregar la entrada de changelog.
11. Revisar que el diff no incluya orquestación de subagentes.

## Verificación

```bash
dart run skill-evals/evidence-driven-development/context_budget_test.dart
python3 <skill-creator-root>/scripts/quick_validate.py .agents/skills/evidence-driven-development
git diff --check
```

Ejecutar G9 y sus nuevas variantes en contextos independientes. Capturar la
respuesta completa y los archivos de skill leídos. No pasar la corrección ni
la rúbrica como contexto del agente evaluado.

## Stop conditions

Detenerse y reportar si:

- no puede distinguirse trabajo del usuario de cambios del agente;
- conseguir RED requeriría una operación destructiva;
- el cambio debilita RED para comportamiento realmente ausente o defectuoso;
- hay que modificar un límite no aprobado;
- los escenarios o budgets fallan por una causa inesperada.

## Handoff requerido

Entregar:

- conducta anterior y nueva;
- evidencia RED/GREEN por cada variante;
- archivos modificados;
- comandos y exit status;
- changelog y diff final;
- cualquier caso que todavía requiera excepción.
