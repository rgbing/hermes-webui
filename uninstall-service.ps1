# Hermes Web UI - Windows Service Uninstaller
# Removes Hermes Web UI Windows service

$ErrorActionPreference = 'Stop'

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Hermes Web UI - Service Uninstaller" -ForegroundColor Cyan
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
$ServiceName = "HermesWebUI"
$ServiceDisplayName = "Hermes Web UI"

# Check if service exists
Write-Host "[1/3] Checking for existing service..." -ForegroundColor Yellow
$ExistingService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue

if (-not $ExistingService) {
    Write-Host "Service '$ServiceName' not found." -ForegroundColor Yellow
    Write-Host "Nothing to uninstall." -ForegroundColor Gray
    Read-Host "Press Enter to exit"
    exit 0
}

Write-Host "Service found: $ServiceDisplayName" -ForegroundColor Green

# Confirm uninstallation
Write-Host ""
$Response = Read-Host "Are you sure you want to uninstall the service? (y/n)"
if ($Response -ne 'y' -and $Response -ne 'Y') {
    Write-Host "Uninstallation cancelled." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 0
}

# Stop service if running
Write-Host "[2/3] Stopping service..." -ForegroundColor Yellow
if ($ExistingService.Status -eq 'Running') {
    try {
        Stop-Service -Name $ServiceName -Force
        Start-Sleep -Seconds 2
        Write-Host "Service stopped." -ForegroundColor Green
    } catch {
        Write-Host "Warning: Could not stop service: $_" -ForegroundColor Yellow
    }
} else {
    Write-Host "Service already stopped." -ForegroundColor Green
}

# Remove service
Write-Host "[3/3] Removing service..." -ForegroundColor Yellow
try {
    # Try NSSM first
    $NssmPath = "nssm.exe"
    $NssmAvailable = Get-Command $NssmPath -ErrorAction SilentlyContinue

    if ($NssmAvailable) {
        & $NssmPath remove $ServiceName confirm
        Write-Host "Service removed using NSSM." -ForegroundColor Green
    } else {
        # Fallback to standard Windows service removal
        Remove-Service -Name $ServiceName -Force
        Write-Host "Service removed using standard method." -ForegroundColor Green
    }

    Start-Sleep -Seconds 1

    # Verify removal
    $VerifyService = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
    if ($VerifyService) {
        Write-Host "Warning: Service may still exist. You may need to restart or use sc.exe delete." -ForegroundColor Yellow
        Write-Host "Command: sc.exe delete $ServiceName" -ForegroundColor Gray
    } else {
        Write-Host "Service successfully removed!" -ForegroundColor Green
    }
} catch {
    Write-Host "Error removing service: $_" -ForegroundColor Red
    Write-Host "You may need to manually remove using:" -ForegroundColor Yellow
    Write-Host "  sc.exe delete $ServiceName" -ForegroundColor Gray
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Uninstallation Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "The Hermes Web UI service has been removed." -ForegroundColor White
Write-Host "You can still run it manually using:" -ForegroundColor Yellow
Write-Host "  start.bat" -ForegroundColor Gray
Write-Host "  or" -ForegroundColor Gray
Write-Host "  .\start.ps1" -ForegroundColor Gray
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Read-Host "Press Enter to exit"