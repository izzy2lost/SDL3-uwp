@echo off
setlocal enabledelayedexpansion

:: Get the arguments passed from the workflow
set "MSIX_FILE=%~1"
set "OUTPUT_DIR=%~2"
set "PKGRSN_EXE=%~3"

:: Ensure all arguments are provided
if "%MSIX_FILE%"=="" (
    echo Error: MSIX file path is missing.
    exit /b 1
)
if "%OUTPUT_DIR%"=="" (
    echo Error: Output directory is missing.
    exit /b 1
)
if "%PKGRSN_EXE%"=="" (
    echo Error: pkgrsn.exe path is missing.
    exit /b 1
)

:: Ensure output directory exists
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Run pkgrsn.exe with appropriate arguments
"%PKGRSN_EXE%" -a "%MSIX_FILE%" -o "%OUTPUT_DIR%" -p "CN=Ravbug" --skip

:: Check for success
if %errorlevel% neq 0 (
    echo Error: Signing failed.
    exit /b %errorlevel%
)

echo Signing completed successfully!
exit /b 0
