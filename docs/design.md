# Estándares de ingeniería Flutter para agentes

**Estado:** diseño aprobado y cerrado para implementación el 29 de julio de
2026.

## Objetivo

Crear una Agent Skill opinionada, portable y autosuficiente que permita a un
agente de desarrollo:

- crear features Flutter nuevas;
- refactorizar features existentes;
- auditar arquitectura, modularidad y calidad;
- revisar diffs, commits y pull requests;
- crear o extraer paquetes locales;
- migrar modelos y estados a Freezed.

La skill debe detectar problemas y presentar evidencia antes de sugerir
cambios. La implementación comienza únicamente después de una aprobación
explícita y sigue TDD estricto.

## Portabilidad y distribución

El núcleo seguirá la especificación abierta Agent Skills y podrá ser consumido
por cualquier agente compatible con `SKILL.md`. Un LLM sin acceso al sistema de
archivos o a comandos podrá interpretar las reglas, pero no ejecutar una
auditoría ni una implementación completas.

La fuente canónica inicial vivirá versionada en:

```text
.agents/skills/enforcing-flutter-standards/
```

La carpeta podrá copiarse o instalarse en la ubicación global que utilice cada
cliente. En esta computadora también se habilitará para Codex y se incluirá
`agents/openai.yaml` como metadata opcional de interfaz. El núcleo no dependerá
de ese archivo ni de herramientas exclusivas de OpenAI.

Las instrucciones se escribirán en inglés para maximizar portabilidad. Los
informes y preguntas se producirán en el idioma del usuario.

## Componentes

```text
enforcing-flutter-standards/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── engineering-standards.md
│   ├── audit-contract.md
│   ├── ui-implementation.md
│   ├── standalone-workflow.md
│   └── superpowers-integration.md
└── scripts/
    └── inspect_flutter_project.dart
```

### `SKILL.md`

Contendrá solamente los disparadores, el flujo principal, la selección de
referencias y las reglas que no pueden omitirse. Evitará duplicar el contenido
detallado de las referencias y permanecerá por debajo de 500 líneas.

### Referencias

- `engineering-standards.md`: arquitectura, estado, Freezed, paquetes,
  imports, errores, navegación, testing y excepciones.
- `audit-contract.md`: severidades, evidencia y forma obligatoria del informe.
- `ui-implementation.md`: contrato específico para construir y validar UI.
- `standalone-workflow.md`: proceso completo cuando Superpowers no esté
  disponible.
- `superpowers-integration.md`: selección y orden de skills de Superpowers
  cuando el entorno las ofrezca.

### Inspección automatizada

`inspect_flutter_project.dart` será un script Dart autocontenido y de solo
lectura. Reunirá evidencia mecánica sin emitir juicios arquitectónicos:

- raíces Flutter y paquetes locales;
- dependencias relevantes declaradas, dirección del grafo y ciclos;
- archivos Dart no generados que superen umbrales de tamaño;
- barrels existentes;
- estructura de features y capas;
- tests y changelogs detectados;
- configuración de análisis y comandos de proyecto detectables.

Ignorará `build/`, `.dart_tool/`, archivos generados por Freezed, serialización
y localización. Sus resultados serán insumos para el agente, no una sentencia
automática.

## Descubrimiento del proyecto

Antes de auditar o proponer una solución, la skill inspeccionará:

- instrucciones del repositorio y directorios aplicables;
- `pubspec.yaml` y lockfiles;
- `analysis_options.yaml`;
- documentación y arquitectura existente;
- estructura de `lib/`, `test/` y `packages/`;
- CI, scripts, Makefiles y comandos de validación;
- changelogs y políticas de versionado;
- diff y commits relevantes;
- convenciones de código, assets y archivos generados.

Si el usuario no define otro alcance, la auditoría se limitará a los archivos
modificados y sus dependencias directas. Una auditoría integral requerirá una
solicitud explícita.

No será obligatorio crear un archivo de configuración por proyecto. Un
`AGENTS.md` local podrá declarar comandos, umbrales o excepciones persistentes.
Si no existe, se aplicarán los estándares globales y el contexto descubierto.

## Modelo de reglas

Las reglas se clasificarán en tres categorías:

### Obligatorias

Su incumplimiento genera un hallazgo salvo una excepción explícita ya acordada:

