@echo off
:: Change drive and directory to where this batch file lives
cd /d "%~dp0"

:: Execute the PowerShell script
powershell -ExecutionPolicy Bypass -File "script.ps1"