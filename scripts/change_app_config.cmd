@echo off
setlocal

:: Get directory of this script
SET "SCRIPT_DIR=%~dp0"

:: Call the PowerShell script located in the same directory
:: -NoProfile: Starts faster without loading user profile
:: -ExecutionPolicy Bypass: Allows script to run without changing system settings
:: %*: Forwards all arguments (e.g. -Flavor develop) to the PowerShell script

powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT_DIR%change_app_config.ps1" %*

endlocal