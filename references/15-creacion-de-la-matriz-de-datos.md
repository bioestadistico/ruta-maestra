---
name: creacion-de-la-matriz-de-datos
description: Crea una matriz de datos a partir de fichas llenas, fotografías, archivos tabulares u otros registros reales. Si no existen registros, ofrece una matriz vacía para llenado manual y, solo como último recurso autorizado, una matriz simulada identificada expresamente como tal.
---

# Creación de la matriz de datos

La creación de la matriz de datos transforma registros en una estructura de casos por filas y variables por columnas, lista para el análisis. Prioriza datos reales; si no existen, permite ofrecer una plantilla vacía para llenado manual y, en último extremo, una simulación expresamente identificada.

## INSUMOS

**Productos anteriores.** Recibe los registros reales disponibles en uno o varios insumos y recupera los instrumentos y demás documentos necesarios para interpretarlos. Todos los insumos son de solo lectura: conserva cada fuente original y distingue siempre los datos observados de las operaciones realizadas en copias de trabajo.


Usar como insumos principales los registros de datos reales proporcionados. Pueden encontrarse en fichas de recolección llenas, fotografías o digitalizaciones de esas fichas, archivos CSV, Excel, SPSS u otros formatos legibles, así como en uno o varios archivos que deban unirse. Preservar cada original sin sobrescribirlo y trabajar sobre copias.

Recuperar los instrumentos, fichas de recolección, diccionarios, cuadros de variables y reglas de puntuación disponibles que permitan interpretar nombres, indicadores, categorías, unidades, códigos, rangos y valores derivados. Utilizar solo los documentos existentes y pertinentes; su ausencia no impide revisar la matriz, pero debe registrarse como una limitación de comprobación.

Cuando no exista ningún registro, utilizar los instrumentos y el cuadro de variables disponibles para ofrecer una matriz vacía destinada al llenado manual. Proponer una simulación únicamente si tampoco resulta viable el llenado manual y el investigador la autoriza expresamente; no presentarla como datos reales ni como resultados del estudio.

## PROCESAMIENTO

1. **Reconocer los insumos.** Identificar las fichas llenas, fotografías, archivos, formatos, hojas o tablas disponibles; reconocer casos, variables, encabezados, etiquetas, códigos y valores perdidos. Inventariar únicamente los insumos proporcionados, sin exigir los que no existan.

2. **Preservar la fuente.** Todos los insumos son de solo lectura; no renombrarlos, moverlos, sobrescribirlos ni alterar sus metadatos. Aplicar las reglas de la [gestión de archivos auxiliares](od-05-gestion-de-archivos-auxiliares.md) para copias de trabajo y de la [presentación y entrega de productos](od-02-presentacion-y-entrega-de-productos.md) para controles de integridad, conservando cada original.

3. **Aplicar el escenario disponible.** Si existe un solo archivo de datos, usarlo como base. Si existen varios, comprobar su estructura y unir los registros o variables según sus identificadores y relaciones verificables. Si existen fichas llenas o fotografías, transcribirlas o contrastarlas con los archivos disponibles. No exigir insumos que no hayan sido proporcionados.

4. **Aplicar la salida de último recurso.** Si no existe ningún registro real, ofrecer primero una matriz vacía, estructurada para el llenado manual. Solo cuando esa opción no resulte viable, proponer una matriz simulada, solicitar autorización expresa y documentar sus parámetros, semilla y carácter simulado.

5. **Transcribir y contrastar.** Registrar únicamente respuestas legibles y verificables. Marcar las respuestas ilegibles, ambiguas o incompletas como incidencias pendientes; no inferirlas ni completarlas por suposición. Proteger los datos personales durante el procesamiento.

6. **Crear la matriz.** Consolidar una fila por unidad de estudio y una columna por variable o indicador. Incorporar o comprobar un identificador único y conservar el orden documentado de las variables. Calcular puntajes o categorías derivadas solo cuando existan reglas verificables y mantener su concordancia con los registros originales.

7. **Verificar la coherencia.** Comprobar dimensiones, identificadores, duplicados, valores perdidos, tipos, códigos, rangos, categorías, puntuaciones y relaciones lógicas. Corregir en la copia únicamente lo respaldado por los insumos y conservar un registro de los cambios; presentar las demás incidencias para decisión del investigador.

8. **Preparar el diccionario.** Consolidar nombres, etiquetas, definición, tipo, nivel de medición, codificación, unidades, valores perdidos y reglas de derivación que puedan verificarse. Señalar los campos que no puedan documentarse con los insumos disponibles.

9. **Comprobar el producto independiente.** Aplicar las reglas de la [presentación y entrega de productos](od-02-presentacion-y-entrega-de-productos.md) a la exportación, reapertura y comparación de huellas. No entregar si un insumo ha cambiado; registrar la incidencia y conservar la estructura y la procedencia de la matriz.

## PRODUCTO

**Uso posterior.** La matriz resultante y su diccionario proporcionan al capítulo de resultados una fuente única, reconstruida desde los insumos disponibles. Conservan la procedencia de los registros, las uniones, correcciones y transformaciones realizadas, así como las incidencias que puedan afectar el análisis.

### Producto provisional

Presentar la estructura reconocida de la matriz: formato de origen, número de casos y variables, identificadores, codificaciones, valores perdidos, documentos complementarios disponibles e incidencias detectadas. Distinguir los cambios automatizables de aquellos que requieran una decisión del investigador.

### Producto final

El producto final es la **Matriz de datos**, con existencia independiente de uno o varios insumos conforme a la [presentación y entrega de productos](od-02-presentacion-y-entrega-de-productos.md). Incluir `ID` como primera columna: identificador único, sin duplicados ni valores vacíos.

Conservar a continuación el orden documentado de las variables; el identificador no es una variable analítica. La entrega exige integridad de todos los insumos, comprobada con los controles definidos en la [presentación y entrega de productos](od-02-presentacion-y-entrega-de-productos.md). Si el producto está vacío o fue simulado, identificar expresamente esa condición en la descripción y los metadatos.

Aplicar las reglas de la [presentación y entrega de productos](od-02-presentacion-y-entrega-de-productos.md) para el formato de entrega, la numeración, el nombre del archivo y su verificación. Usar el nombre **Matriz de datos**, sin calificativos, y acompañar la entrega con una síntesis del formato de origen, el número de casos y variables, las fuentes utilizadas, las transformaciones realizadas y las incidencias pendientes.
