@echo off
setlocal enabledelayedexpansion

:: Set the directory where pkgrsn.exe is located
set PKGRSN_DIR=%~dp0

:: Set the MSIX file and output folder
set MSIX_FILE=%~dp0..\sdl-min_1.0.0.0_x64.msix
set OUTPUT_DIR=%~dp0..\output

:: Ensure output directory exists
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Run pkgrsn.exe with appropriate arguments
"%PKGRSN_DIR%\pkgrsn.exe" -a "%MSIX_FILE%" -o "%OUTPUT_DIR%" -p "CN=Ravbug" --skip
