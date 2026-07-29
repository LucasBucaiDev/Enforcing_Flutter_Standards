# Diseño de optimización de contexto de la skill

**Estado:** aprobado conceptualmente y pendiente de revisión escrita el 29 de
julio de 2026.

## Objetivo

Reducir el contexto que consume `enforcing-flutter-standards` al combinarse con
Superpowers sin debilitar sus decisiones Flutter, gates de aprobación,
contratos de auditoría, TDD, seguridad ni verificación.

La optimización debe beneficiar tanto la ventana de contexto como el costo de
procesamiento, pero esta fase no implementará telemetría, seguimiento histórico
de gasto, dashboards ni integración con APIs de facturación.

## Problema actual

`SKILL.md` obliga a leer `references/engineering-standards.md` en toda
activación. Esa referencia contiene 6.817 palabras y reglas de veinte áreas,
aunque una tarea concreta normalmente necesita solo algunas.

Además, parte del proceso general de descubrimiento, aprobación, TDD y
verificación aparece tanto en la skill Flutter como en Superpowers y en el
workflow standalone. Cuando el contexto conserva todos esos documentos, una
feature puede empezar con decenas de miles de tokens de instrucciones antes de
leer el proyecto.

El inspector también puede producir inventarios completos cuando el agente
solo necesita una vista inicial para decidir qué evidencia ampliar.

## Alcance

### Incluido

- compactar `SKILL.md` para conservar únicamente gates universales, selección
  de modo y enrutamiento;
- reemplazar la referencia monolítica por referencias temáticas pequeñas;
- cargar referencias desde condiciones observables del proyecto o de la tarea;
- eliminar duplicaciones entre la skill Flutter, Superpowers y el workflow
  standalone;
- mantener el workflow standalone disponible solo cuando falte una composición
  aplicable de Superpowers;
- separar el contrato mínimo de auditoría de sus plantillas y ejemplos;
- agregar al inspector una salida resumida y selección de secciones sin romper
  sus formatos existentes;
- actualizar documentación, evaluaciones y changelog afectados;
- comparar el tamaño estático antes y después como validación puntual.

### Excluido

- GraphRAG, RAG, embeddings, bases vectoriales o grafos externos;
- dependencias nuevas;
- modificación o fork de Superpowers;
- almacenamiento de métricas, tendencias o costos;
- instrumentación de sesiones reales;
- prompt caching o cambios de modelo;
- instalación global, publicación o marketplace;
- cambios en los estándares técnicos que no sean necesarios para eliminar
  duplicación o permitir carga selectiva.

## Arquitectura propuesta

La activación seguirá esta secuencia:

```text
metadata
→ SKILL.md compacto
→ seleccionar modo
→ descubrir Superpowers disponible
→ cargar un único workflow general
→ ejecutar inspección resumida
→ clasificar temas desde evidencia observable
→ cargar solo referencias Flutter aplicables
→ ampliar inspector o referencias cuando la evidencia lo requiera
```

`SKILL.md` no cargará una referencia universal adicional. Sus gates
universales serán suficientes para preservar los límites de auditoría,
aprobación, secretos, dependencias, assets exactos y verificación mientras se
seleccionan las referencias temáticas.

## Referencias temáticas

El contenido canónico de `engineering-standards.md` se distribuirá sin
duplicación:

| Referencia | Responsabilidad | Condiciones de carga |
|---|---|---|
| `architecture-and-state.md` | arquitectura, dominio, Cubit/Bloc, Freezed, barrels y responsabilidad de archivos | cambios de estructura, modelos, estado, imports o archivos grandes |
| `packages-and-integrations.md` | paquetes locales, dirección de dependencias, SDKs, lifecycle y aprobación de dependencias | manifests, packages, plugins, SDKs o recursos con ownership |
| `networking-and-errors.md` | clientes HTTP, DTOs, excepciones, failures y resultados tipados | networking, APIs, mappers o manejo de errores |
| `persistence.md` | preferencias, secretos locales, Hive, Drift y ObjectBox | almacenamiento, caché offline, migraciones o queries |
| `navigation.md` | Navigator, routing, deep links y redirects | rutas, navegación o estado de URL |
| `security-and-environments.md` | observabilidad, redacción, secrets, flavors y configuración | logging, crash reporting, secretos, configuración o ambientes |
| `quality-and-delivery.md` | TDD Flutter específico, cobertura, changelog y matriz de verificación | implementación, refactor, tests, cierre o entrega |

`ui-implementation.md` continuará como contrato temático independiente.
`audit-contract.md` conservará alcance, severidades, campos obligatorios y
aprobación. Las plantillas y ejemplos extensos pasarán a
`audit-report-template.md`, que se cargará únicamente al preparar el informe.

