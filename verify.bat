@echo off
REM Hermes Web UI - Verification Script
REM Checks all components are working correctly

setlocal EnableDelayedExpansion

echo ========================================
echo Hermes Web UI - Verification
echo ========================================
echo.

REM Check 1: Python
echo [1/8] Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python not found
    set ALL_OK=0
) else (
    echo ✅ Python: $(python --version)
)

REM Check 2: Hermes Agent
echo [2/8] Checking Hermes Agent...
set HERMES_DIR=%USERPROFILE%\AppData\Local\hermes\hermes-agent
if not exist "%HERMES_DIR%\run_agent.py" (
    echo ❌ Hermes Agent not found at %HERMES_DIR%
    set ALL_OK=0
) else (
    echo ✅ Hermes Agent found
)

REM Check 3: hermes_agent module
echo [3/8] Checking hermes_agent module...
python -c "import hermes_agent" >nul 2>&1
if errorlevel 1 (
    echo ❌ hermes_agent module not installed
    echo    Run: cd "%HERMES_DIR%" ^&^& python -m pip install -e .
    set ALL_OK=0
) else (
    echo ✅ hermes_agent module installed
)

REM Check 4: WebUI dependencies
echo [4/8] Checking WebUI dependencies...
pip show pyyaml >nul 2>&1
if errorlevel 1 (
    echo ❌ pyyaml not installed
    set ALL_OK=0
) else (
    echo ✅ pyyaml installed
)

pip show cryptography >nul 2>&1
if errorlevel 1 (
    echo ❌ cryptography not installed
    set ALL_OK=0
) else (
    echo ✅ cryptography installed
)

REM Check 5: Configuration files
echo [5/8] Checking configuration files...
set REPO_DIR=%~dp0
set REPO_DIR=%REPO_DIR:~0,-1%

if exist "%REPO_DIR%\server.py" (
    echo ✅ server.py found
) else (
    echo ❌ server.py not found
    set ALL_OK=0
)

if exist "%REPO_DIR%\start.bat" (
    echo ✅ start.bat found
) else (
    echo ❌ start.bat not found
    set ALL_OK=0
)

if exist "%REPO_DIR%\start.ps1" (
    echo ✅ start.ps1 found
) else (
    echo ❌ start.ps1 not found
    set ALL_OK=0
)

REM Check 6: WebUI server
echo [6/8] Checking WebUI server...
curl -s http://127.0.0.1:8787/health >nul 2>&1
if errorlevel 1 (
    echo ❌ WebUI server not running
    echo    Run: start.bat
    set ALL_OK=0
) else (
    echo ✅ WebUI server running
    curl -s http://127.0.0.1:8787/health | python -c "import sys, json; data=json.load(sys.stdin); print(f\"  - Status: {data['status']}\"); print(f\"  - Sessions: {data['sessions']}\"); print(f\"  - Uptime: {data['uptime_seconds']:.0f}s\")" 2>nul
)

REM Check 7: Hermes config
echo [7/8] Checking Hermes configuration...
set HERMES_CONFIG=%USERPROFILE%\AppData\Local\hermes\config.yaml
if exist "%HERMES_CONFIG%" (
    echo ✅ Config found: %HERMES_CONFIG%
) else (
    echo ⚠️  Config not found: %HERMES_CONFIG%
)

REM Check 8: Scripts
echo [8/8] Checking service scripts...
if exist "%REPO_DIR%\install-service.ps1" (
    echo ✅ install-service.ps1 found
) else (
    echo ❌ install-service.ps1 not found
    set ALL_OK=0
)

if exist "%REPO_DIR%\uninstall-service.ps1" (
    echo ✅ uninstall-service.ps1 found
) else (
    echo ❌ uninstall-service.ps1 not found
    set ALL_OK=0
)

REM Summary
echo.
echo ========================================
echo Verification Summary
echo ========================================
echo.

if "%ALL_OK%"=="0" (
    echo ❌ Some checks failed
    echo.
    echo Please fix the issues above before continuing
) else (
    echo ✅ All checks passed!
    echo.
    echo Hermes Web UI is ready to use
    echo.
    echo Quick Start:
    echo   1. Double-click start.bat
    echo   2. Open http://127.0.0.1:8787
    echo.
    echo For auto-start on boot:
    echo   Right-click PowerShell → Run as Administrator
    echo   Run: .\install-service.ps1
)

echo.
echo ========================================
echo For more information, see:
echo   - QUICKSTART-WINDOWS.md
echo   - WINDOWS.md
echo   - WINDOWS-SETUP-COMPLETE.md
echo ========================================

pause