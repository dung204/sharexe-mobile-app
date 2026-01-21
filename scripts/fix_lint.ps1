<#
.SYNOPSIS
    Comprehensive code fix and format script for Flutter
    Usage: .\scripts\fix_lint.ps1
#>

$ErrorActionPreference = "Stop"

function Write-Step($emoji, $msg) { Write-Host "$emoji $msg" -ForegroundColor Cyan }
function Write-Success($msg) { Write-Host "✅ $msg" -ForegroundColor Green }
function Write-Error($msg) { Write-Host "❌ $msg" -ForegroundColor Red }

Write-Host "🚀 Starting comprehensive code fix and format process..." -ForegroundColor Cyan

# Step 1: Apply dart fix
Write-Step "🛠️" "Applying dart fix..."
try {
    # Sử dụng cmd /c để gọi fvm nếu fvm là file .bat/.cmd
    cmd /c fvm dart fix --apply
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Dart fix completed successfully"
    } else {
        throw "Dart fix failed"
    }
} catch {
    Write-Error $_
    exit 1
}

# Step 2: Format code
Write-Step "📝" "Formatting code..."
try {
    cmd /c fvm dart format lib/ test/
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Code formatting completed successfully"
    } else {
        throw "Code formatting failed"
    }
} catch {
    Write-Error $_
    exit 1
}

# Step 3: Run analysis
Write-Step "🔍" "Running static analysis..."
try {
    cmd /c fvm flutter analyze --fatal-warnings
    if ($LASTEXITCODE -eq 0) {
        Write-Success "Static analysis passed"
    } else {
        throw "Static analysis failed - please fix the remaining issues manually"
    }
} catch {
    Write-Error $_
    exit 1
}

Write-Success "🎉 All code quality fixes completed successfully!"
Write-Host "Your code is now properly formatted and ready for commit." -ForegroundColor Green