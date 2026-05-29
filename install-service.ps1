# Hermes Web UI - Windows Service Installer
# Installs Hermes Web UI as a Windows service for auto-start on boot

$ErrorActionPreference = 'Stop'

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Hermes Web UI - Service Installer" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Host "This script requires administrator privileges." -ForegroundColor Red
    Write-Host "Please run PowerShell as Administrator." -ForegroundColor Red
    Write-Host ""
    Write-Host "Right-click PowerShell, select 'Run as Administrator'" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}

# Configuration
$RepoDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ServiceName = "HermesWebUI"
$ServiceDisplayName = "Hermes Web UI"
$ServiceDescription = "Hermes Agent Web Interface - Accessible at http://127.0.0.1:8787"

# Auto-detect Hermes Agent directory
$HermesDir = Join-Path $env:USERPROFILE "AppData\Local\hermes\hermes-agent"
if ($env:HERMES_WEBUI_AGENT_DIR) {
    $HermesDir = $env:HERMES_WEBUI_AGENT_DIR
}

# Create log directory
$LogDir = Join-Path $env:USERPROFILE "AppData\Local\hermes\webui"
if (-not (Test-Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
    Write-Host "[1/5] Created log directory: $LogDir" -ForegroundColor Green
} else {
    Write-Host "[1/5] Log directory exists: $LogDir" -ForegroundColor Green
}

# Create wrapper script for service
$WrapperScript = Join-Path $RepoDir "service-wrapper.ps1"
$WrapperContent = @"
# Service wrapper for Hermes Web UI
# This script runs as a Windows service

`$ErrorActionPreference = 'Continue'
`$RepoDir = '$RepoDir'
`$HermesDir = '$HermesDir'
`$LogFile = '$LogDir\service.log'

# Set environment variables
`$env:HERMES_WEBUI_AGENT_DIR = `$HermesDir
`$env:PYTHONPATH = "`$HermesDir;`$env:PYTHONPATH"

# Redirect all output to log file
Start-Transcript -Path `$LogFile -Append

Write-Host "Starting Hermes Web UI service..."
Write-Host "Repository: `$RepoDir"
Write-Host "Hermes Agent: `$HermesDir"

# Load .env if exists
`$EnvFile = Join-Path `$RepoDir ".env"
if (Test-Path `$EnvFile) {
    Get-Content `$EnvFile -Encoding UTF8 | ForEach-Object {
        `$line = `$_.Trim()
        if (`$line -and -not `$line.StartsWith('#') -and `$line.Contains('=')) {
            `$kv = `$line -split '=', 2
            `$key = `$kv[0].Trim()
            `$value = `$kv[1].Trim()
            if (`$value -match '^"(.*)"`$') { `$value = `$Matches[1] }
            elseif (`$value -match "^'(.*)'`$") { `$value = `$Matches[1] }
            [Environment]::SetEnvironmentVariable(`$key, `$value)
        }
    }
}

# Change to repo directory
Push-Location `$RepoDir

# Run server
try {
    $PythonPath = Join-Path $HermesDir "venv\Scripts\python.exe"
    if (-not (Test-Path $PythonPath)) {
        Write-Host "Error: Python not found at $PythonPath" -ForegroundColor Red
        exit 1
    }
    & $PythonPath server.py
} catch {
    Write-Host "Error: `$_" -ForegroundColor Red
} finally {
    Stop-Transcript
    Pop-Location
}
"@

Set-Content -Path $WrapperScript -Value $WrapperContent -Encoding UTF8
Write-Host "[2/5] Created service wrapper script" -ForegroundColor Green

# Check if service already exists
Write-Host "[3/5] Checking existing services..." -ForegroundColor Yellow
$ExistingService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if ($ExistingService) {
    Write-Host "Service '$ServiceName' already exists." -ForegroundColor Yellow
    $Response = Read-Host "Do you want to reinstall? (y/n)"
    if ($Response -eq 'y' -or $Response -eq 'Y') {
        # Stop and remove existing service
        if ($ExistingService.Status -eq 'Running') {
            Write-Host "Stopping existing service..." -ForegroundColor Yellow
            Stop-Service -Name $ServiceName -Force
            Start-Sleep -Seconds 2
        }
        Write-Host "Removing existing service..." -ForegroundColor Yellow
        sc.exe delete $ServiceName | Out-Null
        Start-Sleep -Seconds 1
        Write-Host "Existing service removed." -ForegroundColor Green
    } else {
        Write-Host "Installation cancelled." -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 0
    }
} else {
    Write-Host "No existing service found." -ForegroundColor Green
}

