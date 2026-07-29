# Diseño del README público

**Estado:** aprobado para documentación el 29 de julio de 2026.

## Objetivo

Crear un `README.md` público para GitHub que explique, con una presentación
visual-profesional, qué problema resuelve Enforcing Flutter Standards, cómo
funciona la skill, qué responsabilidades tiene cada archivo y cómo se ejecutan
el inspector Dart y sus pruebas.

El documento debe permitir que una persona que llega por primera vez al
repositorio entienda su propósito, evalúe rápidamente su alcance y encuentre
los comandos necesarios para empezar.

## Audiencia y tono

- Desarrolladores Flutter y Dart.
- Equipos que trabajan con agentes de programación.
- Personas interesadas en crear o evaluar Agent Skills.
- Español claro, cercano y técnicamente preciso.
- Emojis, badges, tablas y diagramas usados como ayudas visuales, sin saturar
  el documento ni reemplazar explicaciones importantes.

## Estructura

1. Hero con el nombre, una propuesta de valor breve y badges estáticos.
2. Resumen del problema que resuelve la skill.
3. Flujo visual:
   `descubrir → delimitar → auditar → aprobar → implementar → verificar`.
4. Modos de operación: auditoría, implementación y revisión.
5. Estándares cubiertos: arquitectura, estado, Freezed, límites de paquetes,
   integraciones, persistencia, UI, TDD, seguridad y verificación.
6. Anatomía de la skill:
   - `SKILL.md`;
   - metadata de Codex;
   - las cinco referencias operativas.
7. Sección “Dart bajo el capó”:
   - `inspect_flutter_project.dart`;
   - `inspect_flutter_project_test.dart`;
   - inventario producido y garantías de solo lectura.
8. Instalación y uso de la skill.
9. Ejemplos para ejecutar el inspector en formatos texto y JSON.
10. Evaluaciones de comportamiento y escenarios de presión.
11. Árbol resumido del repositorio.
12. Enlaces a diseño, plan de implementación y changelog.

## Presentación visual

- Título con el emoji de escudo para reforzar la idea de estándares.
- Badges informativos que no dependan de métricas inexistentes.
- Un diagrama Mermaid pequeño para el flujo principal.
- Tablas para comparar modos, referencias y archivos Dart.
- Bloques de código copiables para instalación y ejecución.
- Emojis únicamente en encabezados principales o llamadas breves.

No se crearán logos, capturas ni imágenes externas. Tampoco se afirmará que
existen releases, cobertura publicada, licencia o compatibilidad verificada
cuando el repositorio no aporta esa evidencia.

## Contenido técnico

El README distinguirá claramente:

- la skill desplegable bajo
  `.agents/skills/enforcing-flutter-standards/`;
- el inspector, que produce evidencia mecánica y no emite un veredicto
  arquitectónico;
- la suite de pruebas autocontenida;
- los artefactos de evaluación de comportamiento, que validan las respuestas
  de la skill ante escenarios normales y presión de entrega.

La documentación de los archivos Dart se basará en su implementación actual:
descubrimiento de raíces Flutter, dependencias locales y ciclos, archivos
grandes, barrels, capas de features, tests, changelogs, configuración de
análisis y fuentes de comandos del proyecto.

## Límites

- Crear `README.md` en la raíz.
- No modificar la skill, las referencias, los scripts Dart ni las evaluaciones.
- No agregar dependencias ni automatizaciones.
- No instalar ni publicar la skill.
- No crear o inferir una licencia.

## Validación

Como se trata exclusivamente de documentación sin lógica, no aplica un ciclo
RED/GREEN. La validación consistirá en:

1. comprobar que todos los enlaces y rutas locales existen;
2. ejecutar los comandos documentados del inspector y de su suite;
3. revisar la sintaxis Markdown y Mermaid;
4. ejecutar `git diff --check`;
5. revisar el diff completo para detectar afirmaciones sin evidencia.
