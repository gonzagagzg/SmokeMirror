param(
  [int]$Port = 8080
)

$env:PORT = $Port
Write-Host "Iniciando SmokeMirror en el puerto $Port..." -ForegroundColor Cyan
node server.js

if (-not $?) {
  Write-Host "Error: Asegúrate de tener Node.js instalado." -ForegroundColor Red
  Write-Host "Descárgalo desde: https://nodejs.org/" -ForegroundColor Yellow
  pause
}
