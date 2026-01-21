<#
.SYNOPSIS
    Flutter Development Environment Setup Script
    Usage: .\scripts\setup_dev.ps1 [install|remove|status]
#>

param (
    [string]$Command = "install"
)

$ErrorActionPreference = "Stop"

# --- Colors ---
function Write-Info($msg) { Write-Host $msg -ForegroundColor Cyan }
function Write-Success($msg) { Write-Host $msg -ForegroundColor Green }
function Write-Warning($msg) { Write-Host $msg -ForegroundColor Yellow }
function Write-ErrorMsg($msg) { Write-Host $msg -ForegroundColor Red }

# --- Functions ---

function Show-Usage {
    Write-Host "🚀 Flutter Development Environment Setup" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage: .\scripts\setup_dev.ps1 [COMMAND]"
    Write-Host ""
    Write-Host "Commands:"
    Write-Host "  install, add       Install git hooks and setup development environment"
    Write-Host "  remove, uninstall  Remove git hooks"
    Write-Host "  status             Show current git hooks status"
    Write-Host "  help               Show this help message"
    Write-Host ""
    Write-Host "Examples:"
    Write-Host "  .\scripts\setup_dev.ps1            # Install (default)"
    Write-Host "  .\scripts\setup_dev.ps1 remove     # Remove"
    Write-Host "  .\scripts\setup_dev.ps1 status     # Check status"
}

function Install-Hooks {
    Write-Info "🚀 Setting up development environment..."
    Write-Host ""

    # Check .git directory
    if (-not (Test-Path ".git")) {
        Write-ErrorMsg "❌ Error: Not a git repository. Please run this script from the project root."
        exit 1
    }

    # Check template file
    if (-not (Test-Path "scripts/pre-commit-template")) {
        Write-ErrorMsg "❌ Error: pre-commit-template not found in scripts directory."
        exit 1
    }

    # Create pre-commit hook
    Write-Warning "📝 Setting up pre-commit hook..."
    
    # Copy file
    Copy-Item -Path "scripts/pre-commit-template" -Destination ".git/hooks/pre-commit" -Force

    # On Windows, file permissions work differently, but we don't strictly need chmod +x 
    # for Git Bash to run it, as long as the shebang (#!/bin/bash) is correct.
    # However, forcing UTF8 (No BOM) encoding is safer for Bash on Windows.
    # (Optional step if copy causes encoding issues, normally Copy-Item is fine)

    Write-Success "✅ Pre-commit hook installed successfully!"
    Write-Host ""
    Write-Success "🎉 Setup completed!"
    Write-Host ""
    Write-Info "📋 What's been configured:"
    Write-Host "  ✅ Pre-commit hook that auto-formats code before each commit"
    Write-Host "  ✅ CI/CD workflows that auto-format code on push"
    Write-Host ""
    Write-Info "💡 Usage:"
    Write-Host "  • Run '.\scripts\fix_lint.ps1' to manually fix and format code"
    Write-Host "  • Code will be auto-formatted on every commit"
    Write-Host "  • CI/CD will auto-format and commit changes on push"
    Write-Host "  • Run '.\scripts\setup_dev.ps1 remove' to uninstall git hooks"
}

function Remove-Hooks {
    Write-Warning "🗑️ Removing git hooks..."
    Write-Host ""

    if (-not (Test-Path ".git")) {
        Write-ErrorMsg "❌ Error: Not a git repository."
        exit 1
    }

    if (Test-Path ".git/hooks/pre-commit") {
        Remove-Item ".git/hooks/pre-commit" -Force
        Write-Success "✅ Pre-commit hook removed successfully!"
    } else {
        Write-Warning "⚠️ Pre-commit hook not found (already removed)."
    }

    Write-Host ""
    Write-Success "🎉 Git hooks removal completed!"
    Write-Host ""
    Write-Info "💡 To reinstall git hooks, run: .\scripts\setup_dev.ps1 install"
}

function Show-Status {
    Write-Info "📊 Git Hooks Status"
    Write-Host ""

    if (-not (Test-Path ".git")) {
        Write-ErrorMsg "❌ Error: Not a git repository."
        exit 1
    }

    # Check Hook
    if (Test-Path ".git/hooks/pre-commit") {
        Write-Success "✅ Pre-commit hook: Installed"
    } else {
        Write-ErrorMsg "❌ Pre-commit hook: Not installed"
    }

    # Check Template
    if (Test-Path "scripts/pre-commit-template") {
        Write-Success "✅ Pre-commit template: Available"
    } else {
        Write-ErrorMsg "❌ Pre-commit template: Missing"
    }

    Write-Host ""
    Write-Info "💡 Available commands:"
    Write-Host "  • .\scripts\setup_dev.ps1 install"
    Write-Host "  • .\scripts\setup_dev.ps1 remove"
}

# --- Main Logic ---

switch ($Command.ToLower()) {
    "install" { Install-Hooks }
    "add"     { Install-Hooks }
    "remove"    { Remove-Hooks }
    "uninstall" { Remove-Hooks }
    "status"  { Show-Status }
    "help"    { Show-Usage }
    "-h"      { Show-Usage }
    "--help"  { Show-Usage }
    Default   { 
        if ([string]::IsNullOrWhiteSpace($Command)) {
            Install-Hooks 
        } else {
            Write-ErrorMsg "❌ Error: Unknown command '$Command'"
            Show-Usage
            exit 1
        }
    }
}