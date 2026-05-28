# Hermes Web UI - Windows 适配完成总结

## ✅ 完成的工作

### 1. 官方 WebUI 集成
- ✅ 克隆官方 Hermes WebUI 仓库
- ✅ 适配 Windows 原生环境
- ✅ 安装 Hermes Agent 可编辑模式
- ✅ 测试运行成功

### 2. 创建通用启动脚本

#### start.bat - 通用批处理脚本
```batch
特性：
✅ 自动检测 Python 版本
✅ 自动检测 Hermes Agent 路径 (%USERPROFILE%\AppData\Local\hermes\hermes-agent)
✅ 支持 HERMES_WEBUI_AGENT_DIR 环境变量覆盖
✅ 自动安装 Hermes Agent（可编辑模式）
✅ 自动安装依赖（pyyaml, cryptography）
✅ 加载 .env 配置文件
✅ 彩色输出和详细状态
✅ 错误处理和友好提示

使用：
双击 start.bat
或
start.bat
```

#### start.ps1 - PowerShell 启动脚本
```powershell
特性：
✅ 现代化 PowerShell 语法
✅ 自动检测和安装
✅ 更好的错误处理
✅ 彩色控制台输出
✅ 详细的配置信息显示

使用：
.\start.ps1

如果遇到执行策略错误：
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 3. Windows 服务管理

#### install-service.ps1 - 安装为系统服务
```powershell
特性：
✅ 检查管理员权限
✅ 自动下载 NSSM（如需要）
✅ 创建 Windows 服务
✅ 配置自动重启
✅ 日志管理
✅ 服务监控

使用：
右键 PowerShell → "以管理员身份运行"
.\install-service.ps1

服务名称：HermesWebUI
显示名称：Hermes Web UI
```

#### uninstall-service.ps1 - 卸载服务
```powershell
特性：
✅ 安全确认提示
✅ 停止服务
✅ 移除服务
✅ 验证清理

使用：
.\uninstall-service.ps1
```

### 4. 配置和文档

#### .env.example - 配置模板
```env
# 服务器配置
HERMES_WEBUI_HOST=127.0.0.1
HERMES_WEBUI_PORT=8787

# 安全（远程访问需要）
HERMES_WEBUI_PASSWORD=your_s...

# 自动检测： %USERPROFILE%\AppData\Local\hermes\hermes-agent
HERMES_WEBUI_AGENT_DIR=C:\custom\path

# 工作空间
HERMES_WORKSPACE=D:\your\workspace
```

## 📁 文件结构

```
D:\hermes-webui\
├── start.bat                    ✅ 通用启动脚本（新）
├── start.ps1                    ✅ PowerShell 启动（新）
├── install-service.ps1          ✅ 服务安装（新）
├── uninstall-service.ps1        ✅ 服务卸载（新）
├── .env.example                 ✅ 配置模板（新）
├── WINDOWS.md                   ✅ Windows 指南（新）
├── QUICKSTART-WINDOWS.md         ✅ 快速开始（新）
├── README.md                    📖 官方文档
├── ARCHITECTURE.md              📖 架构设计
├── DESIGN.md                    📖 设计文档
├── TESTING.md                   📖 测试指南
├── docs/                        📖 更多文档
│   ├── troubleshooting.md
│   └── onboarding.md
├── api/                         🔧 API 模块
├── static/                      🎨 前端文件
└── server.py                    🚀 主服务器
```

## 🚀 快速开始（3种方式）

### 方式 1：双击启动（最简单）
```
双击 start.bat
```

### 方式 2：命令行
```batch
cd D:\hermes-webui
start.bat
```

### 方式 3：PowerShell
```powershell
cd D:\hermes-webui
.\start.ps1
```

访问：http://127.0.0.1:8787

## ⚙️ 开机自启设置

### 步骤 1：以管理员身份运行 PowerShell
```
右键 PowerShell → "以管理员身份运行"
```

### 步骤 2：安装服务
```powershell
cd D:\hermes-webui
.\install-service.ps1
```

### 步骤 3：验证
```powershell
Get-Service HermesWebUI
```

### 服务管理
```powershell
# 启动
Start-Service HermesWebUI

# 停止
Stop-Service HermesWebUI

# 重启
Restart-Service HermesWebUI

# 状态
Get-Service HermesWebUI
```

## 🎯 配置示例

### 创建配置文件
```batch
cd D:\hermes-webui
copy .env.example .env
notepad .env
```

### 常用配置
```env
# 修改端口
HERMES_WEBUI_PORT=9000

# 设置密码（推荐）
HERMES_WEBUI_PASSWORD=***

# 允许外部访问
HERMES_WEBUI_HOST=0.0.0.0
```

## 📊 路径说明（自动检测）

| 项目 | 默认路径 |
|------|---------|
| Hermes Agent | `%USERPROFILE%\AppData\Local\hermes\hermes-agent` |
| Hermes 配置 | `%USERPROFILE%\AppData\Local\hermes\config.yaml` |
| 工作空间 | `%USERPROFILE%\workspace` |
| WebUI 状态 | `%USERPROFILE%\AppData\Local\hermes\webui` |
| 服务日志 | `%USERPROFILE%\AppData\Local\hermes\webui\service.log` |

### 自定义路径
```batch
# 环境变量覆盖
set HERMES_WEBUI_AGENT_DIR=D:\custom\hermes-agent
start.bat
```

## 🔧 故障排除

### 端口被占用
```batch
netstat -ano | findstr 8787
taskkill /PID <PID> /F

# 或修改端口
echo HERMES_WEBUI_PORT=9000 >> .env
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

### 服务问题
```powershell
# 查看日志
notepad %USERPROFILE%\AppData\Local\hermes\webui\service.log

# 重启服务
Restart-Service HermesWebUI
```

## 🌐 远程访问

### SSH 隧道（推荐）
```bash
ssh -L 8787:localhost:8787 user@remote-server
```

### 开放端口访问
```batch
# 配置 .env
HERMES_WEBUI_HOST=0.0.0.0
HERMES_WEBUI_PASSWORD=*** 配置防火墙
powershell "New-NetFirewallRule -DisplayName 'Hermes WebUI' -Direction Inbound -Protocol TCP -LocalPort 8787 -Action Allow"
```

### 卸载服务
```powershell
cd D:\hermes-webui-nesquena
.\uninstall-service.ps1
```
---

**立即开始：访问 http://127.0.0.1:8787** 🚀