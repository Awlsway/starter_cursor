param(
  [Parameter(Mandatory = $true)]
  [string]$AppName,

  [string]$DisplayName,

  [string]$Env = "development"
)

$ErrorActionPreference = "Stop"

if (-not $DisplayName) {
  $DisplayName = ($AppName -replace "_", " ")
}

$root = Split-Path -Parent $PSScriptRoot
$pubspecPath = Join-Path $root "pubspec.yaml"
$appDartPath = Join-Path $root "lib\app\app.dart"
$envExamplePath = Join-Path $root ".env.example"
$envPath = Join-Path $root ".env"

if (-not (Test-Path $pubspecPath)) {
  throw "pubspec.yaml not found. Run this script from starter repo context."
}

Write-Host "Bootstrapping project..." -ForegroundColor Cyan
Write-Host "- App name: $AppName"
Write-Host "- Display name: $DisplayName"
Write-Host "- Env: $Env"

$pubspec = Get-Content $pubspecPath -Raw
$pubspec = [regex]::Replace($pubspec, "(?m)^name:\s*.+$", "name: $AppName")
Set-Content -Path $pubspecPath -Value $pubspec

$appDart = Get-Content $appDartPath -Raw
$appDart = $appDart -replace "title:\s*'[^']*'", "title: '$DisplayName'"
Set-Content -Path $appDartPath -Value $appDart

if (Test-Path $envExamplePath) {
  $envExample = Get-Content $envExamplePath -Raw
  $envExample = [regex]::Replace($envExample, "(?m)^APP_ENV=.*$", "APP_ENV=$Env")
  Set-Content -Path $envExamplePath -Value $envExample
}

if (-not (Test-Path $envPath) -and (Test-Path $envExamplePath)) {
  Copy-Item -Path $envExamplePath -Destination $envPath
  Write-Host "- Created .env from .env.example"
}

Write-Host "Bootstrap complete." -ForegroundColor Green
Write-Host "Next steps:"
Write-Host "1) flutter pub get"
Write-Host "2) dart run tool/generate_tokens.dart"
Write-Host "3) flutter run"
