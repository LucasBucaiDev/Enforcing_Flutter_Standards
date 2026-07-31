# Diseño vigente

La arquitectura vigente está definida en
[`specs/2026-07-31-evidence-driven-development-design.md`](specs/2026-07-31-evidence-driven-development-design.md).

`evidence-driven-development` posee el workflow general y carga una sola
referencia de proceso por fase. `enforcing-flutter-standards` es una extensión
obligatoriamente compuesta que aporta únicamente evidencia, decisiones, tests
y comandos Flutter/Dart. Si falta la skill general, el workflow Flutter se
bloquea sin fallback.

El diseño original de la skill Flutter se conserva en el archivo histórico no
ejecutable del repositorio.
