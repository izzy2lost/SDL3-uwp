@echo off
setlocal enabledelayedexpansion

:: Get arguments
set "MSIX_FILE=%~1"
set "OUTPUT_DIR=%~2"
set "PKGRSN_EXE=%~3"

:: Validate paths
if not exist "%MSIX_FILE%" (
    echo ERROR: MSIX file not found at "%MSIX_FILE%"
    exit /b 1
)

if not exist "%PKGRSN_EXE%" (
    echo ERROR: pkgrsn.exe not found at "%PKGRSN_EXE%"
    exit /b 1
)

:: Ensure output directory exists
if not exist "%OUTPUT_DIR%" mkdir "%OUTPUT_DIR%"

:: Explicitly set a different output folder
set "SIGNED_MSIX=%OUTPUT_DIR%\signed_%~nx1"

:: Run signing tool (wrap in quotes to handle spaces)
"%PKGRSN_EXE%" -a "%MSIX_FILE%" -o "%OUTPUT_DIR%" -p "CN=Ravbug" --skip

:: Check for success
if %errorlevel% neq 0 (
    echo ERROR: Signing failed.
    exit /b %errorlevel%
)

echo SUCCESS: Package signed and saved to "%SIGNED_MSIX%"
exit /b 0
