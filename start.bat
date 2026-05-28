@echo off
REM Hermes Web UI - Universal Windows Launcher
REM Automatically detects Hermes Agent installation and config

setlocal EnableDelayedExpansion

echo ========================================
echo Hermes Web UI - Universal Launcher
echo ========================================
echo.

REM Use environment variables for paths
set REPO_DIR=%~dp0
set REPO_DIR=%REPO_DIR:~0,-1%

REM Auto-detect Hermes Agent directory
set HERMES_DIR=%USERPROFILE%\AppData\Local\hermes\hermes-agent

REM Allow override via environment variable
if defined HERMES_WEBUI_AGENT_DIR (
    set HERMES_DIR=%HERMES_WEBUI_AGENT_DIR%
)

REM Check Python
where python >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH
    echo Please install Python 3.11+ from https://www.python.org/
    pause
    exit /b 1
)

echo [1/4] Python found
python --version

REM Check Hermes Agent
if not exist "%HERMES_DIR%\run_agent.py" (
    echo Error: Hermes Agent not found at %HERMES_DIR%
    echo Please install Hermes Agent first
    echo.
    echo You can set HERMES_WEBUI_AGENT_DIR to override:
    echo   set HERMES_WEBUI_AGENT_DIR=custom\path
    echo.
    pause
    exit /b 1
)

echo [2/4] Hermes Agent found at: %HERMES_DIR%

REM Install Hermes Agent in editable mode
python -c "import hermes_agent" >nul 2>&1
if errorlevel 1 (
    echo [2/4] Installing Hermes Agent in editable mode...
    cd "%HERMES_DIR%"
    python -m pip install -e . -q
    if errorlevel 1 (
        echo Error: Failed to install Hermes Agent
        pause
        exit /b 1
    )
    cd "%REPO_DIR%"
    echo [2/4] Hermes Agent installed successfully
) else (
    echo [2/4] Hermes Agent already installed
)

REM Install WebUI dependencies
echo [3/4] Checking WebUI dependencies...
pip show pyyaml >nul 2>&1
if errorlevel 1 (
    echo [3/4] Installing WebUI dependencies...
    pip install pyyaml cryptography -q
    if errorlevel 1 (
        echo Error: Failed to install dependencies
        pause
        exit /b 1
    )
) else (
    echo [3/4] Dependencies already installed
)

REM Set environment variables for server
set HERMES_WEBUI_AGENT_DIR=%HERMES_DIR%
set PYTHONPATH=%HERMES_DIR%;%PYTHONPATH%

REM Load .env if exists
if exist "%REPO_DIR%\.env" (
    echo [4/4] Loading configuration from .env...
    for /f "tokens=1,* delims==" %%a in ('type "%REPO_DIR%\.env" ^| findstr /v "^#" ^| findstr /v "^$"') do (
        set %%a=%%b
    )
) else (
    echo [4/4] Starting server...
)

REM Start server
echo.
echo ========================================
echo Starting Hermes Web UI...
echo ========================================
echo.
echo Configuration:
echo   - Repository: %REPO_DIR%
echo   - Hermes Agent: %HERMES_DIR%
echo   - Config: %USERPROFILE%\AppData\Local\hermes\config.yaml
echo.
echo Access at: http://127.0.0.1:8787
echo Press Ctrl+C to stop
echo ========================================
echo.

cd "%REPO_DIR%"
python server.py

pause