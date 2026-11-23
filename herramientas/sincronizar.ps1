# Guarda tus cambios de la skill en GitHub y trae los de tus otras computadoras.
# Cada vez que se suben cambios a SKILL.md o references/, GitHub publica una versión nueva
# y el botón de ruta48.com entrega esa versión.
#
# Uso:  powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.codex\skills\ruta-maestra-investigacion-cientifica\herramientas\sincronizar.ps1" "Qué cambié"

param([string]$Mensaje = "Actualizar la skill")

$ErrorActionPreference = "Continue"
$dest = Join-Path $env:USERPROFILE ".codex\skills\ruta-maestra-investigacion-cientifica"
Set-Location $dest

# Si el libro existe en esta computadora pero aun no esta en GitHub-local,
# se aparta un momento para que la descarga no choque con el.
$apartado = $null
if ((Test-Path "biblioteca") -and -not (git ls-files biblioteca)) {
    git fetch origin
    if (git ls-tree -r --name-only origin/main biblioteca) {
        $apartado = Join-Path $env:USERPROFILE ".codex\respaldos\biblioteca-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        New-Item -ItemType Directory -Force -Path (Split-Path $apartado) | Out-Null
        Move-Item "biblioteca" $apartado
    }
}

git add -A
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) { git commit -m $Mensaje | Out-Null; Write-Host "Cambios guardados: $Mensaje" }

git pull --rebase --autostash
git push

if ($apartado -and -not (Test-Path "biblioteca")) { Move-Item $apartado "biblioteca" }

Write-Host "Sincronizado con GitHub." -ForegroundColor Green
