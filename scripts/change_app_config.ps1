<#
.SYNOPSIS
    App Configuration Changer Script (PowerShell Core Logic)
#>

param (
    [string]$Flavor,
    [string]$Name,
    [string]$BundleId,
    [switch]$All,
    [switch]$Show,
    [switch]$Help
)

$ErrorActionPreference = "Stop"

# --- Colors & formatting ---
function Write-Info($msg) { Write-Host "ℹ️  $msg" -ForegroundColor Cyan }
function Write-Success($msg) { Write-Host "✅ $msg" -ForegroundColor Green }
function Write-Warning($msg) { Write-Host "⚠️  $msg" -ForegroundColor Yellow }
function Write-Error($msg) { Write-Host "❌ $msg" -ForegroundColor Red }
function Write-Header() {
    Write-Host "🚀 App Configuration Changer" -ForegroundColor Cyan
    Write-Host "=============================" -ForegroundColor Cyan
}

# --- Project Paths ---
# Use Join-Path relative to current location (project root)
$AndroidBuildGradle = "android\app\build.gradle.kts"
$IosDevelopXcconfig = "ios\Flutter\Develop.xcconfig"
$IosProductionXcconfig = "ios\Flutter\Production.xcconfig"
$MacosAppInfoXcconfig = "macos\Runner\Configs\AppInfo.xcconfig"
$EnvDev = "assets\env\.env.dev"
$EnvProduction = "assets\env\.env.production"
$EnvDefault = "assets\env\.env"

# --- Helper Functions ---

function Get-CurrentAndroidAppName($flavor) {
    if (Test-Path $AndroidBuildGradle) {
        $content = Get-Content $AndroidBuildGradle -Raw
        # Regex to safely find resValue inside flavor block
        $pattern = 'create\("'+$flavor+'"\)\s*\{[\s\S]*?resValue\("string", "app_name", "([^"]*)"\)'
        if ($content -match $pattern) { return $matches[1] }
    }
    return $null
}

function Get-CurrentAndroidAppId {
    if (Test-Path $AndroidBuildGradle) {
        $content = Get-Content $AndroidBuildGradle -Raw
        if ($content -match 'applicationId = "([^"]*)"') { return $matches[1] }
    }
    return $null
}

function Get-CurrentIosConfig($flavor, $key) {
    $configFile = if ($flavor -eq "develop") { $IosDevelopXcconfig } else { $IosProductionXcconfig }
    if (Test-Path $configFile) {
        $lines = Get-Content $configFile
        foreach($line in $lines) {
            if ($line -match "$key = (.*)") { return $matches[1].Trim() }
        }
    }
    return $null
}

function Get-CurrentConfig($flavor) {
    $androidName = Get-CurrentAndroidAppName $flavor
    $iosName = Get-CurrentIosConfig $flavor "PRODUCT_NAME"
    $iosId = Get-CurrentIosConfig $flavor "PRODUCT_BUNDLE_IDENTIFIER"
    $androidId = Get-CurrentAndroidAppId

    $name = if ($androidName) { $androidName } elseif ($iosName) { $iosName } else { "Unknown" }
    
    $id = if ($iosId) { $iosId } 
          elseif ($flavor -eq "develop" -and $androidId) { "$androidId.dev" }
          elseif ($androidId) { $androidId }
          else { "Unknown" }
          
    return @{ Name = $name; Id = $id }
}

function Validate-BundleId($id) {
    if ($id -match '^[a-zA-Z][a-zA-Z0-9]*(\.[a-zA-Z][a-zA-Z0-9]*)+$') { return $true }
    Write-Error "Invalid bundle ID format: $id"
    return $false
}

# --- Update Logic ---

function Update-AndroidConfig($flavor, $displayName, $bundleId) {
    Write-Info "Updating Android ($flavor)..."
    if (-not (Test-Path $AndroidBuildGradle)) { Write-Error "File not found: $AndroidBuildGradle"; return }

    $content = Get-Content $AndroidBuildGradle -Raw -Encoding UTF8
    
    $patternName = '(create\("'+$flavor+'"\)\s*\{[\s\S]*?resValue\("string", "app_name", ")([^"]*)("\))'
    $replacement = '${1}' + $displayName + '${3}'
    $content = [regex]::Replace($content, $patternName, $replacement)

    if ($flavor -eq "production") {
        $content = $content -replace 'applicationId = "[^"]*"', "applicationId = `"$bundleId`""
        $content = $content -replace 'namespace = "[^"]*"', "namespace = `"$bundleId`""
    }
    
    # Ghi lại file
    Set-Content -Path $AndroidBuildGradle -Value $content -Encoding UTF8
}