- TDD para cambios de comportamiento;
- Freezed para modelos y estados que representen datos o variantes;
- modularidad por responsabilidad;
- APIs públicas mediante barrels;
- límites de paquetes sin ciclos;
- ausencia de secretos versionados o expuestos en logs;
- verificación con evidencia reciente;
- aprobación antes de implementar propuestas surgidas de una auditoría.

### Condicionales

Se aplicarán cuando exista evidencia observable:

- Cubit o Bloc según la semántica del flujo;
- extracción de paquetes locales;
- wrappers de integraciones externas;
- `go_router`;
- `fpdart`;
- división de archivos por tamaño y responsabilidad.

### Específicas del proyecto

Se descubrirán o declararán localmente:

- comandos de formato, análisis, tests y build;
- umbral de cobertura;
- política de versionado de archivos generados;
- flavors y plataformas;
- convenciones de assets y navegación ya establecidas.

Una excepción siempre deberá nombrar la regla, mostrar evidencia, explicar el
motivo técnico y describir su impacto. El agente no podrá omitir reglas
silenciosamente.

## Flujo de auditoría e implementación

El flujo principal será:

```text
descubrir contexto
→ delimitar alcance
→ auditar sin modificar
→ informar hallazgos
→ proponer cambios pequeños
→ esperar aprobación
→ implementar con TDD
→ verificar
```

Durante la auditoría no se modificarán archivos. El agente entregará evidencia
y separará los problemas necesarios para el cambio actual de la deuda futura.
La propuesta se dividirá en bloques pequeños y revisables.

La implementación afectará únicamente los bloques aprobados. Las mejoras
incidentales se limitarán a los archivos tocados; una modernización amplia
requerirá autorización específica.

## Integración con Superpowers

Superpowers será una integración opcional, no una dependencia. Superpowers
define procesos generales de ingeniería; esta skill define estándares y
decisiones específicas de Flutter.

Cuando esté disponible, se compondrán de esta manera:

| Escenario | Proceso de Superpowers | Responsabilidad Flutter |
|---|---|---|
| Feature nueva | brainstorming, writing-plans, TDD, verification | Arquitectura, estado, UI y paquetes |
| Refactor | brainstorming, planning y TDD | Límites, barrels, tamaño y compatibilidad |
| Bug | systematic-debugging, TDD y verification | Estados, failures y lifecycle |
| Auditoría | Sin proceso creativo obligatorio | Checklist y contrato de hallazgos |
| Feedback | receiving-code-review y TDD | Evaluación técnica de recomendaciones |
| Cierre importante | verification y code review | Gates Flutter y cumplimiento |

Solo se cargarán las skills necesarias para el escenario actual. Si
Superpowers no está disponible, `standalone-workflow.md` cubrirá
descubrimiento, investigación de causa raíz, diseño, planificación, TDD,
revisión del diff y verificación.

La skill se probará tanto de forma autónoma como combinada con Superpowers.

## Estándares arquitectónicos

### Organización

La base para proyectos nuevos será feature-first escalable. Las capas
`presentation`, `domain` y `data` se incorporarán únicamente cuando la
complejidad real las justifique. No se crearán carpetas o abstracciones
ceremoniales.

En proyectos existentes se conservará una arquitectura coherente. Una
migración de arquitectura deberá demostrar un problema concreto, presentar el
alcance y esperar aprobación.

### Pureza de dominio y dirección de datos

Los modelos de dominio representarán reglas y conceptos del producto. No
importarán DTOs, clientes HTTP, plugins, SDKs de proveedores ni tipos visuales
de Flutter.

- Los DTOs pertenecerán al límite de transporte o integración.
- El mapeo entre DTOs y dominio vivirá en mappers o implementaciones de
  repositories, fuera del modelo de dominio.
- Colores, iconos, estilos y etiquetas visibles pertenecerán a presentación,
  theme, design system o localización.
- Services y adapters podrán conocer contratos externos; el dominio no
  dependerá de ellos.

Una arquitectura existente que mezcle estas responsabilidades no se migrará
completa como mejora incidental. El agente detectará la dependencia, explicará
su impacto y propondrá una corrección acotada cuando el cambio actual la toque.

### Cubit-first y Bloc por necesidad

Cubit será la opción predeterminada para comandos directos, flujos pequeños y
transiciones que no requieran modelar el evento que las originó.

