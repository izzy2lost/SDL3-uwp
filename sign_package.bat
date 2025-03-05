@echo off
REM Navigate to the PackageRe-Sign folder
cd /d "%~dp0PackageRe-Sign (Release)"

REM Execute pkgrsn with the necessary arguments
pkgrsn.exe -a "%~dp0sdl-min_1.0.0.0_x64.msix" -o "%~dp0output" -p "CN=Ravbug" -x "auto" -s "Skip" -k

REM Pause to keep the window open for review
pause