function Update-IosConfig($flavor, $displayName, $bundleId) {
    Write-Info "Updating iOS ($flavor)..."
    $configFile = if ($flavor -eq "develop") { $IosDevelopXcconfig } else { $IosProductionXcconfig }
    
    if (Test-Path $configFile) {
        $content = Get-Content $configFile -Encoding UTF8
        $newContent = @()
        foreach ($line in $content) {
            if ($line -match "PRODUCT_BUNDLE_IDENTIFIER =") { $newContent += "PRODUCT_BUNDLE_IDENTIFIER = $bundleId" }
            elseif ($line -match "PRODUCT_NAME =") { $newContent += "PRODUCT_NAME = $displayName" }
            else { $newContent += $line }
        }
        Set-Content -Path $configFile -Value $newContent -Encoding UTF8
    }
}

function Update-MacosConfig($displayName, $bundleId) {
    Write-Info "Updating macOS..."
    if (Test-Path $MacosAppInfoXcconfig) {
        $content = Get-Content $MacosAppInfoXcconfig -Encoding UTF8
        $newContent = @()
        foreach ($line in $content) {
            if ($line -match "PRODUCT_BUNDLE_IDENTIFIER =") { $newContent += "PRODUCT_BUNDLE_IDENTIFIER = $bundleId" }
            elseif ($line -match "PRODUCT_NAME =") { $newContent += "PRODUCT_NAME = $displayName" }
            else { $newContent += $line }
        }
        Set-Content -Path $MacosAppInfoXcconfig -Value $newContent -Encoding UTF8
    }
}

function Update-EnvFiles($flavor, $displayName, $bundleId) {
    Write-Info "Updating .env ($flavor)..."
    $envFile = if ($flavor -eq "develop") { $EnvDev } else { $EnvProduction }
    
    $filesToUpdate = @($envFile)
    if ($flavor -eq "production") { $filesToUpdate += $EnvDefault }

    foreach ($file in $filesToUpdate) {
        if (Test-Path $file) {
            $content = Get-Content $file -Encoding UTF8
            $newContent = @()
            foreach ($line in $content) {
                if ($line -match "^APP_NAME=") { $newContent += "APP_NAME=$displayName" }
                elseif ($line -match "^BUNDLE_ID=") { $newContent += "BUNDLE_ID=$bundleId" }
                else { $newContent += $line }
            }
            Set-Content -Path $file -Value $newContent -Encoding UTF8
        }
    }
}

function Apply-Changes($flavor, $name, $id) {
    if (-not (Validate-BundleId $id)) { return }
    Update-AndroidConfig $flavor $name $id
    Update-IosConfig $flavor $name $id
    if ($flavor -eq "production") { Update-MacosConfig $name $id }
    Update-EnvFiles $flavor $name $id
    Write-Success "$flavor updated successfully!"
}

# --- Interactive Mode ---
function Show-Menu {
    Write-Header
    Write-Host "1. Update DEVELOP"
    Write-Host "2. Update PRODUCTION"
    Write-Host "3. Update ALL"
    Write-Host "4. Show Config"
    Write-Host "5. Exit"
    Write-Host ""
    
    $choice = Read-Host "Select option (1-5)"
    switch ($choice) {
        "1" { Run-Interactive "develop" }
        "2" { Run-Interactive "production" }
        "3" { Run-Interactive "develop"; Run-Interactive "production" }
        "4" { 
            $dev = Get-CurrentConfig "develop"
            $prod = Get-CurrentConfig "production"
            Write-Host "DEVELOP: $($dev.Name) ($($dev.Id))"
            Write-Host "PRODUCT: $($prod.Name) ($($prod.Id))"
            Read-Host "Press Enter..."
        }
        "5" { exit }
    }
    Show-Menu # Loop
}

function Run-Interactive($flavor) {
    $curr = Get-CurrentConfig $flavor
    Write-Host "`n--- Configuring $flavor ---" -ForegroundColor Cyan
    Write-Host "Current: $($curr.Name) | $($curr.Id)"
    
    $name = Read-Host "New Name (Enter to keep)"
    if ([string]::IsNullOrWhiteSpace($name)) { $name = $curr.Name }
    
    $id = Read-Host "New ID (Enter to keep)"
    if ([string]::IsNullOrWhiteSpace($id)) { $id = $curr.Id }
    
    Apply-Changes $flavor $name $id
}

# --- Main Entry Point ---

if (-not (Test-Path "pubspec.yaml")) {
    Write-Error "Please run from Flutter project root."
    exit 1
}

if ($Help) {
    Write-Host "Usage: change_app_config.ps1 [-Flavor develop|production -Name X -BundleId Y] [-All] [-Show]"
    exit 0
}

if ($Flavor) {
    Apply-Changes $Flavor $Name $BundleId
} elseif ($All) {
    Run-Interactive "develop"
    Run-Interactive "production"
} elseif ($Show) {
    $dev = Get-CurrentConfig "develop"
    $prod = Get-CurrentConfig "production"
    Write-Host "DEVELOP: $($dev.Name) ($($dev.Id))"
    Write-Host "PRODUCT: $($prod.Name) ($($prod.Id))"
} else {
    Show-Menu
}