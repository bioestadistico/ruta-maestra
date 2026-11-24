# Ruta Maestra de la Investigación Científica

Skill que guía tareas de investigación científica, tesis y productos académicos, desde la idea hasta el informe final.

## Descarga

**[Descargar la última versión (ruta-maestra.zip)](https://github.com/bioestadistico/ruta-maestra/releases/latest/download/ruta-maestra.zip)**

Instalación y video tutorial: [ruta48.com](https://ruta48.com/ruta-maestra-de-la-investigacion-cientifica/)

## Cómo se publica

Cada cambio que llega a la rama `main` en `SKILL.md`, `references/` o `biblioteca/` crea solo una versión nueva (v1.1, v1.2…) con el archivo `ruta-maestra.zip`. El enlace de arriba y el botón de ruta48.com siempre entregan la más reciente.

La rama `desarrollo` es el borrador: los cambios guardados ahí no se publican. Cuando estén listos, se fusionan a `main` y sale la versión nueva.

## Para el autor: trabajar desde varias computadoras

**Una sola vez en cada computadora** (PowerShell):

```powershell
irm https://raw.githubusercontent.com/bioestadistico/ruta-maestra/main/herramientas/instalar-en-esta-computadora.ps1 | iex
```

Instala Git si falta, guarda un respaldo de la carpeta actual en `.codex\respaldos`, la enlaza con este repositorio.

**Al terminar de trabajar la skill** (o pídele a Claude/Codex "guarda los cambios de la skill"):

```powershell
powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.codex\skills\ruta-maestra-investigacion-cientifica\herramientas\sincronizar.ps1" "Qué cambié"
```

Sube tus cambios, trae los de tus otras computadoras y publica la versión nueva.

La configuración de Obsidian (`.obsidian/`) no se sube: está en `.gitignore`. El libro (`biblioteca/`) sí se publica dentro del .zip.

Autor: José Supo · BIOESTADISTICO