Bloc se utilizará cuando:

- existan eventos externos continuos, como cambios de autenticación;
- se combinen varias fuentes de eventos;
- importe ordenar, cancelar, reiniciar o transformar eventos;
- se necesiten políticas como debounce, restartable o droppable;
- la trazabilidad explícita de eventos mejore auditoría y debugging.

La mera existencia de un `Stream` no obliga a utilizar Bloc. Autenticación es
un candidato claro por restauración, expiración, login, logout y cambios de
sesión.

### Freezed

Todo modelo, DTO, evento, estado o failure que represente datos o variantes
utilizará Freezed. Enums y clases sin semántica de datos no se convertirán de
forma artificial.

La política de versionado de `.freezed.dart` y `.g.dart` se adaptará al
proyecto. Si no existe una, el agente propondrá una decisión antes de
configurarla.

### Barrels e imports

Cada feature tendrá un barrel público y cada capa relevante podrá tener el
suyo. Los barrels expondrán solo la API necesaria.

- Otra feature consumirá el barrel público de la feature.
- Una capa podrá consumir el barrel público de otra capa.
- Archivos de una misma capa usarán imports directos cuando importar el barrel
  implique autoexportarse.
- Ningún archivo importará un barrel que lo exporte.

Los barrels definen límites; no existen únicamente para acortar imports.

### Tamaño y responsabilidades

El tamaño será un disparador de revisión, no una métrica aislada:

- desde 250 líneas se revisarán responsabilidades y testabilidad;
- desde 400 líneas se exigirá una justificación explícita para conservar el
  archivo;
- código generado queda excluido;
- tests aplican la misma regla híbrida.

Una página coordinará estado, navegación y composición. Formularios, diálogos,
secciones y componentes con lógica propia vivirán en unidades enfocadas. Un
widget público principal por archivo será la norma; widgets privados pequeños
y de uso único podrán permanecer junto a su consumidor.

### Paquetes locales

Los paquetes vivirán en `packages/` y se crearán por límites estables, no por
cada clase. Se preferirá:

- `dart_package` para código independiente de Flutter;
- `flutter_package` cuando se requieran widgets, plugins o APIs de Flutter.

Un paquete se justificará cuando tenga una responsabilidad independiente, API
pequeña, pruebas aisladas o encapsule un dominio, repositorio o integración
estable.

También se extraerá un paquete cuando represente una capacidad transversal
reutilizable o una capa anticorrupción frente a un SDK relevante, por ejemplo
geolocalización, pagos, analytics o almacenamiento. No se crearán wrappers para
dependencias triviales.

Cada paquete expondrá una API pública deliberada mediante
`lib/<package_name>.dart`. Sus archivos internos utilizarán imports directos y
no importarán el barrel que los vuelve a exportar.

El grafo de paquetes será dirigido y acíclico. Antes de agregar una dependencia
local, el agente comprobará que no introduzca ciclos ni invierta los límites:

```text
app/composition
→ feature o repository
→ service/adapter
→ infraestructura y contratos base
```

Un paquete de infraestructura no dependerá de un repository de nivel superior
para obtener tokens, sesión o configuración. Recibirá un contrato pequeño,
callback o value provider ubicado en un límite inferior y estable. Los
contratos transversales se mantendrán como hojas del grafo y no conocerán
features concretas.

La aplicación consumirá los paquetes mediante dependencias de path. La
inyección será por constructor. `BlocProvider` proveerá Blocs y Cubits; no se
establece `RepositoryProvider` como política base. Dependencias globales se
compondrán en `app.dart` y las exclusivas de una feature cerca de ella, evitando
convertir `app.dart` en un contenedor gigante.

### Integraciones y estado

Blocs, Cubits, widgets y modelos de dominio no importarán directamente SDKs
externos importantes. Geolocalización en segundo plano, Firebase, analytics,
notificaciones, permisos complejos, mapas, pagos y capacidades equivalentes se
expondrán mediante services o adapters propios.

Una integración importante podrá extraerse a `packages/` aunque inicialmente
tenga un solo consumidor cuando el aislamiento proteja del lock-in, permita
pruebas sin el SDK o facilite reutilización futura. La API propia expondrá tipos
del dominio de la integración y ocultará objetos del proveedor.

### Composición y lifecycle

