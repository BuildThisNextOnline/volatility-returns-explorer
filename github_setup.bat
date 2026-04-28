@echo off
setlocal

set REPO_URL=https://github.com/BuildThisNextOnline/volatility-returns-explorer.git
set LIVE_URL=https://buildthisnextonline.github.io/volatility-returns-explorer

echo.
echo ============================================================
echo  Volatility and Returns Explorer -- GitHub Setup
echo ============================================================
echo.

:: Check git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: git is not installed or not in PATH.
    echo Download from https://git-scm.com/download/win
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

echo [1/5] Renaming to index.html for GitHub Pages...
copy /y "volatility-returns-explorer.html" "index.html" >nul
echo   Done -- index.html created.

echo.
echo [2/5] Initialising local git repository...
git init
git checkout -b main 2>nul || git checkout main

echo.
echo [3/5] Adding files...
git add index.html
git add README.md
git add github_setup.bat
git add github_push.bat
git commit -m "Initial commit -- Volatility and Returns Explorer"

echo.
echo [4/5] Connecting to GitHub remote and pushing...
git remote remove origin 2>nul
git remote add origin %REPO_URL%
git push -u origin main

echo.
echo [5/5] Done!
echo.
echo ============================================================
echo  IMPORTANT: Enable GitHub Pages manually (one time only):
echo.
echo  1. Go to: https://github.com/BuildThisNextOnline/volatility-returns-explorer/settings/pages
echo  2. Under "Branch", select: main
echo  3. Folder: / (root)
echo  4. Click Save
echo.
echo  Your tool will be live in ~60 seconds at:
echo  %LIVE_URL%
echo.
echo  To publish updates, run github_push.bat
echo ============================================================
echo.

:: Open the GitHub Pages settings in browser
start https://github.com/BuildThisNextOnline/volatility-returns-explorer/settings/pages

pause
endlocal
