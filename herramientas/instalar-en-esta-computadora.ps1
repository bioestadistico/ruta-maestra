# Enlaza la carpeta de la skill de Codex de ESTA computadora con GitHub.
# Se ejecuta una sola vez por computadora (PowerShell, sin permisos de administrador):
#   irm https://raw.githubusercontent.com/bioestadistico/ruta-maestra/main/herramientas/instalar-en-esta-computadora.ps1 | iex
#
# Qué hace:
#  1. Respalda la carpeta actual de la skill (si existe) con la fecha en el nombre.
#  2. Descarga la skill desde GitHub en la misma ubicación.
#  3. Devuelve a su lugar el libro (biblioteca/) y la configuración de Obsidian,
#     que se quedan solo en tu computadora y nunca se suben a GitHub.

& {
    $ErrorActionPreference = "Continue"
    $repo   = "https://github.com/bioestadistico/ruta-maestra.git"
    $skills = Join-Path $env:USERPROFILE ".codex\skills"
    $dest   = Join-Path $skills "ruta-maestra-investigacion-cientifica"

    if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
        Write-Host "Instalando Git (solo la primera vez, tarda 1 o 2 minutos)..." -ForegroundColor Yellow
        winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements --silent
        $env:Path = [Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [Environment]::GetEnvironmentVariable("Path","User")
        if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
            Write-Host "No se pudo instalar Git automaticamente. Cierra PowerShell, abrelo de nuevo y vuelve a pegar la linea." -ForegroundColor Red
            return
        }
    }

    if (-not (git config --global user.name))  { git config --global user.name  "José Supo" }
    if (-not (git config --global user.email)) { git config --global user.email "bioestadistico@users.noreply.github.com" }

    New-Item -ItemType Directory -Force -Path $skills | Out-Null

    if (Test-Path (Join-Path $dest ".git")) {
        Write-Host "Esta computadora ya está enlazada. Trayendo la última versión..."
        git -C $dest pull --rebase --autostash
        return
    }

    $backup = $null
    if (Test-Path $dest) {
        $respaldos = Join-Path $env:USERPROFILE ".codex\respaldos"
        New-Item -ItemType Directory -Force -Path $respaldos | Out-Null
        $backup = Join-Path $respaldos "ruta-maestra-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        Move-Item $dest $backup
        Write-Host "Respaldo guardado en: $backup"
    }

    git clone $repo $dest
    if (-not (Test-Path (Join-Path $dest ".git"))) {
        Write-Host "No se pudo descargar la skill desde GitHub. Se restauro tu carpeta original." -ForegroundColor Red
        if ($backup) { Move-Item $backup $dest }
        return
    }

    if ($backup) {
        foreach ($extra in @("biblioteca", ".obsidian")) {
            $src = Join-Path $backup $extra
            if (Test-Path $src) { Copy-Item $src (Join-Path $dest $extra) -Recurse -Force }
        }
    }

    Write-Host ""
    Write-Host "Listo. La skill de esta computadora quedó enlazada con GitHub." -ForegroundColor Green
    Write-Host "Para guardar y publicar tus cambios:  powershell -ExecutionPolicy Bypass -File `"$dest\herramientas\sincronizar.ps1`" `"Qué cambié`""
}