`main.dart` inicializará lo indispensable y delegará a un bootstrap o
composition root enfocado. Router, theme, observabilidad e integraciones
complejas se separarán cuando acumulen responsabilidades, sin crear archivos
ceremoniales.

Quien crea un recurso será responsable de liberarlo:

- `BlocProvider(create:)` administrará el cierre del Bloc o Cubit creado;
- una instancia entregada con `BlocProvider.value` conservará un propietario
  explícito que invoque `close`;
- subscriptions, timers, controllers, focus nodes, routers y clientes con
  lifecycle se cancelarán o cerrarán desde su propietario;
- las pruebas verificarán cleanup cuando una fuga pueda afectar el
  comportamiento.

## Política de dependencias

No se agregará ni actualizará una dependencia sin presentar y aprobar:

- necesidad concreta y beneficio;
- salud y mantenimiento del proyecto;
- compatibilidad con Dart, Flutter y plataformas objetivo;
- peso, impacto en build y complejidad operativa;
- licencia;
- alternativas, incluida la implementación con herramientas existentes;
- lock-in y estrategia de aislamiento o reemplazo.

La propuesta distinguirá una preferencia técnica de una obligación. Una
dependencia preferida podrá descartarse si un paquete aislado necesita una
solución más pequeña y la comparación demuestra un mejor ajuste. Después de
aprobarla, el agente verificará resolución, análisis, tests y builds relevantes.

## Networking e integraciones remotas

Una solución HTTP existente se conservará cuando sea coherente, testeable y
cubra los requisitos. No se migrará un cliente solamente por preferencia.

Para clientes REST nuevos que necesiten una solución HTTP dedicada, Dio será la
opción preferida. Agregarlo requerirá justificar la dependencia y esperar
aprobación.

Esta preferencia no obliga a incorporar Dio en una integración pequeña,
aislada y con necesidades limitadas. Otro cliente podrá conservarse o
proponerse cuando reduzca peso y superficie, permanezca encapsulado y supere la
política de dependencias.

Las integraciones importantes se encapsularán en un paquete local, por ejemplo
`api_client`, con una API propia. Las features no expondrán ni consumirán
`Response`, `DioException` u otros tipos de Dio fuera del límite de
infraestructura.

La configuración deberá:

- inyectar una instancia configurada en lugar de crear clientes ad hoc;
- declarar base URL, timeouts y headers necesarios;
- propagar cancelación cuando el flujo pueda abandonar una solicitud;
- utilizar interceptors con responsabilidades pequeñas y explícitas;
- traducir errores HTTP, de transporte y formato a errores propios;
- impedir logging de tokens, credenciales y cuerpos sensibles;
- aplicar retries solo a operaciones idempotentes y con una política aprobada;
- serializar DTOs con Freezed y JSON cuando el contrato lo justifique.

Los tests verificarán requests, respuestas, cancelación y mapeo de errores en
el límite del paquete sin realizar llamadas reales a servicios externos.

## Errores y resultados

Services y data sources interactuarán con APIs, plugins y fuentes externas.
Repositories traducirán excepciones externas a failures propios y tipados. Los
Blocs y Cubits convertirán resultados en estados explícitos. La UI no
interpretará excepciones ni mostrará mensajes técnicos.

Si el proyecto ya usa `dartz` o `fpdart`, la skill respetará la solución. En
proyectos nuevos podrá proponer `fpdart`, justificará la dependencia y esperará
aprobación.

`Either` no elimina los `catch` en límites donde un SDK lanza excepciones. Esas
excepciones se capturarán y convertirán a `Left(Failure)`. El consumo utilizará
`fold` o `match`; no se agregarán helpers que hagan casts inseguros de `Left` o
`Right`.

## Persistencia local

La persistencia se seleccionará por tipo y criticidad del dato, no por
preferencia aislada de una librería.

### Preferencias simples

El paquete `shared_preferences` será el estándar temporal para flags,
preferencias y valores key-value simples que no sean sensibles ni críticos. En
código nuevo se preferirá `SharedPreferencesAsync`; una API cacheada solo se
elegirá cuando exista una necesidad demostrable y se comprendan sus reglas de
consistencia.

Shared Preferences no se utilizará para:

- tokens, credenciales o secretos;
- información cuya pérdida pueda romper el negocio;
- colecciones o documentos serializados que funcionen como una base de datos;
- relaciones, queries, transacciones o sincronización offline.

