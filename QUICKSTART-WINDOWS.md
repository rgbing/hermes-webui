# Hermes Web UI - Windows Quick Start

快速开始使用 Hermes Web UI（Windows 版本）

## 快速启动（3步）

### 1. 确认环境
- Python 3.11+ 已安装
- Hermes Agent 已安装

### 2. 启动服务

**方式 A：双击运行（推荐）**
```
双击 start.bat
```

**方式 B：PowerShell**
```powershell
.\start.ps1
```

### 3. 访问界面
```
浏览器打开: http://127.0.0.1:8787
```

## 自动启动（开机自启）

### 使用服务安装器

```powershell
# 以管理员身份运行 PowerShell
# 右键 PowerShell → "以管理员身份运行"

# 安装服务
.\install-service.ps1

# 服务会自动启动
```

### 管理服务

```powershell
# 启动服务
Start-Service HermesWebUI

# 停止服务
Stop-Service HermesWebUI

# 查看状态
Get-Service HermesWebUI

# 卸载服务
.\uninstall-service.ps1
```

## 配置选项

创建 `.env` 文件（复制 `.env.example`）：

```bash
copy .env.example .env
```

常用配置：
```env
# 修改端口
HERMES_WEBUI_PORT=9000

# 设置密码（远程访问需要）
HERMES_WEBUI_PASSWORD=***

# 允许外部访问
HERMES_WEBUI_HOST=0.0.0.0
```

## 文件路径

| 项目 | 路径 |
|------|------|
| Hermes Agent | `%USERPROFILE%\AppData\Local\hermes\hermes-agent` |
| 配置文件 | `%USERPROFILE%\AppData\Local\hermes\config.yaml` |
| 服务日志 | `%USERPROFILE%\AppData\Local\hermes\webui\service.log` |
| 工作空间 | `%USERPROFILE%\workspace` |

## 故障排除

### 端口被占用
```batch
# 查找占用进程
netstat -ano | findstr 8787

# 结束进程
taskkill /PID <PID> /F
```

### 模块未找到
```batch
cd %USERPROFILE%\AppData\Local\hermes\hermes-agent
python -m pip install -e .
```

### PowerShell 执行策略
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

## 远程访问

### SSH 隧道（推荐）
```bash
ssh -L 8787:localhost:8787 user@remote-server
# 然后访问: http://localhost:8787
```

### 开放端口
```batch
# 配置 .env
HERMES_WEBUI_HOST=0.0.0.0
HERMES_WEBUI_PASSWORD=***

# 配置防火墙
powershell "New-NetFirewallRule -DisplayName 'Hermes WebUI' -Direction Inbound -Protocol TCP -LocalPort 8787 -Action Allow"

# 访问: http://YOUR_IP:8787
```

**享受使用 Hermes Web UI！** 🎉

访问: http://127.0.0.1:8787