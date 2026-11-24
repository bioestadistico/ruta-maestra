# Guarda tus cambios de la skill en GitHub y trae los de tus otras computadoras.
# Funciona en la rama en la que esté la carpeta (main o desarrollo).
# Solo los cambios que llegan a main publican una versión nueva en ruta48.com;
# lo que guardes en "desarrollo" queda en GitHub pero no se publica.
#
# Uso:  powershell -ExecutionPolicy Bypass -File "$env:USERPROFILE\.codex\skills\ruta-maestra-investigacion-cientifica\herramientas\sincronizar.ps1" "Qué cambié"

param([string]$Mensaje = "Actualizar la skill")

$ErrorActionPreference = "Continue"
$dest = Join-Path $env:USERPROFILE ".codex\skills\ruta-maestra-investigacion-cientifica"
Set-Location $dest
$rama = (git rev-parse --abbrev-ref HEAD).Trim()
Write-Host "Rama actual: $rama"

# Si el libro existe en esta computadora pero aun no esta en GitHub-local,
# se aparta un momento para que la descarga no choque con el.
$apartado = $null
if ((Test-Path "biblioteca") -and -not (git ls-files biblioteca)) {
    git fetch origin
    if (git ls-tree -r --name-only "origin/$rama" biblioteca) {
        $apartado = Join-Path $env:USERPROFILE ".codex\respaldos\biblioteca-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
        New-Item -ItemType Directory -Force -Path (Split-Path $apartado) | Out-Null
        Move-Item "biblioteca" $apartado
    }
}

git add -A
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) { git commit -m $Mensaje | Out-Null; Write-Host "Cambios guardados: $Mensaje" }

git fetch origin
git ls-remote --exit-code --heads origin $rama | Out-Null
if ($LASTEXITCODE -eq 0) { git pull --rebase --autostash origin $rama }
git push -u origin $rama

if ($apartado -and -not (Test-Path "biblioteca")) { Move-Item $apartado "biblioteca" }

Write-Host "Sincronizado con GitHub (rama $rama)." -ForegroundColor Green