### Datos sensibles

`flutter_secure_storage` será la opción preferida para secretos pequeños cuando
las plataformas objetivo y sus requisitos de seguridad sean compatibles.
Agregarlo requerirá aprobación y revisión de configuración, backup, migración y
comportamiento por plataforma.

### Datos estructurados y offline

Cada aplicación tendrá una única tecnología principal para persistencia local
estructurada. No se mezclarán Hive, Drift y ObjectBox dentro del mismo dominio
offline ni se dividirá una misma fuente de verdad entre varias bases.

Shared Preferences continuará reservado para preferencias simples y
`flutter_secure_storage` para secretos. Esas responsabilidades no se
considerarán bases alternativas para los datos de dominio.

En aplicaciones que ya utilicen Hive:

- Hive seguirá siendo una solución válida y soportada por la arquitectura
  existente;
- se podrán crear boxes, campos, adapters y migraciones cuando una feature lo
  necesite;
- los cambios seguirán las convenciones y mecanismos de versionado del
  proyecto;
- no se propondrá una migración de tecnología como mejora incidental;
- Drift u ObjectBox solo se introducirán mediante una solicitud explícita de
  migración.

En aplicaciones nuevas, el agente propondrá una única opción antes de
implementar persistencia estructurada y esperará aprobación:

- Drift para datos relacionales, joins, queries complejas, transacciones,
  migraciones controladas y streams reactivos;
- ObjectBox para persistencia orientada a objetos, alto volumen, rendimiento
  local y escenarios offline compatibles con sus plataformas objetivo.

Una vez elegida la tecnología principal, nuevas features reutilizarán esa
decisión salvo que exista una razón arquitectónica explícita y aprobada para
cambiarla. La propuesta inicial comparará plataformas, modelo de datos,
migraciones, testing, peso, lock-in y operación.

Toda migración definirá:

- esquema o modelo de origen y destino;
- versionado y ejecución idempotente;
- conversión y validación de datos;
- estrategia de backup, recuperación o rollback;
- comportamiento ante una migración parcial;
- tests con datos representativos antes de liberar.

El acceso podrá encapsularse en un paquete local cuando sea transversal o
represente un límite estable. Las features dependerán de contratos propios y no
de tipos de almacenamiento concretos.

Durante una migración aprobada podrá existir una convivencia temporal,
encapsulada en la capa de migración. Deberá declararse cuál tecnología es la
fuente de verdad en cada etapa, evitar dual writes permanentes y definir la
eliminación del almacenamiento anterior.

## Observabilidad

Una solución existente de logging y reporte de errores se conservará cuando sea
coherente y segura. Para aplicaciones nuevas, Firebase Crashlytics será la
opción preferida cuando las plataformas y la infraestructura del proyecto sean
compatibles. Agregar Firebase o Crashlytics requerirá aprobación.

La aplicación dependerá de un contrato propio, por ejemplo `ErrorReporter`, y
no de tipos de Firebase dentro de features, UI, Blocs, Cubits o repositories.
Otros destinos de reporte podrán implementarse mediante adapters sin cambiar
los consumidores.

La integración deberá:

- capturar errores fatales de Flutter y errores async no controlados;
- registrar como non-fatal solo errores inesperados y accionables;
- no reportar cada failure esperado de negocio;
- incluir versión, ambiente y operación cuando aporten diagnóstico;
- excluir tokens, credenciales, payloads sensibles y datos personales;
- impedir que URLs firmadas, webhooks, API keys o secretos queden embebidos en
  el código o archivos versionados;
- redactar headers, cuerpos, query parameters y respuestas antes de
  registrarlos;
- respetar configuración de consentimiento y recolección del producto;
- evitar `print` y logging de depuración en código productivo;
- probar el adapter sin enviar eventos reales al proveedor.

Si una auditoría detecta una credencial potencial, informará archivo,
ubicación, tipo de secreto y acción recomendada sin reproducir su valor. La
rotación o revocación será una acción externa explícita, no una modificación
automática.

## Ambientes y flavors

Una configuración existente de ambientes se conservará cuando sea coherente.
No se migrará a `.env`, `envied` ni otra solución solamente por preferencia.

Para aplicaciones nuevas se utilizará como base la estructura de flavors del
template Flutter de Very Good CLI:

- development;
- staging;
- production.

