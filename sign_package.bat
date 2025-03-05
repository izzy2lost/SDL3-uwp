@echo off
setlocal enabledelayedexpansion

:: Get the arguments passed from the workflow
set MSIX_FILE=%1
set OUTPUT_DIR=%2
set PKGRSN_DIR=%3

:: Ensure output directory exists
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Run pkgrsn.exe with appropriate arguments
"%PKGRSN_DIR%\pkgrsn.exe" -a "%MSIX_FILE%" -o "%OUTPUT_DIR%" -p "CN=Ravbug" --skip
