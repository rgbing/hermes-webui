# Hermes Web UI - Windows Setup Guide

## Prerequisites

- Windows 10 or Windows 11
- Python 3.11 or higher
- Hermes Agent installed

## Installation

### 1. Install Hermes Agent

Hermes Agent should be installed in your local AppData:
```
%USERPROFILE%\AppData\Local\hermes\hermes-agent
```

If installed elsewhere, set `HERMES_WEBUI_AGENT_DIR` environment variable.

### 2. Clone Repository

```bash
git clone https://github.com/rgbing/hermes-webui.git
cd hermes-webui
```

### 3. Start WebUI

#### Option A: Batch Script (Recommended)

Double-click `start.bat` or run from command prompt:
```batch
start.bat
```

#### Option B: PowerShell Script

```powershell
.\start.ps1
```

If you get execution policy error:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## Configuration

### Using .env File

Copy `.env.example` to `.env` and customize:

```bash
copy .env.example .env
```

Edit `.env` to configure:
- Server host and port
- Password protection
- Agent directory
- Workspace directory

### Environment Variables

You can also set environment variables:

```batch
set HERMES_WEBUI_PORT=9000
set HERMES_WEBUI_PASSWORD=your_s...HERMES_WEBUI_AGENT_DIR=custom\path
```

## Installation as Windows Service

### Auto-Start on Boot

To start WebUI automatically when Windows starts:

1. **Run as Administrator**
   - Right-click PowerShell
   - Select "Run as Administrator"

2. **Install Service**
   ```powershell
   .\install-service.ps1
   ```

3. **Verify Installation**
   ```powershell
   Get-Service HermesWebUI
   ```

### Service Management

```powershell
# Start service
Start-Service HermesWebUI

# Stop service
Stop-Service HermesWebUI

# Restart service
Restart-Service HermesWebUI

# Check status
Get-Service HermesWebUI

# View logs
notepad %USERPROFILE%\AppData\Local\hermes\webui\service.log
```

### Uninstall Service

```powershell
.\uninstall-service.ps1
```

## Access

Open your browser and navigate to:
```
http://127.0.0.1:8787
```

If you set a custom port:
```
http://127.0.0.1:CUSTOM_PORT
```

## Troubleshooting

### Port Already in Use

If you get "Address already in use" error:

```batch
# Find process using port 8787
netstat -ano | findstr 8787

# Kill the process (replace PID)
taskkill /PID <PID> /F
```

Or change the port in `.env`:
```
HERMES_WEBUI_PORT=9000
```

### Module Not Found Error

If you see "ModuleNotFoundError: No module named 'hermes_agent'":

The start scripts automatically install Hermes Agent in editable mode.
If it fails, manually run:

```batch
cd %USERPROFILE%\AppData\Local\hermes\hermes-agent
python -m pip install -e .
```

### Service Won't Start

1. Check service status:
   ```powershell
   Get-Service HermesWebUI | Select-Object Status, StartType
   ```

2. View service logs:
   ```powershell
   notepad %USERPROFILE%\AppData\Local\hermes\webui\service.log
   ```

3. Try manual start:
   ```powershell
   .\start.bat
   ```

### PowerShell Execution Policy

If blocked by execution policy:

```powershell
# Allow current user scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Or bypass for this session
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

## Remote Access

### Enable Network Access

To access from other devices:

1. **Set host to all interfaces**
   ```
   HERMES_WEBUI_HOST=0.0.0.0
   ```

2. **Set a password** (Required for network access)
   ```
   HERMES_WEBUI_PASSWORD=your_s...
   ```

3. **Configure Windows Firewall**
   ```powershell
   New-NetFirewallRule -DisplayName "Hermes WebUI" -Direction Inbound -Protocol TCP -LocalPort 8787 -Action Allow
   ```

4. **Access from other devices**
   ```
   http://YOUR_COMPUTER_IP:8787
   ```

### SSH Tunnel (Recommended)

For secure access without opening firewall ports:

```bash
ssh -L 8787:localhost:8787 user@remote-server
```

Then access locally:
```
http://localhost:8787
```

## File Paths

Default paths used by the scripts:

| Item | Path |
|------|------|
| Hermes Agent | `%USERPROFILE%\AppData\Local\hermes\hermes-agent` |
| Hermes Config | `%USERPROFILE%\AppData\Local\hermes\config.yaml` |
| WebUI State | `%USERPROFILE%\AppData\Local\hermes\webui` |
| Workspace | `%USERPROFILE%\workspace` |
| Service Logs | `%USERPROFILE%\AppData\Local\hermes\webui\service.log` |

## Performance Tips

1. **Use SSD** for faster file operations
2. **Disable antivirus scanning** on hermes directories (if safe)
3. **Increase Python memory limit** for large sessions:
   ```batch
   set PYTHONMALLOC=malloc
   ```

## Security Best Practices

1. **Always set a password** for network access
2. **Use SSH tunnel** instead of opening firewall ports
3. **Keep Python and dependencies updated**
4. **Regularly backup** `~/.hermes` directory
5. **Review service logs** regularly

## Updating

```batch
git pull
pip install -r requirements.txt --upgrade
```

If installed as service:
```powershell
Stop-Service HermesWebUI
git pull
pip install -r requirements.txt --upgrade
Start-Service HermesWebUI
```

## Advanced Configuration

### Custom Python Interpreter

If you need to use a specific Python version:

```batch
set HERMES_WEBUI_PYTHON=C:\Path\To\Python\python.exe
start.bat
```

### Multiple Instances

Run multiple instances by using different ports:

```batch
# Instance 1
set HERMES_WEBUI_PORT=8787
start cmd /k "start.bat"

# Instance 2
set HERMES_WEBUI_PORT=8788
start cmd /k "start.bat"
```

### Log Levels

Enable debug logging:

```batch
set HERMES_WEBUI_LOG_LEVEL=debug
start.bat
```

## Uninstall

```batch
# Stop and remove service (if installed)
.\uninstall-service.ps1

# Remove repository folder
rmdir /s hermes-webui
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.