Cada flavor tendrá un entrypoint dedicado, como `main_development.dart`,
`main_staging.dart` y `main_production.dart`. Esos entrypoints serán composition
roots pequeños para seleccionar configuración y dependencias específicas antes
de delegar a un bootstrap compartido. No duplicarán lógica de aplicación.

La configuración deberá:

- representar valores requeridos mediante tipos explícitos;
- validar al iniciar y fallar con un mensaje accionable cuando falte un valor;
- mantener endpoints y dependencias de cada ambiente fuera de las features;
- evitar condicionales de ambiente dispersos por UI, dominio o repositories;
- impedir que production sea un fallback silencioso;
- conservar identificadores, nombres, iconos y archivos nativos coherentes con
  cada flavor cuando el producto los diferencie;
- documentar y utilizar comandos reproducibles para ejecutar, probar y compilar
  cada ambiente relevante.

Agregar un nuevo mecanismo de configuración requerirá una necesidad observable,
comparación con la estructura actual y aprobación.

## Navegación

Una solución existente se conservará si es coherente y cubre los requisitos.
Navigator será suficiente para aplicaciones pequeñas, flujos lineales,
pantallas modales y navegación sin requisitos de URL.

Se propondrá `go_router` cuando existan:

- deep links o rutas web reflejadas en la URL;
- redirecciones de autenticación;
- parámetros y rutas declarativas complejas;
- navegación anidada persistente;
- crecimiento que vuelva difícil mantener navegación imperativa.

`go_router` administrará rutas principales y Navigator podrá resolver
interacciones locales. Agregar la dependencia o migrar navegación requerirá
justificación y aprobación.

## Contrato de UI

### Fuente de verdad

Antes de implementar, el agente buscará:

1. archivo o enlace de diseño;
2. capturas o mockups;
3. prototipo existente;
4. theme, componentes y assets implementados.

Si no hay evidencia suficiente para una decisión material, preguntará antes de
inventar. La inspección cubrirá constraints, espaciados, tipografía, colores,
estados, componentes, responsive y assets.

Figma y las capturas serán fuentes visuales, no especificaciones completas de
producto, comportamiento o arquitectura. El agente deberá convertirlas en un
contrato implementable antes de escribir código.

### Design readiness

El contrato previo a la implementación incluirá:

- inventario de pantallas y componentes;
- anatomía, propiedades y variantes de cada componente;
- estados inicial, loading, vacío, contenido, error, disabled y éxito cuando
  correspondan;
- flujos, transiciones y comportamiento de navegación hacia atrás;
- reglas de scroll, foco, teclado y validación;
- matriz responsive y adaptive para los tamaños y plataformas objetivo;
- tokens de color, tipografía, espaciado, radios y elevación;
- manifiesto de SVG, imágenes y fuentes requeridos.

El agente deberá revisar el contrato con el usuario cuando falten decisiones
que puedan cambiar materialmente la experiencia.

### Auditoría del diseño

Antes de copiar una referencia visual, el agente evaluará si:

- contradice patrones Material o convenciones necesarias de la plataforma;
- omite estados, interacciones o feedback imprescindibles;
- no soporta texto largo, escalado, localización o contenido variable;
- presenta problemas de contraste, semántica o tamaño táctil;
- define componentes visualmente iguales con comportamientos distintos;
- carece de una adaptación viable para otras dimensiones;
- introduce tokens o componentes paralelos al design system existente.

La fidelidad visual no justificará degradar accesibilidad, seguridad o
usabilidad. El agente tampoco corregirá esas brechas silenciosamente.

### Protocolo de brechas

Cada brecha que pueda cambiar la experiencia se presentará antes de
implementar:

```text
Brecha: qué falta o entra en conflicto.
Evidencia: dónde se observa.
Impacto: qué problema produce.
Recomendación: solución propuesta y motivo.
Requiere decisión: sí o no.
```

Ante un conflicto entre Figma y una práctica de plataforma, el agente reportará
la evidencia y recomendará una solución, pero no se desviará del diseño hasta
recibir aprobación. No copiará ciegamente, mejorará en secreto ni inventará
comportamiento.

### Implementación

- Mantener lógica de negocio fuera de widgets.
- Identificar estados inicial, loading, vacío, contenido, error, disabled y
  éxito cuando sean aplicables.
