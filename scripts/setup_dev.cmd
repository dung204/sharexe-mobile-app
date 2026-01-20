@echo off
setlocal

:: Get directory of this script
SET "SCRIPT_DIR=%~dp0"

:: Call the PowerShell script
:: %1 passes the command (install/remove/status) to PowerShell
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%setup_dev.ps1" %1

endlocal