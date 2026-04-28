@echo off
setlocal

set LIVE_URL=https://buildthisnextonline.github.io/volatility-returns-explorer

echo.
echo ============================================================
echo  Volatility and Returns Explorer -- Push to GitHub
echo ============================================================
echo.

:: Check git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: git is not installed or not in PATH.
    pause
    exit /b 1
)

:: Check we are in the right folder
if not exist "volatility-returns-explorer.html" (
    echo ERROR: volatility-returns-explorer.html not found in this folder.
    echo Run this batch file from the folder containing the HTML file.
    pause
    exit /b 1
)

:: Check there is a git repo here
if not exist ".git" (
    echo ERROR: No git repository found. Run github_setup.bat first.
    pause
    exit /b 1
)

echo [1/4] Renaming to index.html for GitHub Pages...
copy /y "volatility-returns-explorer.html" "index.html" >nul
echo   Done.

echo.
echo [2/4] Staging changes...
git add index.html
git add README.md

:: Check if there is anything to commit
git diff --cached --quiet
if errorlevel 1 (
    echo.
    echo [3/4] Committing...
    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set dt=%%I
    set TIMESTAMP=%dt:~0,4%-%dt:~4,2%-%dt:~6,2% %dt:~8,2%:%dt:~10,2%
    git commit -m "Update -- %TIMESTAMP%"

    echo.
    echo [4/4] Pushing to GitHub...
    git push origin main

    echo.
    echo ============================================================
    echo  Done! Live in ~30 seconds at:
    echo  %LIVE_URL%
    echo ============================================================
    echo.
    timeout /t 5 /nobreak >nul
    start %LIVE_URL%
) else (
    echo.
    echo No changes detected -- nothing to push.
    echo Save your edits and run this file again.
)

echo.
pause
endlocal