- Reutilizar theme, design system y componentes existentes.
- Evitar textos, colores, espaciados y estilos dispersos.
- Reutilizar la solución de localización cuando el proyecto ya la tenga.
- Diseñar responsive desde constraints reales, sin tamaños arbitrarios.
- Usar `const`, builders y selección granular cuando aporten valor medible.
- Gestionar controllers, focus nodes, subscriptions y operaciones async.
- Incluir semántica, teclado y áreas táctiles cuando corresponda.
- No anticipar componentes reutilizables sin un uso real.

### Localización

La localización será opcional. Su ausencia no será un hallazgo cuando el
producto no tenga un requisito multidioma.

Si el proyecto ya utiliza ARB, `gen-l10n` u otra solución, el agente deberá
seguirla de forma consistente, actualizar los recursos correspondientes y
evitar textos visibles que salteen el mecanismo existente.

En un proyecto sin localización, agregarla requerirá un requisito explícito,
una propuesta de alcance y aprobación. La UI igualmente deberá tolerar
contenido largo y variaciones del texto definido por producto.

### Iconos y assets

- No inventar, dibujar, generar ni aproximar iconos.
- Utilizar Material Icons solo cuando el diseño o la convención del proyecto lo
  indique.
- Solicitar el SVG original para todo icono propio de diseño.
- Tratar la ausencia del SVG como bloqueo de esa parte de la UI.
- Guardar el archivo en la carpeta de assets definida por el proyecto.
- Respetar naming, organización y mecanismo de renderizado existentes.
- No agregar `flutter_svg` ni otra dependencia sin justificación y aprobación.
- No modificar el SVG recibido sin una necesidad técnica explícita.

### Validación visual

No se exigirán golden tests. Los widget tests serán obligatorios para
interacciones, validaciones, estados y comportamiento observable, pero no para
pantallas estáticas o cambios exclusivamente visuales.

Cuando sea relevante, los widget tests también utilizarán las APIs de
accesibilidad incluidas en Flutter para verificar etiquetas, contraste y
tamaños táctiles. No se agregará una dependencia de snapshots visuales para
estas comprobaciones.

Cuando el entorno lo permita, el agente ejecutará la UI, capturará tamaños
representativos y comparará contra la fuente de verdad. Revisará overflow,
escalado de texto, contenido largo, loading, errores y ausencia de datos. No
afirmará fidelidad visual si no pudo inspeccionar y renderizar la interfaz.

## TDD, tests y cobertura

Todo cambio de comportamiento seguirá RED, GREEN y REFACTOR:

1. escribir un test que describa un comportamiento;
2. ejecutarlo y confirmar que falla por la razón esperada;
3. implementar el mínimo necesario;
4. ejecutar y confirmar que pasa;
5. refactorizar manteniendo la suite verde.

Un refactor sin cobertura comenzará con tests de caracterización. Se permitirán
excepciones justificadas para código generado, documentación, configuración
sin lógica y cambios visuales sin comportamiento verificable.

`test/` reflejará la estructura de `lib/`. Las suites grandes se dividirán por
comportamiento. Builders, fixtures, fakes y helpers reutilizables vivirán en
helpers de test sin ocultar el escenario ni las expectativas.

La skill respetará el umbral de cobertura del proyecto, no permitirá
regresiones y exigirá cobertura del comportamiento nuevo. En un proyecto nuevo
propondrá un umbral alto y su enforcement en CI.

## Contrato de auditoría

Cada hallazgo tendrá:

- severidad: bloqueante, importante o mejora;
- archivo y ubicación exactos;
- evidencia observada;
- impacto técnico;
- corrección recomendada;
- clasificación como cambio actual o deuda futura.

El informe terminará con un orden sugerido de implementación. No incluirá
elogios genéricos ni afirmaciones sin evidencia.

Un cambio de comportamiento sin test será bloqueante. Las infracciones
mecánicas verificables deberán apoyarse en comandos o resultados reproducibles.

## Changelog

Toda implementación aprobada actualizará el changelog canónico existente con
una entrada de una sola línea:

- breve y en el idioma y formato del proyecto;
- ubicada en la categoría existente que corresponda, como Added, Changed o
  Fixed;
- centrada en el efecto observable para usuario, operación o mantenimiento;
- con identificador de issue solo cuando la convención lo utilice.