# Create service using NSSM (Non-Sucking Service Manager)
Write-Host "[4/5] Installing service..." -ForegroundColor Yellow

# Check if NSSM is available
$NssmPath = "nssm.exe"
$NssmAvailable = Get-Command $NssmPath -ErrorAction SilentlyContinue

if (-not $NssmAvailable) {
    # Download NSSM if not available
    Write-Host "NSSM not found. Downloading NSSM..." -ForegroundColor Yellow
    $NssmUrl = "https://nssm.cc/release/nssm-2.24.zip"
    $NssmZip = Join-Path $env:TEMP "nssm.zip"
    $NssmExtract = Join-Path $env:TEMP "nssm"

    try {
        Invoke-WebRequest -Uri $NssmUrl -OutFile $NssmZip -UseBasicParsing
        Expand-Archive -Path $NssmZip -DestinationPath $NssmExtract -Force
        $NssmPath = Join-Path $NssmExtract "nssm-2.24\win64\nssm.exe"
        Write-Host "NSSM downloaded successfully." -ForegroundColor Green
    } catch {
        Write-Host "Failed to download NSSM." -ForegroundColor Red
        Write-Host "Please install NSSM manually from https://nssm.cc/download"
        Read-Host "Press Enter to exit"
        exit 1
    }
}

# Install service
try {
    # Stop service if running
    Stop-Service -Name $ServiceName -ErrorAction SilentlyContinue

    # Remove service if exists
    sc.exe delete $ServiceName | Out-Null

    # Create service
    $Arguments = @(
        "install", $ServiceName,
        "powershell.exe",
        "-NoProfile", "-ExecutionPolicy", "Bypass", "-File", $WrapperScript
    )
    & $NssmPath @Arguments

    # Configure service
    & $NssmPath set $ServiceName DisplayName $ServiceDisplayName
    & $NssmPath set $ServiceName Description $ServiceDescription
    & $NssmPath set $ServiceName AppEnvironmentExtra "HERMES_WEBUI_AGENT_DIR=$HermesDir"
    & $NssmPath set $ServiceName AppExit "Default", "Restart"
    & $NssmPath set $ServiceName AppRestartDelay 5000

    Write-Host "Service installed successfully." -ForegroundColor Green
} catch {
    Write-Host "Failed to install service: $_" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Start service
Write-Host "[5/5] Starting service..." -ForegroundColor Yellow
try {
    Start-Service -Name $ServiceName
    Start-Sleep -Seconds 3

    $Service = Get-Service -Name $ServiceName
    if ($Service.Status -eq 'Running') {
        Write-Host "Service started successfully!" -ForegroundColor Green
    } else {
        Write-Host "Service status: $($Service.Status)" -ForegroundColor Yellow
        Write-Host "Check logs at: $LogDir\service.log" -ForegroundColor Yellow
    }
} catch {
    Write-Host "Failed to start service: $_" -ForegroundColor Red
    Write-Host "You may need to start it manually:" -ForegroundColor Yellow
    Write-Host "  Start-Service -Name $ServiceName" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Installation Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Service Details:" -ForegroundColor White
Write-Host "  Name: $ServiceName" -ForegroundColor Gray
Write-Host "  Display Name: $ServiceDisplayName" -ForegroundColor Gray
Write-Host "  Status: $( (Get-Service -Name $ServiceName).Status )" -ForegroundColor Gray
Write-Host ""
Write-Host "Access Hermes Web UI at:" -ForegroundColor White
Write-Host "  http://127.0.0.1:8787" -ForegroundColor Green
Write-Host ""
Write-Host "Service Commands:" -ForegroundColor White
Write-Host "  Start:   Start-Service $ServiceName" -ForegroundColor Gray
Write-Host "  Stop:    Stop-Service $ServiceName" -ForegroundColor Gray
Write-Host "  Restart: Restart-Service $ServiceName" -ForegroundColor Gray
Write-Host "  Status:  Get-Service $ServiceName" -ForegroundColor Gray
Write-Host ""
Write-Host "Logs: $LogDir\service.log" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to exit"