Todas las referencias estarán a un solo nivel desde `SKILL.md`. Una referencia
temática no obligará a leer otra referencia temática.

## Composición con Superpowers

La skill Flutter tratará Superpowers como dueño del proceso general:

- brainstorming y diseño;
- planificación;
- debugging sistemático;
- ciclo TDD general;
- revisión y verificación general.

Las referencias Flutter conservarán solamente decisiones que Superpowers no
puede aportar, como semántica Cubit/Bloc, Freezed, dirección de paquetes,
persistencia, assets y verificación de paquetes Flutter.

Cuando exista la composición aplicable, no se cargará
`standalone-workflow.md`. Cuando falte una skill requerida de esa composición,
se cargará el workflow standalone completo y no se intentará reproducir
parcialmente ambos procesos.

## Inspector progresivo

El inspector conservará `--format text` y `--format json`. Se agregarán:

- una vista `summary` pequeña para el descubrimiento inicial;
- selección explícita de secciones para ampliar solo packages, files, tests,
  commands u otra evidencia soportada;
- errores accionables para secciones desconocidas o combinaciones inválidas;
- orden determinista y contrato read-only en todas las variantes.

No se truncará silenciosamente información. La salida resumida indicará qué
secciones adicionales están disponibles y cómo solicitarlas.

## Manejo de ambigüedad

Si una tarea no permite identificar un tema con seguridad, el agente realizará
primero descubrimiento resumido. Cargará una referencia solo cuando la
solicitud, el diff, un manifest, un import, una configuración o la salida del
inspector aporte el predicado correspondiente.

Una auditoría amplia podrá terminar cargando varias referencias, pero lo hará
después de descubrir evidencia y no como costo inicial obligatorio. La ausencia
de evidencia no autoriza omitir un gate universal ni inventar una decisión.

## Validación

La optimización de documentación seguirá evaluación test-first:

1. agregar escenarios que demuestren la carga excesiva o no selectiva actual;
2. observar el fallo antes de modificar la skill;
3. aplicar la separación mínima;
4. verificar selección correcta de referencias;
5. repetir los escenarios de comportamiento existentes para confirmar que los
   gates críticos continúan cumpliéndose.

La evolución del inspector seguirá RED/GREEN con
`inspect_flutter_project_test.dart`. También se ejecutarán:

- validación estructural de la skill;
- comprobación de referencias y rutas;
- conteo puntual de palabras, caracteres y estimación de tokens antes/después;
- pruebas completas del inspector;
- revisión del diff;
- `git diff --check`.

La medición puntual pertenece a la verificación de esta implementación. No se
creará un sistema permanente de métricas.

## Criterios de aceptación

- ninguna activación obliga a leer todas las áreas de ingeniería;
- `SKILL.md` queda claramente por debajo de su tamaño actual y dentro de la
  recomendación de 5.000 tokens;
- una tarea enfocada carga únicamente su workflow general y las referencias
  Flutter aplicables;
- Superpowers y el workflow standalone son mutuamente excluyentes;
- las reglas existentes tienen una única fuente canónica;
- los escenarios de comportamiento actuales no sufren regresiones;
- el inspector permite descubrimiento resumido y expansión selectiva;
- los formatos `text` y `json` existentes siguen siendo compatibles;
- no se agregan dependencias, telemetría ni infraestructura;
- README y changelog describen la estructura resultante sin afirmar métricas
  operativas inexistentes.

## Archivos previstos

### Modificar

- `.agents/skills/enforcing-flutter-standards/SKILL.md`
- `.agents/skills/enforcing-flutter-standards/references/audit-contract.md`
- `.agents/skills/enforcing-flutter-standards/references/standalone-workflow.md`
- `.agents/skills/enforcing-flutter-standards/references/superpowers-integration.md`
- `.agents/skills/enforcing-flutter-standards/references/ui-implementation.md`
- `.agents/skills/enforcing-flutter-standards/scripts/inspect_flutter_project.dart`
- `skill-evals/enforcing-flutter-standards/behavior-scenarios.md`
- `skill-evals/enforcing-flutter-standards/scorecard.md`
- `skill-evals/enforcing-flutter-standards/inspect_flutter_project_test.dart`
- `README.md`
- `CHANGELOG.md`

### Crear

- las siete referencias temáticas descritas anteriormente;
- `.agents/skills/enforcing-flutter-standards/references/audit-report-template.md`

### Retirar después de migrar y validar su contenido

- `.agents/skills/enforcing-flutter-standards/references/engineering-standards.md`

La implementación deberá conservar cambios no relacionados existentes y
limitar cada commit o batch a una unidad revisable.