Los cambios de la aplicación se registrarán en el changelog raíz. El changelog
de un paquete se actualizará únicamente cuando ese paquete se versione, publique
o libere de manera independiente, o cuando la convención del repositorio lo
exija.

La skill no incrementará versiones ni creará un changelog inexistente sin
aprobación. Si no encuentra uno, lo reportará y propondrá la decisión antes de
implementar.

## Verificación

Antes de afirmar que una implementación terminó, el agente ejecutará las
validaciones relevantes definidas por el proyecto:

- formato;
- análisis estático y lints;
- generación de código;
- tests afectados;
- suite completa;
- cobertura sin regresiones;
- ausencia de artefactos generados desactualizados;
- build cuando dependencias, plugins, configuración, flavors o entrega lo
  justifiquen.

En un workspace con paquetes locales, estas comprobaciones se ejecutarán en
cada paquete modificado y en sus dependientes directos. La suite de la
aplicación raíz no sustituirá análisis, codegen o tests propios de un paquete.
La skill reutilizará Melos, scripts o CI existentes; si no hay orquestación,
determinará los comandos desde cada `pubspec.yaml`.

El informe final enumerará comandos y resultados reales. Una validación no
ejecutada se declarará junto con el motivo. No se extrapolará éxito desde una
verificación parcial.

## Validación de la skill

La skill se desarrollará con pruebas de comportamiento:

1. preparar escenarios realistas de creación, refactor, bug y auditoría;
2. ejecutar los escenarios sin la skill y registrar fallas de base;
3. escribir la guía mínima que corrija esas fallas;
4. repetir los escenarios con la skill autónoma;
5. repetir casos representativos con Superpowers disponible;
6. validar estructura y frontmatter con el validador de Agent Skills;
7. ejecutar y probar `inspect_flutter_project.dart`;
8. realizar una auditoría controlada sobre un proyecto representativo sin
   modificar su código.

Las pruebas deberán comprobar especialmente:

- activación correcta en los seis escenarios;
- ausencia de cambios antes de aprobación;
- detección de archivos sobredimensionados y barrels;
- detección de ciclos y dependencias invertidas entre paquetes;
- rechazo de imports de DTOs, SDKs o tipos visuales desde dominio;
- encapsulación de integraciones importantes fuera de Blocs y Cubits;
- ownership y cleanup de recursos con lifecycle;
- aplicación de Cubit-first y Bloc por necesidad;
- preferencia por Dio sin forzar migraciones de clientes HTTP existentes;
- evaluación completa y aprobada de dependencias nuevas;
- rechazo de Shared Preferences para secretos o datos estructurados;
- continuidad segura de Hive en aplicaciones existentes;
- selección de una única base estructurada para aplicaciones nuevas;
- selección justificada entre Drift y ObjectBox;
- integración desacoplada de Crashlytics;
- uso consistente de los flavors de Very Good CLI;
- rechazo de iconos inventados;
- detección de secretos sin reproducir sus valores;
- actualización breve y correcta del changelog;
- uso de Freezed y TDD;
- verificación de paquetes modificados y dependientes directos;
- funcionamiento sin Superpowers;
- composición correcta cuando Superpowers esté disponible.

## Fuera de alcance inicial

- Crear un LLM, runtime o framework de agentes propio.
- Exigir un proveedor específico de IA.
- Distribuir un plugin completo o marketplace empresarial.
- Migrar automáticamente proyectos completos.
- Reemplazar lints, CI o análisis estático existentes.

## Criterios de aceptación

La primera versión estará lista cuando:

1. cumpla la especificación abierta Agent Skills;
2. sea utilizable sin Superpowers;
3. se componga con Superpowers sin duplicar procesos;
4. la fuente canónica permanezca versionada y la instalación global de Codex
   muestre metadata mediante `agents/openai.yaml`;
5. produzca auditorías con evidencia y prioridades consistentes;
6. no modifique archivos sin aprobación;
7. aplique los estándares Flutter aprobados;
8. el script de inspección sea read-only y esté probado;
9. los escenarios sin y con la skill demuestren una mejora observable;
10. aplique correctamente las políticas de networking, persistencia local,
    observabilidad y flavors;
11. detecte ciclos, dependencias invertidas y fugas de tipos entre límites;
12. aplique la política de dependencias y actualice el changelog sin ampliar el
    alcance de release.
