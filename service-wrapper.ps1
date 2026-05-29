# Service wrapper for Hermes Web UI
# This script runs as a Windows service

$ErrorActionPreference = 'Continue'
$RepoDir = 'D:\hermes-webui'
$HermesDir = 'C:\Users\giouser\AppData\Local\hermes\hermes-agent'
$LogFile = 'C:\Users\giouser\AppData\Local\hermes\webui\service.log'

# Set environment variables
$env:HERMES_WEBUI_AGENT_DIR = $HermesDir
$env:PYTHONPATH = "$HermesDir;$env:PYTHONPATH"

# Redirect all output to log file
Start-Transcript -Path $LogFile -Append

Write-Host "Starting Hermes Web UI service..."
Write-Host "Repository: $RepoDir"
Write-Host "Hermes Agent: $HermesDir"

# Load .env if exists
$EnvFile = Join-Path $RepoDir ".env"
if (Test-Path $EnvFile) {
    Get-Content $EnvFile -Encoding UTF8 | ForEach-Object {
        $line = $_.Trim()
        if ($line -and -not $line.StartsWith('#') -and $line.Contains('=')) {
            $kv = $line -split '=', 2
            $key = $kv[0].Trim()
            $value = $kv[1].Trim()
            if ($value -match '^\"(.*)\"$') { $value = $Matches[1] }
            elseif ($value -match "^'(.*)'$") { $value = $Matches[1] }
            [Environment]::SetEnvironmentVariable($key, $value)
        }
    }
}

# Change to repo directory
Push-Location $RepoDir

# Run server
try {
    $PythonPath = Join-Path $HermesDir "venv\Scripts\python.exe"
    if (-not (Test-Path $PythonPath)) {
        Write-Host "Error: Python not found at $PythonPath" -ForegroundColor Red
        exit 1
    }
    & $PythonPath server.py
} catch {
    Write-Host "Error: $_" -ForegroundColor Red
} finally {
    Stop-Transcript
    Pop-Location
}