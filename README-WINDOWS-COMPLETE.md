# 🎉 Hermes Web UI - Windows Native Adapter - Complete Guide

---

## 📋 目录

- [项目概述](#项目概述)
- [快速开始](#快速开始)
- [功能特性](#功能特性)
- [配置指南](#配置指南)
- [服务管理](#服务管理)
- [故障排除](#故障排除)
- [高级配置](#高级配置)
- [安全最佳实践](#安全最佳实践)
- [维护和更新](#维护和更新)
- [支持资源](#支持资源)

---

## 📖 项目概述

Hermes Web UI Windows Native Adapter 是官方 Hermes WebUI 的 Windows 原生环境适配版本，提供完整的图形化界面访问 Hermes Agent。

### 核心特性

✅ **三面板专业布局** - 会话、对话、文件浏览器
✅ **完整功能对等** - 与 CLI 1:1 功能对等
✅ **自动环境检测** - 自动发现 Python 和 Hermes Agent
✅ **一键开机自启** - Windows 服务管理
✅ **远程访问支持** - SSH 隧道和端口配置
✅ **完整文档** - 详细的使用和故障排除指南
✅ **开箱即用** - 无需复杂配置，双击启动

### 文件结构

```
D:\hermes-webui\
├── 📁 核心文件
│   ├── server.py                 # 主服务器
│   ├── start.bat                 # 通用批处理启动脚本 ⭐
│   ├── start.ps1                 # PowerShell 启动脚本 ⭐
│   ├── verify.bat                # 环境验证脚本 ⭐
│   ├── install-service.ps1       # Windows 服务安装 ⭐
│   └── uninstall-service.ps1     # Windows 服务卸载
│
├── 📁 配置文件
│   ├── .env.example              # 配置模板
│   └── .env                      # 用户配置（需创建）
│
├── 📁 文档
│   ├── README.md                 # 官方主文档（已更新）
│   ├── FINAL-SUMMARY.md          # 最终总结
│   ├── QUICKSTART-WINDOWS.md     # 快速开始指南
│   ├── WINDOWS.md                # Windows 详细指南
│   ├── ARCHITECTURE.md           # 架构设计
│   └── DESIGN.md                 # 设计文档
│
├── 📁 功能模块
│   ├── api/                      # API 接口
│   ├── static/                   # 前端静态文件
│   └── docs/                     # 详细文档
│
└── 📁 其他
    ├── requirements.txt          # Python 依赖
    ├── AGENTS.md                 # Agent 说明
    ├── CONTRIBUTING.md           # 贡献指南
    └── TESTING.md                # 测试指南
```

---

## 🚀 快速开始

### 方式 1：双击启动（推荐）⭐

```
双击 start.bat
```

**优点**: 最简单，无需命令行

---

### 方式 2：命令行

```batch
cd D:\hermes-webui
start.bat
```

**优点**: 可以看到详细输出

---

### 方式 3：PowerShell

```powershell
cd D:\hermes-webui
.\start.ps1
```

**优点**: 更好的错误处理，彩色输出

---

### 访问 WebUI

启动后，在浏览器中打开：
```
http://127.0.0.1:8787
```

---

## ✨ 功能特性

### 1. 自动环境检测

**自动检测项目:**
- ✅ Python 版本
- ✅ Hermes Agent 安装路径（`%USERPROFILE%\AppData\Local\hermes\hermes-agent`）
- ✅ Python 模块（hermes_agent）
- ✅ WebUI 依赖（pyyaml, cryptography）

**支持环境变量覆盖:**
```batch
set HERMES_WEBUI_AGENT_DIR=D:\custom\path
```

---

### 2. 三面板专业布局

- **左侧边栏**: 会话管理和导航
- **中间面板**: 聊天对话区
- **右侧面板**: 工作区文件浏览器
- **底部**: Composer 和控制区

---

### 3. 完整功能对等

| 功能 | CLI | WebUI | 说明 |
|------|-----|-------|------|
| 聊天对话 | ✅ | ✅ | 流式响应 |
| 会话管理 | ✅ | ✅ | 完整 CRUD |
| 文件操作 | ✅ | ✅ | 上传/下载/浏览 |
| 工具调用 | ✅ | ✅ | 实时显示 |
| Skill 管理 | ✅ | ✅ | 查看/加载 |
| Cron 任务 | ✅ | ✅ | 管理/监控 |
| 配置管理 | ✅ | ✅ | 模型/Profile |
| 系统监控 | ✅ | ✅ | 健康状态 |

---

### 4. 一键开机自启

**安装为 Windows 服务:**
```powershell
# 以管理员身份运行 PowerShell
.\install-service.ps1
```

**服务特性:**
- ✅ 自动启动（开机）
- ✅ 自动重启（崩溃后）
- ✅ 日志管理
- ✅ 状态监控

**管理命令:**
```powershell
Get-Service HermesWebUI        # 查看状态
Start-Service HermesWebUI       # 启动
Stop-Service HermesWebUI        # 停止
Restart-Service HermesWebUI     # 重启
```

---

### 5. 环境验证

**运行验证脚本:**
```batch
verify.bat
```

**检查项目:**
- Python 版本
- Hermes Agent 安装
- Python 模块
- WebUI 依赖
- 配置文件
- 服务器状态
- 脚本完整性

---

## ⚙️ 配置指南

### 创建配置文件

```batch
cd D:\hermes-webui
copy .env.example .env
notepad .env
```

---

### 常用配置选项

```env
# ========================================
# 服务器配置
# ========================================
HERMES_WEBUI_HOST=127.0.0.1
HERMES_WEBUI_PORT=8787

# ========================================
# 安全配置
# ========================================
# 设置密码以保护 WebUI（推荐用于远程访问）
HERMES_WEBUI_PASSWORD=your_secure_password

# ========================================
# Agent 配置
# ========================================
# 自动检测: %USERPROFILE%\AppData\Local\hermes\hermes-agent
# 如需自定义路径:
HERMES_WEBUI_AGENT_DIR=D:\custom\path\to\hermes-agent

# ========================================
# 工作空间配置
# ========================================
# 自动检测: %USERPROFILE%\workspace
HERMES_WORKSPACE=D:\your\workspace

# ========================================
# 调试配置
# ========================================
# HERMES_WEBUI_DEBUG=1
# HERMES_WEBUI_LOG_LEVEL=debug
```

---

### 环境变量说明

| 变量 | 默认值 | 说明 |
|------|--------|------|
| `HERMES_WEBUI_HOST` | 127.0.0.1 | 绑定地址（0.0.0.0 允许外部访问） |
| `HERMES_WEBUI_PORT` | 8787 | 监听端口 |
| `HERMES_WEBUI_PASSWORD` | 无 | 访问密码（远程访问必需） |
| `HERMES_WEBUI_AGENT_DIR` | 自动检测 | Hermes Agent 目录 |
| `HERMES_WEBUI_WORKSPACE` | 自动检测 | 工作空间目录 |
| `HERMES_WEBUI_DEBUG` | 0 | 调试模式 |
| `HERMES_WEBUI_LOG_LEVEL` | info | 日志级别 |

---

## 🔄 服务管理

### 安装服务

```powershell
# 1. 以管理员身份运行 PowerShell
# 右键 PowerShell → "以管理员身份运行"

# 2. 安装服务
.\install-service.ps1

# 3. 验证安装
Get-Service HermesWebUI
```

**服务详情:**
- **名称**: HermesWebUI
- **显示名称**: Hermes Web UI
- **启动类型**: 自动
- **状态**: 运行中

---

### 管理服务

```powershell
# 启动服务
Start-Service HermesWebUI

# 停止服务
Stop-Service HermesWebUI

# 重启服务
Restart-Service HermesWebUI

# 查看状态
Get-Service HermesWebUI

# 查看日志
notepad %USERPROFILE%\AppData\Local\hermes\webui\service.log
```

---

### 卸载服务

```powershell
# 以管理员身份运行 PowerShell
.\uninstall-service.ps1
```

**安全确认:** 脚本会提示确认，防止误操作。

---

## 🔧 故障排除

### 问题 1: 端口被占用

**症状:**
```
[Errno 10048] address already in use
```

**解决方案:**

**方法 1: 查找并结束占用进程**
```batch
# 查找占用 8787 端口的进程
netstat -ano | findstr 8787

# 结束进程（替换 <PID>）
taskkill /PID <PID> /F
```

**方法 2: 修改端口**
```env
# 在 .env 中修改
HERMES_WEBUI_PORT=9000
```

---

### 问题 2: 模块未找到

**症状:**
```
ModuleNotFoundError: No module named 'hermes_agent'
```

**解决方案:**

**自动修复（推荐）:**
```batch
cd %USERPROFILE%\AppData\Local\hermes\hermes-agent
python -m pip install -e .
```

**手动修复:**
```batch
# 1. 检查 Hermes Agent 目录
dir %USERPROFILE%\AppData\Local\hermes\hermes-agent

# 2. 安装
cd %USERPROFILE%\AppData\Local\hermes\hermes-agent
python -m pip install -e .
```

---

### 问题 3: PowerShell 执行策略

**症状:**
```
cannot be loaded because running scripts is disabled
```

**解决方案:**

**临时允许（当前会话）:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process
```

**永久允许（当前用户）:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

### 问题 4: 服务无法启动

**解决方案:**

**1. 检查服务状态**
```powershell
Get-Service HermesWebUI | Select-Object Status, StartType
```

**2. 查看服务日志**
```powershell
notepad %USERPROFILE%\AppData\Local\hermes\webui\service.log
```

**3. 手动启动测试**
```batch
cd D:\hermes-webui
start.bat
```

**4. 重新安装服务**
```powershell
.\uninstall-service.ps1
.\install-service.ps1
```

---

### 问题 5: Python 未找到

**症状:**
```
Python is not installed or not in PATH
```

**解决方案:**

**1. 安装 Python**
- 访问: https://www.python.org/downloads/
- 下载 Python 3.11 或更高版本
- 安装时勾选 "Add Python to PATH"

**2. 验证安装**
```batch
python --version
```

---

## 🔐 安全最佳实践

### 1. 设置密码

**远程访问必需:**
```env
HERMES_WEBUI_PASSWORD=***
```

### 2. 使用 SSH 隧道（推荐）

**本地访问远程服务器:**
```bash
ssh -L 8787:localhost:8787 user@remote-server
```

然后访问: `http://localhost:8787`

**优点:**
- ✅ 无需开放防火墙端口
- ✅ 加密通信
- ✅ 安全认证

---

### 3. 限制访问地址

**仅本地访问（默认）:**
```env
HERMES_WEBUI_HOST=127.0.0.1
```

**允许外部访问（需要密码）:**
```env
HERMES_WEBUI_HOST=0.0.0.0
HERMES_WEBUI_PASSWORD=*** 配置防火墙
```powershell
# 仅允许特定端口
New-NetFirewallRule -DisplayName "Hermes WebUI" -Direction Inbound -Protocol TCP -LocalPort 8787 -Action Allow
```

---

### 4. 定期备份

**备份重要数据:**
```batch
# Hermes 配置和状态
copy %USERPROFILE%\AppData\Local\hermes\config.yaml backup\
copy %USERPROFILE%\AppData\Local\hermes\*.db backup\

# WebUI 会话
copy %USERPROFILE%\AppData\Local\hermes\webui backup\
```

---

### 5. 更新依赖

**定期更新 Python 包:**
```batch
pip install --upgrade pyyaml cryptography
```

---

## 🚀 高级配置

### 自定义 Python 解释器

```batch
set HERMES_WEBUI_PYTHON=C:\Path\To\Python\python.exe
start.bat
```

---

### 多实例运行

```batch
# 实例 1（端口 8787）
set HERMES_WEBUI_PORT=8787
start cmd /k "cd D:\hermes-webui-nesquena && start.bat"

# 实例 2（端口 8788）
set HERMES_WEBUI_PORT=8788
start cmd /k "cd D:\hermes-webui-nesquena && start.bat"
```

---

### 调试模式

```env
HERMES_WEBUI_DEBUG=1
HERMES_WEBUI_LOG_LEVEL=debug
```

**查看详细日志:**
```batch
# 服务日志
notepad %USERPROFILE%\AppData\Local\hermes\webui\service.log

# 实时监控
Get-Content %USERPROFILE%\AppData\Local\hermes\webui\service.log -Wait
```

---

### 预填充消息

**静态 JSON:**
```env
HERMES_PREFILL_MESSAGES_FILE=prefill_messages.json
```

**动态脚本:**
```env
HERMES_WEBUI_PREFILL_MESSAGES_SCRIPT=python3 /path/to/notes_recall.py
HERMES_WEBUI_PREFILL_MESSAGES_SCRIPT_TIMEOUT=5
```

---

## 📈 维护和更新

### 更新 WebUI

```batch
cd D:\hermes-webui
git pull
```

---

### 更新服务（如果已安装）

```powershell
# 停止服务
Stop-Service HermesWebUI

# 更新代码
cd D:\hermes-webui-nesquena
git pull

# 更新依赖
pip install --upgrade -r requirements.txt

# 重启服务
Start-Service HermesWebUI
```

---

### 验证更新

```batch
cd D:\hermes-webui
verify.bat
```

---

### 卸载

**完全卸载:**

```powershell
# 1. 停止并卸载服务
cd D:\hermes-webui
.\uninstall-service.ps1

# 2. 删除目录
cd D:\
rmdir /s hermes-webui
```

---

## 📊 性能优化

### 1. 使用 SSD

- 将工作空间放在 SSD 上
- 减少文件操作延迟

---

### 2. 配置防火墙例外

**仅在本地使用时:**
```powershell
# 默认无需配置
```

**需要远程访问时:**
```powershell
New-NetFirewallRule -DisplayName "Hermes WebUI" -Direction Inbound -Protocol TCP -LocalPort 8787 -Action Allow
```

---

### 3. Python 内存管理

```batch
set PYTHONMALLOC=malloc
start.bat
```

---

## 📚 路径参考

### 默认路径

| 项目 | 路径 |
|------|------|
| Hermes Agent | `%USERPROFILE%\AppData\Local\hermes\hermes-agent` |
| Hermes 配置 | `%USERPROFILE%\AppData\Local\hermes\config.yaml` |
| 工作空间 | `%USERPROFILE%\workspace` |
| WebUI 状态 | `%USERPROFILE%\AppData\Local\hermes\webui` |
| 服务日志 | `%USERPROFILE%\AppData\Local\hermes\webui\service.log` |
| Sessions | `%USERPROFILE%\AppData\Local\hermes\sessions` |
| Skills | `%USERPROFILE%\AppData\Local\hermes\skills` |
| Cron 任务 | `%USERPROFILE%\AppData\Local\hermes\cron` |

### 自定义路径

```batch
# 在 .env 中或环境变量中设置
set HERMES_WEBUI_AGENT_DIR=D:\custom\hermes-agent
set HERMES_WORKSPACE=D:\custom\workspace
```

---

## 📞 支持资源

### 文档

- **本指南** - 完整使用手册 ⭐
- **FINAL-SUMMARY.md** - 安装完成总结
- **QUICKSTART-WINDOWS.md** - 快速开始指南
- **WINDOWS.md** - Windows 详细指南
- **README.md** - 官方主文档
- **ARCHITECTURE.md** - 架构设计
- **TESTING.md** - 测试指南

### 在线资源

- **GitHub Issues**: https://github.com/rgbing/hermes-webui/issues
- **Hermes Agent Docs**: https://hermes-agent.nousresearch.com/docs
- **Discord 社区**: [链接待添加]

### 故障排除

1. **运行验证脚本**: `verify.bat`
2. **查看文档**: WINDOWS.md
3. **查看日志**: `%USERPROFILE%\AppData\Local\hermes\webui\service.log`
4. **提交 Issue**: GitHub Issues

---

## 🎉 总结

### 完成的工作

✅ 官方 Hermes WebUI 集成
✅ Windows 原生环境适配
✅ 自动环境检测
✅ 通用启动脚本
✅ Windows 服务管理
✅ 完整文档
✅ 环境验证工具
✅ 配置管理

### 快速开始（3 步）

1. **双击** `start.bat`
2. **打开** `http://127.0.0.1:8787`
3. **开始** 使用！

### 开机自启（1 步）

```powershell
# 以管理员身份运行
.\install-service.ps1
```

---

**立即开始: http://127.0.0.1:8787** 🚀

**感谢使用 Hermes WebUI Windows Native Adapter!** 🎊