     1|# Hermes Web UI（中文版）
     2|
     3|[Hermes Agent](https://hermes-agent.nousresearch.com/) is a sophisticated autonomous agent that lives on your server, accessed via a terminal or messaging apps, that remembers what it learns and gets more capable the longer it runs.
     4|
     5|Hermes WebUI is a lightweight, dark-themed web app interface in your browser for [Hermes Agent](https://hermes-agent.nousresearch.com/).
     6|Full parity with the CLI experience - everything you can do from a terminal,
     7|you can do from this UI. No build step, no framework, no bundler. Just Python
     8|and vanilla JS.
     9|
    10|## 🚀 快速开始
    11|
    12|### Windows（3步）
    13|
    14|1. **双击** `start.bat` 或在 PowerShell 中运行 `.\start.ps1`
    15|2. **打开**浏览器访问 `http://127.0.0.1:8787`
    16|3. **开始**与 Hermes 对话！
    17|
    18|**开机自启设置：**
    19|```powershell
    20|# 以管理员身份运行
    21|.\install-service.ps1
    22|```
    23|
    24|**详见 [QUICKSTART-WINDOWS.md](QUICKSTART-WINDOWS.md) 获取 Windows 详细指南。**
    25|
    26|### Linux/macOS
    27|
    28|<img width="2448" height="1748" alt="Hermes Web UI — three-panel layout" src="https://github.com/user-attachments/assets/6bf8af4c-209d-441e-8b92-6515d7a0c369" />
    29|
    30|<table>
    31|  <tr>
    32|    <td width="50%" align="center">
    33|      <img width="2940" height="1848" alt="Light mode with full profile support" src="https://github.com/user-attachments/assets/4ef3a59c-7a66-4705-b4e7-cb9148fe4c47" />
    34|      <br /><sub>Light mode with full profile support</sub>
    35|    </td>
    36|    <td width="50%" align="center">
    37|      <img alt="Customize your settings, configure a password" src="https://github.com/user-attachments/assets/941f3156-21e3-41fd-bcc8-f975d5000cb8" />
    38|      <br /><sub>Customize your settings, configure a password</sub>
    39|    </td>
    40|  </tr>
    41|</table>
    42|
    43|<table>
    44|  <tr>
    45|    <td width="50%" align="center">
    46|      <img alt="Workspace file browser with inline preview" src="docs/images/ui-workspace.png" />
    47|      <br /><sub>Workspace file browser with inline preview</sub>
    48|    </td>
    49|    <td width="50%" align="center">
    50|      <img alt="Session projects, tags, and tool call cards" src="docs/images/ui-sessions.png" />
    51|      <br /><sub>Session projects, tags, and tool call cards</sub>
    52|    </td>
    53|  </tr>
    54|</table>
    55|
    56|This gives you nearly **1:1 parity with Hermes CLI from a convenient web UI** which you can access securely through an SSH tunnel from your Hermes setup. Single command to start this up, and a single command to SSH tunnel for access on your computer. Every single part of the web UI uses your existing Hermes agent and existing models, without requiring any additional setup.
    57|
    58|---
    59|
    60|## 为什么选择 Hermes
    61|
    62|Most AI tools reset every session. They don't know who you are, what you worked on, or what
    63|conventions your project follows. You re-explain yourself every time.
    64|
    65|Hermes retains context across sessions, runs scheduled jobs while you're offline, and gets
    66|smarter about your environment the longer it runs. It uses your existing Hermes agent setup,
    67|your existing models, and requires no additional configuration to start.
    68|
    69|What makes it different from other agentic tools:
    70|
    71|- **Persistent memory** — user profile, agent notes, and a skills system that saves reusable
    72|  procedures; Hermes learns your environment and does not have to relearn it
    73|- **Self-hosted scheduling** — cron jobs that fire while you're offline and deliver results to
    74|  Telegram, Discord, Slack, Signal, email, and more
    75|- **10+ messaging platforms** — the same agent available in the terminal is reachable from your phone
    76|- **Self-improving skills** — Hermes writes and saves its own skills automatically from experience;
    77|  no marketplace to browse, no plugins to install
    78|- **Provider-agnostic** — OpenAI, Anthropic, Google, DeepSeek, OpenRouter, and more
    79|- **Orchestrates other agents** — can spawn Claude Code or Codex for heavy coding tasks and bring
    80|  the results back into its own memory
    81|- **Self-hosted** — your conversations, your memory, your hardware
    82|
    83|**vs. the field** *(landscape is actively shifting — see [docs/why-hermes.md](docs/why-hermes.md) for the full breakdown)*:
    84|
    85|| | OpenClaw | Claude Code | Codex CLI | OpenCode | Hermes |
    86||---|---|---|---|---|---|
    87|| Persistent memory (auto) | Yes | Partial† | Partial | Partial | Yes |
    88|| Scheduled jobs (self-hosted) | Yes | No‡ | No | No | Yes |
    89|| Messaging app access | Yes (15+ platforms) | Partial (Telegram/Discord preview) | No | No | Yes (10+) |
    90|| Web UI (self-hosted) | Dashboard only | No | No | Yes | Yes |
    91|| Self-improving skills | Partial | No | No | No | Yes |
    92|| Python / ML ecosystem | No (Node.js) | No | No | No | Yes |
    93|| Provider-agnostic | Yes | No (Claude only) | Yes | Yes | Yes |
    94|| Open source | Yes (MIT) | No | Yes | Yes | Yes |
    95|
    96|† Claude Code has CLAUDE.md / MEMORY.md project context and rolling auto-memory, but not full automatic cross-session recall  
    97|‡ Claude Code has cloud-managed scheduling (Anthropic infrastructure) and session-scoped `/loop`; no self-hosted cron
    98|
    99|**The closest competitor is OpenClaw** — both are always-on, self-hosted, open-source agents
   100|with memory, cron, and messaging. The key differences: Hermes writes and saves its own skills
   101|automatically as a core behavior (OpenClaw's skill system centers on a community marketplace);
   102|Hermes is more stable across updates (OpenClaw has documented release regressions and ClawHub
   103|has had security incidents involving malicious skills); and Hermes runs natively in the Python
   104|ecosystem. See [docs/why-hermes.md](docs/why-hermes.md) for the full side-by-side.
   105|
   106|---
   107|
   108|## 快速开始
   109|
   110|运行仓库引导脚本：
   111|
   112|```bash
   113|git clone https://github.com/rgbing/hermes-webui.git hermes-webui
   114|cd hermes-webui
   115|python3 bootstrap.py
   116|```
   117|
   118|或继续使用 Shell 启动器：
   119|
   120|```bash
   121|./start.sh
   122|```
   123|
   124|For self-hosted VM or homelab installs, `ctl.sh` wraps the common daemon lifecycle commands without requiring `fuser` or `pkill`:
   125|
   126|```bash
   127|./ctl.sh start              # background daemon, PID at ~/.hermes/webui.pid
   128|./ctl.sh status             # PID, uptime, bound host/port, log path, /health
   129|./ctl.sh logs --lines 100   # tail ~/.hermes/webui.log
   130|./ctl.sh restart
   131|./ctl.sh stop
   132|```
   133|
   134|`ctl.sh start` runs the bootstrap in foreground/no-browser mode behind the daemon wrapper, writes logs to `~/.hermes/webui.log`, and respects `.env` plus inline overrides such as `HERMES_WEBUI_HOST=0.0.0.0 ./ctl.sh start`.
   135|
   136|### Optional session recall prefill
   137|
   138|WebUI can attach ephemeral prefill messages to new browser-originated
   139|agent turns. This is useful when a deployment already has a local recall or
   140|router script for Joplin, Obsidian, Notion, llm-wiki, or another third-party
   141|notes source and wants browser chat to know where durable context lives.
   142|
   143|Prefer a compact router-style prefill (for example, "Joplin has the durable
   144|project context; use the available notes/search tools before answering
   145|detail-dependent questions") instead of dumping the full note corpus into every
   146|new browser session. The prefill should point the agent toward retrieval; the
   147|notes/search tools should provide the specific facts on demand.
   148|
   149|Static JSON remains supported through `prefill_messages_file` or
   150|`HERMES_PREFILL_MESSAGES_FILE`. For dynamic recall, opt in explicitly with a
   151|WebUI-specific script hook:
   152|
   153|```yaml
   154|webui_prefill_messages_script:
   155|  - python3
   156|  - /path/to/notes_recall.py
   157|webui_prefill_messages_script_timeout: 5
   158|```
   159|
   160|or:
   161|
   162|```bash
   163|HERMES_WEBUI_PREFILL_MESSAGES_SCRIPT="python3 /path/to/notes_recall.py" \
   164|HERMES_WEBUI_PREFILL_MESSAGES_SCRIPT_TIMEOUT=5 \
   165|./ctl.sh restart
   166|```
   167|
   168|The script may print either an OpenAI-style JSON message list, a JSON object with
   169|a `messages` list, or plain text; plain text is wrapped as one `system` prefill
   170|message. Script output is capped at 256 KiB before parsing. The browser only
   171|receives a compact status event (`source`, `label`, message count, and redacted
   172|errors), never the prefill message bodies.
   173|
   174|The bootstrap will:
   175|
   176|1. Detect Hermes Agent and, if missing, attempt the official installer (`curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash`).
   177|2. Find or create a Python environment with the WebUI dependencies.
   178|3. Start the web server and wait for `/health`.
   179|4. Open the browser unless you pass `--no-browser`.
   180|5. Drop you into a first-run onboarding wizard inside the WebUI.
   181|
   182|> Native Windows is not supported for this bootstrap yet. Use Linux, macOS, or WSL2.
   183|> For Windows / WSL auto-start at login, see [`docs/wsl-autostart.md`](docs/wsl-autostart.md).
   184|
   185|A community-maintained native Windows setup is documented at [@markwang2658/hermes-windows-native-guide](https://github.com/markwang2658/hermes-windows-native-guide) (companion setup repo: [@markwang2658/hermes-windows-native](https://github.com/markwang2658/hermes-windows-native)). Notes from the community report in [#1952](https://github.com/nesquena/hermes-webui/issues/1952):
   186|
   187|- **Memory:** community-measured ~330 MB native vs ~1080 MB with WSL2+Docker (varies by configuration).
   188|- **What works:** chat, workspace browser, session management, all themes.
   189|- **Known limitations:** some POSIX-style file paths surface in the workspace browser; bash-assuming agent tools may not work natively.
   190|- **Native Windows setup:** install Python 3.11+, then from the hermes-agent root in PowerShell: `python -m venv venv` → `pip install -r requirements.txt` → `pwsh .\start.ps1` (it auto-discovers `venv\Scripts\python.exe`).
   191|- **WSL2 relationship:** not a prerequisite — a WSL2-built venv (`venv/bin/python`, ELF) isn't invokable by native Windows Python, so use the native setup above. WSL2 stays useful as a parallel install if you want the full `bootstrap.py` + Linux runtime.
   192|
   193|If provider setup is still incomplete after install, the onboarding wizard will point you to finish it with `hermes model` instead of trying to replicate the full CLI setup in-browser.
   194|For a step-by-step walkthrough of the wizard, provider choices, local model server Base URLs, and safe re-runs, see [`docs/onboarding.md`](docs/onboarding.md).
   195|If an AI assistant is helping with install, reinstall, bootstrap, provider setup, or first-run support, have it read [`docs/onboarding-agent-checklist.md`](docs/onboarding-agent-checklist.md) before running commands or inspecting logs.
   196|
   197|---
   198|
   199|## Docker
   200|
   201|**预构建镜像**（amd64 + arm64）在每个版本发布时发布到 GHCR。
   202|
   203|查看 [`docs/docker.md`](docs/docker.md) 获取涵盖所有 3 个 compose 文件、常见失败模式和绑定挂载迁移的综合设置指南。README 涵盖 5 分钟快速路径。
   204|
   205|### 5分钟快速启动（单容器）
   206|
   207|最简单的设置：一个运行进程内代理的 WebUI 容器。
   208|
   209|```bash
   210|git clone https://github.com/rgbing/hermes-webui
   211|cd hermes-webui
   212|cp .env.docker.example .env
   213|# Edit .env if your host UID isn't 1000 (e.g. macOS where UIDs start at 501)
   214|docker compose up -d
   215|# Open http://localhost:8787
   216|```
   217|
   218|容器从挂载的 `~/.hermes` 卷自动检测你的 UID/GID，因此代理写入的文件在主机上仍然可读。
   219|
   220|启用密码保护（如果在 `127.0.0.1` 之外暴露端口则需要）：
   221|
   222|```bash
   223|echo "HERMES_WEBUI_PASSWORD=请更改为强密码" >> .env
   224|docker compose up -d --force-recreate
   225|```
   226|
   227|### 手动 `docker run`（无 compose）
   228|
   229|```bash
   230|docker pull ghcr.io/nesquena/hermes-webui:latest
   231|docker run -d \
   232|  -e WANTED_UID=$(id -u) -e WANTED_GID=$(id -g) \
   233|  -v ~/.hermes:/home/hermeswebui/.hermes \
   234|  -e HERMES_WEBUI_STATE_DIR=/home/hermeswebui/.hermes/webui \
   235|  -v ~/workspace:/workspace \
   236|  -p 127.0.0.1:8787:8787 \
   237|  ghcr.io/nesquena/hermes-webui:latest
   238|```
   239|
   240|### 本地构建
   241|
   242|```bash
   243|docker build -t hermes-webui .
   244|docker run -d \
   245|  -e WANTED_UID=$(id -u) -e WANTED_GID=$(id -g) \
   246|  -v ~/.hermes:/home/hermeswebui/.hermes \
   247|  -e HERMES_WEBUI_STATE_DIR=/home/hermeswebui/.hermes/webui \
   248|  -v ~/workspace:/workspace \
   249|  -p 127.0.0.1:8787:8787 \
   250|  hermes-webui
   251|```
   252|
   253|### 多容器设置
   254|
   255|如果你希望将代理和 WebUI 放在单独的容器中（出于隔离原因，或者因为你已经在其他地方运行了代理网关）：
   256|
   257|```bash
   258|# Agent + WebUI
   259|docker compose -f docker-compose.two-container.yml up -d
   260|
   261|# Agent + Dashboard + WebUI
   262|docker compose -f docker-compose.three-container.yml up -d
   263|```
   264|
   265|两个 compose 文件默认使用 **命名 Docker 卷**，从构造上解决了 UID/GID 问题。 If you need bind mounts to share an existing host directory, see [`docs/docker.md`](docs/docker.md) for the full migration recipe.
   266|
   267|> **Known limitation (#681)**: in the two-container setup, tools triggered from the WebUI run in the **WebUI container**, not the agent container. If you need git/node/etc. on the WebUI's filesystem, either use the single-container setup, extend the WebUI Dockerfile, or use the community [all-in-one image](https://github.com/sunnysktsang/hermes-suite).
   268|>
   269|> **Source boundary note (#2453)**: the multi-container setup mounts `hermes-agent-src` read-only into the WebUI by default. This prevents WebUI-side source rewrites but is still an implementation-coupling bridge, not a stable Agent API boundary. See [`docs/rfcs/agent-source-boundary.md`](docs/rfcs/agent-source-boundary.md) for the current source/API decoupling inventory.
   270|
   271|### 常见失败模式
   272|
   273|| Symptom | Likely cause | Fix |
   274||---|---|---|
   275|| `PermissionError` at startup | UID mismatch on bind mount | Set `UID=$(id -u)` in `.env` |
   276|| `.env: permission denied` (#1389) | `fix_credential_permissions()` enforced 0600 | Set `HERMES_SKIP_CHMOD=1` in `.env` |
   277|| Workspace appears empty | UID mismatch on `/workspace` mount | Set `UID=$(id -u)` in `.env` |
   278|| `git: command not found` in chat | Two-container architectural limit (#681) | Use single-container or extend Dockerfile |
   279|| WebUI can't find agent source | `hermes-agent-src` volume misconfigured | Use the named volumes from compose files as-is |
   280|| Podman shared `.hermes` fails | Podman 3.4 `keep-id` limitation | Use Podman 4+ or single-container |
   281|
   282|For the deep dive on each of these, see [`docs/docker.md`](docs/docker.md).
   283|
   284|> **Note:** By default, Docker Compose binds to `127.0.0.1` (localhost only).
   285|> To expose on a network, change the port to `"8787:8787"` in `docker-compose.yml`
   286|> and set `HERMES_WEBUI_PASSWORD` to enable authentication.
   287|
   288|---
   289|
   290|## start.sh 自动发现的内容
   291|
   292|| Thing | How it finds it |
   293||---|---|
   294|| Hermes agent dir | `HERMES_WEBUI_AGENT_DIR` env, then `$HERMES_HOME/hermes-agent` (Windows default `%LOCALAPPDATA%\hermes\hermes-agent`, POSIX default `~/.hermes/hermes-agent`), then sibling `../hermes-agent` |
   295|| Python executable | Agent venv first, then `.venv` in this repo, then system `python3` |
   296|| State directory | `HERMES_WEBUI_STATE_DIR` env, then `$HERMES_HOME/webui` (Windows default `%LOCALAPPDATA%\hermes\webui`, POSIX default `~/.hermes/webui`) |
   297|| Default workspace | `HERMES_WEBUI_DEFAULT_WORKSPACE` env, then `~/workspace`, then state dir |
   298|| Port | `HERMES_WEBUI_PORT` env or first argument, default `8787` |
   299|
   300|如果自动发现找到所有内容，则无需其他配置。
   301|
   302|---
   303|
   304|## 覆盖设置（仅在自动检测失败时需要）
   305|
   306|```bash
   307|export HERMES_WEBUI_AGENT_DIR=/path/to/hermes-agent
   308|export HERMES_WEBUI_PYTHON=/path/to/python
   309|export HERMES_WEBUI_PORT=9000
   310|export HERMES_WEBUI_AUTO_INSTALL=1  # enable auto-install of agent deps (disabled by default)
   311|./start.sh
   312|```
   313|
   314|Or inline:
   315|
   316|```bash
   317|HERMES_WEBUI_AGENT_DIR=/custom/path ./start.sh 9000
   318|```
   319|
   320|完整的环境变量列表：
   321|
   322|| Variable | Default | Description |
   323||---|---|---|
   324|| `HERMES_WEBUI_AGENT_DIR` | auto-discovered | Path to the hermes-agent checkout |
   325|| `HERMES_WEBUI_PYTHON` | auto-discovered | Python executable |
   326|| `HERMES_WEBUI_HOST` | `127.0.0.1` | Bind address (`0.0.0.0` for all IPv4, `::` for all IPv6, `::1` for IPv6 loopback) |
   327|| `HERMES_WEBUI_PORT` | `8787` | Port |
   328|| `HERMES_WEBUI_STATE_DIR` | `$HERMES_HOME/webui` (Windows default `%LOCALAPPDATA%\hermes\webui`, POSIX default `~/.hermes/webui`) | Where sessions and state are stored |
   329|| `HERMES_WEBUI_DEFAULT_WORKSPACE` | `~/workspace` | Default workspace |
   330|| `HERMES_WEBUI_DEFAULT_MODEL` | *(provider default)* | Optional model override; leave unset to use the active Hermes provider default |
   331|| `HERMES_WEBUI_PASSWORD` | *(unset)* | Set to enable password authentication |
   332|| `HERMES_WEBUI_CSP_CONNECT_EXTRA` | *(unset)* | Optional space-separated `http(s)://` or `ws(s)://` origins to append to the report-only CSP `connect-src` directive for reverse-proxy or tunnel deployments |
   333|| `HERMES_WEBUI_EXTENSION_DIR` | *(unset)* | Optional local directory served at `/extensions/`; must point to an existing directory before extension injection is enabled |
   334|| `HERMES_WEBUI_EXTENSION_SCRIPT_URLS` | *(unset)* | Optional comma-separated same-origin script URLs to inject; see [WebUI Extensions](docs/EXTENSIONS.md) |
   335|| `HERMES_WEBUI_EXTENSION_STYLESHEET_URLS` | *(unset)* | Optional comma-separated same-origin stylesheet URLs to inject; see [WebUI Extensions](docs/EXTENSIONS.md) |
   336|| `HERMES_HOME` | Windows: `%LOCALAPPDATA%\hermes`; POSIX: `~/.hermes` | Base directory for Hermes state (affects all paths) |
   337|| `HERMES_CONFIG_PATH` | `$HERMES_HOME/config.yaml` | Path to Hermes config file |
   338|
   339|---
   340|
   341|## 从远程机器访问
   342|
   343|服务器默认绑定到 `127.0.0.1`（仅回环）。如果你正在运行
   344|Hermes 在 VPS 或远程服务器上，使用从本地机器的 SSH 隧道：
   345|
   346|```bash
   347|ssh -N -L <local-port>:127.0.0.1:<remote-port> <user>@<server-host>
   348|```
   349|
   350|示例：
   351|
   352|```bash
   353|ssh -N -L 8787:127.0.0.1:8787 user@your.server.com
   354|```
   355|
   356|然后在本地浏览器中打开 `http://localhost:8787`。
   357|
   358|当 `start.sh` 检测到你正在通过 SSH 运行时，会自动为你打印此命令。
   359|通过 SSH 运行。
   360|
   361|---
   362|
   363|## 通过 Tailscale 在手机上访问
   364|
   365|[Tailscale](https://tailscale.com) is a zero-config mesh VPN built on
   366|WireGuard. Install it on your server and your phone, and they join the same
   367|private network -- no port forwarding, no SSH tunnels, no public exposure.
   368|
   369|The Hermes Web UI is fully responsive with a mobile-optimized layout
   370|(hamburger sidebar, sidebar top tabs in the drawer, touch-friendly controls),
   371|so it works well as a daily-driver agent interface from your phone.
   372|
   373|**Setup:**
   374|
   375|1. Install [Tailscale](https://tailscale.com/download) on your server and
   376|   your iPhone/Android.
   377|2. Start the WebUI listening on all interfaces with password auth enabled:
   378|
   379|```bash
   380|HERMES_WEBUI_HOST=0.0.0.0 HERMES_WEBUI_PASSWORD=your-secret ./start.sh
   381|```
   382|
   383|3. Open `http://<server-tailscale-ip>:8787` in your phone's browser
   384|   (find your server's Tailscale IP in the Tailscale app or with
   385|   `tailscale ip -4` on the server).
   386|
   387|That's it. Traffic is encrypted end-to-end by WireGuard, and password auth
   388|protects the UI at the application level. You can add it to your home screen
   389|for an app-like experience.
   390|
   391|### Community field report: ARM64 Android via AVF
   392|
   393|A community report in [#2364](https://github.com/nesquena/hermes-webui/issues/2364)
   394|documents Hermes Agent + WebUI running on a mid-range ARM64 Android phone inside
   395|a Debian 12 VM via Android Virtualization Framework (AVF). The reported setup
   396|used a Xiaomi Redmi Note 13 Pro 4G, 3.8 GiB RAM allocated to the VM, 8 visible
   397|CPU cores, Chrome on Android at `localhost:8787`, and cloud-hosted inference.
   398|
   399|This is not an official support baseline or provider/model benchmark, but it is
   400|a useful compatibility signal for mobile ARM64 experiments: the WebUI rendered
   401|smoothly in Chrome, ARM64 Debian worked for the agent stack, and the total local
   402|footprint was about 1.7 GB. Practical caveats from the report: first install can
   403|take longer when dependencies compile from source, Android browser tabs may
   404|reload when switching apps, and disabling battery optimization for the terminal
   405|or VM host may be needed for longer-running sessions.
   406|
   407|> **Tip:** If using Docker, set `HERMES_WEBUI_HOST=0.0.0.0` in your
   408|> `docker-compose.yml` environment (already the default) and set
   409|> `HERMES_WEBUI_PASSWORD`.
   410|
   411|---
   412|
   413|## 手动启动（不使用 start.sh）
   414|
   415|如果你更喜欢直接启动服务器：
   416|
   417|```bash
   418|cd /path/to/hermes-agent          # or wherever sys.path can find Hermes modules
   419|HERMES_WEBUI_PORT=8787 venv/bin/python /path/to/hermes-webui/server.py
   420|```
   421|
   422|注意：使用代理 venv Python（或任何已安装 Hermes 代理依赖的 Python 环境）。系统 Python 将缺少 `openai`、`httpx` 和其他必需的包。
   423|
   424|健康检查：
   425|
   426|```bash
   427|curl http://127.0.0.1:8787/health
   428|```
   429|
   430|---
   431|
   432|## 运行测试
   433|
   434|测试动态发现仓库和 Hermes 代理 —— 无硬编码路径。
   435|
   436|```bash
   437|cd hermes-webui
   438|pytest tests/ -v --timeout=60
   439|```
   440|
   441|或明确使用代理 venv：
   442|
   443|```bash
   444|/path/to/hermes-agent/venv/bin/python -m pytest tests/ -v
   445|```
   446|
   447|测试在具有单独状态目录的隔离服务器上运行。
   448|生产数据和真实的 cron 任务永远不会被触及。 Current snapshot:
   449|**5303 tests collected** across **488 test files**.
   450|
   451|---
   452|
   453|## 功能特性
   454|
   455|### 聊天和代理
   456|- Streaming responses via SSE (tokens appear as they are generated)
   457|- Multi-provider model support -- any Hermes API provider (OpenAI, Anthropic, Google, DeepSeek, Nous Portal, OpenRouter, MiniMax, Xiaomi MiMo, Z.AI); dynamic model dropdown populated from configured keys
   458|- Send a message while one is processing -- it queues automatically
   459|- Edit any past user message inline and regenerate from that point
   460|- Retry the last assistant response with one click
   461|- Cancel a running task directly from the composer footer (Stop button next to Send)
   462|- Tool call cards inline -- each shows the tool name, args, and result snippet; expand/collapse all toggle for multi-tool turns
   463|- Subagent delegation cards -- child agent activity shown with distinct icon and indented border
   464|- Mermaid diagram rendering inline (flowcharts, sequence diagrams, gantt charts)
   465|- Thinking/reasoning display -- collapsible gold-themed cards for Claude extended thinking and o3 reasoning blocks
   466|- Approval card for dangerous shell commands (allow once / session / always / deny)
   467|- SSE auto-reconnect on network blips (SSH tunnel resilience)
   468|- File attachments persist across page reloads and are stored outside the active workspace by default (`~/.hermes/webui/attachments/<session_id>/`, or `HERMES_WEBUI_ATTACHMENT_DIR/<session_id>/` when configured)
   469|- Message timestamps (HH:MM next to each message, full date on hover)
   470|- Code block copy button with "Copied!" feedback
   471|- Syntax highlighting via Prism.js (Python, JS, bash, JSON, SQL, and more)
   472|- Safe HTML rendering in AI responses (bold, italic, code converted to markdown)
   473|- rAF-throttled token streaming for smoother rendering during long responses
   474|- Context usage indicator in composer footer -- token count, cost, and fill bar (model-aware)
   475|
   476|### 会话
   477|- Create, rename, duplicate, delete, search by title and message content
   478|- Session actions via `⋯` dropdown per session — pin, move to project, archive, duplicate, delete
   479|- Pin/star sessions to the top of the sidebar (gold indicator)
   480|- Archive sessions (hide without deleting, toggle to show)
   481|- Session projects -- named groups with colors for organizing sessions
   482|- Session tags -- add #tag to titles for colored chips and click-to-filter
   483|- Grouped by Today / Yesterday / Earlier in the sidebar (collapsible date groups)
   484|- Download as Markdown transcript, full JSON export, or import from JSON
   485|- Sessions persist across page reloads and SSH tunnel reconnects
   486|- Browser tab title reflects the active session name
   487|- CLI session bridge -- CLI sessions from hermes-agent's SQLite store appear in the sidebar with a gold "cli" badge; click to import with full history and reply normally
   488|- Token/cost display -- input tokens, output tokens, estimated cost shown per conversation (toggle in Settings or `/usage` command)
   489|
   490|### 工作空间文件浏览器
   491|- Directory tree with expand/collapse (single-click toggles, double-click navigates)
   492|- Breadcrumb navigation with clickable path segments
   493|- Preview text, code, Markdown (rendered), and images inline
   494|- Chat links using `workspace://path/to/file` open files in the right-side preview pane
   495|- Edit, create, delete, and rename files; create folders
   496|- Binary file download (auto-detected from server)
   497|- File preview auto-closes on directory navigation (with unsaved-edit guard)
   498|- Git detection -- branch name and dirty file count badge in workspace header
   499|- Right panel is drag-resizable
   500|- Syntax highlighted code preview (Prism.js)
   501|
   502|### 语音输入
   503|- Microphone button in the composer (Web Speech API)
   504|- Tap to record, tap again or send to stop
   505|- Live interim transcription appears in the textarea
   506|- Auto-stops after ~2s of silence
   507|- Appends to existing textarea content (doesn't replace)
   508|- Hidden when browser doesn't support Web Speech API (Chrome, Edge, Safari)
   509|
   510|### 配置文件
   511|- Profile chip in the **composer footer** -- dropdown showing all profiles with gateway status and model info
   512|- Gateway status dots (green = running), model info, skill count per profile
   513|- Profiles management panel -- create, switch, and delete profiles from the sidebar
   514|- Clone config from active profile on create
   515|- Optional custom endpoint fields on create -- Base URL and API key written into the profile's `config.yaml` at creation time, so Ollama, LMStudio, and other local endpoints can be configured without editing files manually
   516|- Seamless switching -- no server restart; reloads config, skills, memory, cron, models
   517|- Per-session profile tracking (records which profile was active at creation)
   518|
   519|### 身份验证和安全
   520|- Optional password auth -- off by default, zero friction for localhost
   521|- Enable via `HERMES_WEBUI_PASSWORD` env var or Settings panel
   522|- Optional passkeys/WebAuthn -- register from Settings -> System after signing in with a password; the login page only shows passkey sign-in after at least one passkey exists
   523|- After registering at least one passkey, Settings -> System can remove the password and keep passkey-only sign-in enabled. Password auth remains the bootstrap/recovery path until you choose to go passwordless; passkeys are same-origin and stored locally in the WebUI state directory
   524|- Signed HMAC HTTP-only cookie with 24h TTL
   525|- Minimal dark-themed login page at `/login`
   526|- Security headers on all responses (X-Content-Type-Options, X-Frame-Options, Referrer-Policy)
   527|- 20MB POST body size limit
   528|- CDN resources pinned with SRI integrity hashes
   529|
   530|### 主题
   531|- Appearance is split into two axes: Theme (`system`, `dark`, `light`) and Skin
   532|  (`default`, `ares`, `mono`, `slate`, `poseidon`, `sisyphus`, `charizard`,
   533|  `sienna`, `catppuccin`, `nous`, `geist-contrast` / Geist Contrast)
   534|- Switch via Settings -> Appearance (instant live preview) or `/theme <theme-or-skin>`
   535|- Persists across reloads (server-side in settings.json + localStorage for flicker-free loading)
   536|- Skins use `data-skin` plus CSS variables; dark mode resolves through the
   537|  `.dark` class, not a `data-theme` custom-theme axis — see [THEMES.md](THEMES.md)
   538|
   539|### 设置和配置
   540|- **Hermes Control Center** (sidebar launcher button) -- Conversation tab (export/import/clear), Preferences tab (model, send key, theme, language, all toggles), System tab (version, password)
   541|- Send key: Enter (default) or Ctrl/Cmd+Enter
   542|- Show/hide CLI sessions toggle (enabled by default)
   543|- Token usage display toggle (off by default, also via `/usage` command)
   544|- Control Center always opens on the Conversation tab; resets on close
   545|- Unsaved changes guard -- discard/save prompt when closing with unpersisted changes
   546|- Cron completion alerts -- toast notifications and unread badge on Tasks tab
   547|- Background agent error alerts -- banner when a non-active session encounters an error
   548|
   549|### 斜杠命令
   550|- Type `/` in the composer for autocomplete dropdown
   551|- Built-in: `/help`, `/clear`, `/compress [focus topic]`, `/compact` (alias), `/model <name>`, `/workspace <name>`, `/new`, `/usage`, `/theme`
   552|- Arrow keys navigate, Tab/Enter select, Escape closes
   553|- Unrecognized commands pass through to the agent
   554|
   555|### 面板
   556|- **Chat** -- session list, search, pin, archive, projects, new conversation
   557|- **Tasks** -- view, create, edit, run, pause/resume, delete cron jobs; run history; completion alerts
   558|- **Skills** -- list all skills by category, search, preview, create/edit/delete; linked files viewer
   559|- **Memory** -- view and edit MEMORY.md and USER.md inline
   560|- **Profiles** -- create, switch, delete agent profiles; clone config
   561|- **Todos** -- live task list from the current session
   562|- **Spaces** -- add, rename, remove workspaces; quick-switch from topbar
   563|
   564|### 移动端响应式
   565|- Hamburger sidebar -- slide-in overlay on mobile (<640px)
   566|- Sidebar top tabs stay available on mobile; no fixed bottom nav stealing chat height
   567|- Files slide-over panel from right edge
   568|- Touch targets minimum 44px on all interactive elements
   569|- Full-height chat/composer on phones without bottom-nav spacing
   570|- Desktop layout completely unchanged
   571|
   572|---
   573|
   574|## 架构
   575|
   576|```
   577|server.py               HTTP routing shell + auth middleware (~446 lines)
   578|api/
   579|  auth.py               Optional password authentication, signed cookies (~366 lines)
   580|  config.py             Discovery, globals, model detection, reloadable config (~4139 lines)
   581|  helpers.py            HTTP helpers, security headers (~302 lines)
   582|  models.py             Session model + CRUD + CLI bridge (~1927 lines)
   583|  onboarding.py         First-run onboarding wizard, OAuth provider support (~1002 lines)
   584|  profiles.py           Profile state management, hermes_cli wrapper (~1056 lines)
   585|  routes.py             All GET + POST route handlers (~9772 lines)
   586|  state_sync.py         /insights sync — message_count to state.db (~118 lines)
   587|  streaming.py          SSE engine, run_agent, cancel support (~4420 lines)
   588|  updates.py            Self-update check and release notes (~545 lines)
   589|  upload.py             Multipart parser, file upload handler (~284 lines)
   590|  workspace.py          File ops, workspace helpers, git detection (~810 lines)
   591|static/
   592|  index.html            HTML template (~1323 lines)
   593|  style.css             All CSS incl. mobile responsive, themes (~3767 lines)
   594|  ui.js                 DOM helpers, renderMd, tool cards, context indicator (~7216 lines)
   595|  workspace.js          File preview, file ops, git badge (~369 lines)
   596|  sessions.js           Session CRUD, collapsible groups, search, reload recovery (~3517 lines)
   597|  messages.js           send(), SSE handlers, live streaming, session recovery (~2301 lines)
   598|  panels.js             Cron, skills, memory, profiles, settings (~6480 lines)
   599|  commands.js           Slash command autocomplete (~1302 lines)
   600|  boot.js               Mobile nav, voice input, boot IIFE (~1607 lines)
   601|tests/
   602|  conftest.py           Isolated test server/state fixtures
   603|  488 test files         5303 tests collected
   604|Dockerfile              python:3.12-slim container image
   605|docker-compose.yml      Compose with named volume and optional auth
   606|.github/workflows/      CI: multi-arch Docker build + GitHub Release on tag
   607|```
   608|
   609|状态默认存储在仓库外部的 `~/.hermes/webui/`
   610|(sessions, workspaces, settings, projects, last_workspace). Override with `HERMES_WEBUI_STATE_DIR`.
   611|
   612|---
   613|
   614|## 文档
   615|
   616|- `docs/why-hermes.md` -- why Hermes, mental model, and detailed comparison to Claude Code / Codex / OpenCode / Cursor
   617|- `ROADMAP.md` -- feature roadmap and sprint history
   618|- `ARCHITECTURE.md` -- system design, all API endpoints, implementation notes
   619|- `TESTING.md` -- manual browser test plan and automated coverage reference
   620|- `CHANGELOG.md` -- release notes per sprint
   621|- `SPRINTS.md` -- forward sprint plan with CLI + Claude parity targets
   622|- `THEMES.md` -- theme system documentation, custom theme guide
   623|- `docs/CONTRACTS.md` -- project contract/RFC/design index for contributors and agents
   624|- `docs/UIUX-GUIDE.md` -- UI/UX principles sourced from existing design docs and visual inventories
   625|- `docs/docker.md` -- Docker compose setup, common failures, and bind-mount migration
   626|- `docs/supervisor.md` -- launchd, systemd, supervisord, runit, and s6 process-supervisor setup
   627|- `docs/onboarding.md` -- first-run wizard, provider setup, local model server Base URLs, and safe re-runs
   628|- `docs/onboarding-agent-checklist.md` -- safety rules, evidence commands, and pass/fail checks for assistant-led install or reinstall support
   629|- `docs/troubleshooting.md` -- diagnostic flows for common failures (e.g. "AIAgent not available")
   630|- `docs/wsl-autostart.md` -- WSL2 auto-start at Windows login
   631|- `docs/EXTENSIONS.md` -- administrator-controlled WebUI extension injection
   632|- `docs/rfcs/README.md` -- RFC index for larger architecture and durability proposals
   633|
   634|## 贡献者
   635|
   636|Hermes WebUI 在开源社区的帮助下构建。每一个 PR —— 无论是直接合并、被吸收到批量发布中，还是从更大的提案中挽救出来 —— 都塑造了这个项目，我们感谢每一个花时间贡献的人。
   637|
   638|**137 contributors have shipped code that landed in a release tag** as of v0.51.58. The full credit roll lives in [`CONTRIBUTORS.md`](CONTRIBUTORS.md). The highlights:
   639|
   640|### 顶级贡献者（按 PR 数量，包括吸收/批量发布的工作）
   641|
   642|| # | Contributor | PRs | First → latest release |
   643||---|---|---:|---|
   644|| 1 | [@franksong2702](https://github.com/franksong2702) | 117 | `v0.49.3` → `v0.51.58` |
   645|| 2 | [@Michaelyklam](https://github.com/Michaelyklam) | 92 | `v0.50.240` → `v0.51.57` |
   646|| 3 | [@bergeouss](https://github.com/bergeouss) | 62 | `v0.48.0` → `v0.51.46` |
   647|| 4 | [@ai-ag2026](https://github.com/ai-ag2026) | 55 | `v0.50.279` → `v0.51.47` |
   648|| 5 | [@dso2ng](https://github.com/dso2ng) | 23 | `v0.50.227` → `v0.51.51` |
   649|| 6 | [@jasonjcwu](https://github.com/jasonjcwu) | 16 | `v0.50.227` → `v0.51.55` |
   650|| 7 | [@Jordan-SkyLF](https://github.com/Jordan-SkyLF) | 12 | `v0.50.18` → `v0.51.58` |
   651|| 8 | [@aronprins](https://github.com/aronprins) | 10 | `v0.44.0` → `v0.50.233` |
   652|| 9 | [@JKJameson](https://github.com/JKJameson) | 10 | `v0.50.233` → `v0.51.31` |
   653|| 10 | [@starship-s](https://github.com/starship-s) | 10 | `v0.50.128` → `v0.51.58` |
   654|
   655|查看 [`CONTRIBUTORS.md`](CONTRIBUTORS.md) 获取所有 137 位贡献者的完整排名列表，包括只有一两个 PR 的人以及设计和架构贡献的特别致谢。
   656|
   657|### 重要贡献
   658|
   659|**[@franksong2702](https://github.com/franksong2702)** — Most prolific external contributor (117 PRs, `v0.49.3` → `v0.51.58`)
   660|Across the longest tenure of any external contributor: the session title guard (#301), breadcrumb workspace navigation (#302), embedded workspace terminal (#1099), worktree-backed session creation (#2053), onboarding documentation (#2052), composer footer container queries, streaming-session sidebar exemption (#1327), session sidecar repair, cron output preservation (#1295), profile default workspace persistence, manual `/compress` async start/status endpoints (#2128), worktree status surface (#2109) + guarded remove (#2156) for the lifecycle umbrella #2057, session post-render dedup (#2166), native-WebUI fast path (#2170), tail-window response trim (#2171), stale-stream guard extension (#2158), CSP report collector (#2160), and a long tail of polish across mobile/responsive, the session sidebar, and the workspace state machine.
   661|
   662|**[@Michaelyklam](https://github.com/Michaelyklam)** — Most prolific contributor of recent releases (92 PRs, `v0.50.240` → `v0.51.57`)
   663|Production Docker hardening (#1921, drops sudo-capable staging user), profile-scoped skills endpoints (#1903), gateway PID resolution under profile-scoped HERMES_HOME (#1901), profile-aware AIAgent cache (#1898/#1904), backslash LaTeX delimiters (#1848), Codex quota error surfacing (#1770), shell-route HTML 503 (#1836), stale Kanban client recovery (#1828), context auto-compression toast lifetime (#1988), `/goal` command (#1866), Kanban detail-view scrolling (#1916), CLI session tool metadata preservation (#1778), Traditional Chinese kanban locale backfill (#1979), v0.51.51 mobile Insights bucketing/layout (#2120/#2121), Hermes run adapter RFC (#2105 for #1925), fork-from-here absolute index (#2198 for #2184), opencode-go custom-provider overlap routing (#2204 for #1894).
   664|
   665|**[@bergeouss](https://github.com/bergeouss)** — Provider management UI + Docker hardening (62 PRs, `v0.48.0` → `v0.51.46`)
   666|Provider management UI for adding/editing custom providers from Settings, OAuth provider status detection (#1552), two-container Docker setup, profile isolation hardening (per-profile `.env` secrets), the bulk of what users see when they touch Settings → Providers, Reveal-in-Finder context menu (#1551), gateway status card (#1552), auto-assign session to active project filter (#1550), "What's new?" link in update banner (#1549), OpenRouter free-tier live fetch (#1548), credential pool 401 self-heal (#1553), inline provider chip + group model count in model picker (#1644).
   667|
   668|**[@ai-ag2026](https://github.com/ai-ag2026)** — Session recovery + audit infrastructure (55 PRs, `v0.50.279` → `v0.51.47`)
   669|Autonomous-AI contributor (Hermes Agent-driven) focused on durability: `state.db`-backed sidecar reconciliation (#2041), orphan `.json.bak` recovery on startup (#2035), read-only session recovery audit endpoints (#2036, #2040), active run lifecycle in `/health` (#2039), crash-safe turn-journal RFC at `docs/rfcs/turn-journal.md` (#2042), append-only turn-journal helper (#2059), lifecycle events layer (#2062), `Content-Security-Policy-Report-Only` header (#2084), per-cron toast toggle (#2100), fork-session compression lineage isolation (#2014).
   670|
   671|**[@dso2ng](https://github.com/dso2ng)** — Session lineage + diagnostics (23 PRs, `v0.50.227` → `v0.51.51`)
   672|`/api/session/lineage-report/<sid>` endpoint for bounded session graph diagnostics (#2012), stale Mermaid render error cleanup (#1337), `session_source="fork"` continuation-chain isolation (#2063), lazy lineage-report fetch on sidebar badge expand (#2130), and a long tail of frontend reliability fixes around session loading.
   673|
   674|**[@jasonjcwu](https://github.com/jasonjcwu)** — Composer + transcript polish (16 PRs, `v0.50.227` → `v0.51.55`)
   675|Sidebar collapse via active-rail click (#2054, fuses #1884 + #1924), composer chip lightbox (#1758), title fixes for tool-heavy first turns, silent compress-status during session switch (#2185), concurrent-send loss fix (#2186), in-transcript steer message badges (#2187), and a string of frontend polish fixes.
   676|
   677|**[@Jordan-SkyLF](https://github.com/Jordan-SkyLF)** — Live streaming + UX polish (12 PRs, `v0.50.18` → `v0.51.58`)
   678|Original sprint of workspace fallback resolution, live reasoning cards (#366, #367, #394–#397), then a recent burst: manual "Refresh usage" button on the Provider quota card (#2150), cancelled-turn status classification (#2151), Firefox sidebar scroll stabilization (#2200), early provisional session titles (#2202), target-aware "What's new?" update-banner links (#2207), and MCP tools overflow fix in Settings (#2210).
   679|
   680|**[@aronprins](https://github.com/aronprins)** — `v0.50.0` UI overhaul (PR #242, plus 9 follow-ups)
   681|The biggest single contribution to the project: a complete UI redesign that moved model/profile/workspace controls into the composer footer, replaced the gear-icon settings panel with the Hermes Control Center (tabbed modal), removed the activity bar in favor of inline composer status, redesigned the session list with a `⋯` action dropdown, and added the workspace panel state machine. Plus chat transcript redesign (#587), sidebar declutter (#584), three-column layout refactor (#899), light/dark theme + accent skins (#627), and shared `confirm()`/`prompt()` dialog replacement (PR #251 extracted from #242).
   682|
   683|**[@iRonin](https://github.com/iRonin)** — Security hardening sprint (PRs #196–#204)
   684|Six consecutive, focused security PRs: session memory leak fix (expired token pruning), CSP + Permissions-Policy headers, 30-second slow-client connection timeout, optional HTTPS/TLS support via environment variables, upstream branch tracking fix for self-update, and CLI session support in the file-browser API. The kind of focused, high-quality security work that makes a self-hosted tool trustworthy.
   685|
   686|**[@lucasrc](https://github.com/lucasrc)** — Auth-hardening trilogy (PRs #2191, #2192, #2193)
   687|Three coordinated security PRs that all landed in v0.51.57: thread-safe login rate limiter with PBKDF2 key separation, password-hash cache invalidation on Settings save, and the full 64-char HMAC-SHA256 session signature with a backwards-compatible migration bridge. The kind of cleanly-decomposed security work that's reviewable as three independent pieces.
   688|
   689|**[@LumenYoung](https://github.com/LumenYoung)** — Streaming hot-path correctness (4 PRs, `v0.51.47` → `v0.51.55`)
   690|The original stale-stream writeback guard (#2136 — the bug class the next two releases extended), gateway-state alive-null classification (#2075), compression-banner anchor alignment (#2182), and context-progress ring auto-refresh on compression complete (#2188). Each PR opened a small surgical fix in one of the most fragile subsystems in the codebase.
   691|
   692|**[@dobby-d-elf](https://github.com/dobby-d-elf)** — Frontend reliability + motion polish (6 PRs, `v0.51.38` → `v0.51.58`)
   693|Workspace fallback on deleted directories (#2138), iPhone PWA bottom-scroll fix (#2143), the new "Activity: X tools" composer footer shimmer animation (#2203), and follow-up animation tuning (#2212).
   694|
   695|**[@JKJameson](https://github.com/JKJameson)** — Composer + session polish (10 PRs)
   696|Persistent composer draft per session (#1956), and a long tail of polish across the composer and session sidebar.
   697|
   698|**[@gabogabucho](https://github.com/gabogabucho)** — Spanish locale + onboarding wizard
   699|Full Spanish (`es`) locale covering all UI strings, plus the one-shot bootstrap onboarding wizard that guides new users through provider setup on first launch.
   700|
   701|**[@deboste](https://github.com/deboste)** — Reverse-proxy auth + mobile responsive layout (PRs #3, #4, #5)
   702|Three of the very first community PRs: fixed EventSource/fetch to use URL origin for reverse-proxy setups, corrected model provider routing from config, and added mobile responsive layout with dvh viewport fix. Early foundation work.
   703|
   704|**[@indigokarasu](https://github.com/indigokarasu)** — Visual redesign proposal (PR #213)
   705|A CSS-only redesign of the full UI — proper design tokens, an icon rail sidebar replacing the emoji tab strip, consistent form cards, breadcrumb nav, and 7 built-in themes as custom properties. The PR didn't merge as-is but shaped the design language and theme architecture that shipped in v0.50.0.
   706|
   707|**[@zenc-cp](https://github.com/zenc-cp)** — Anti-hallucination guard for the ReAct loop (PR #133)
   708|A three-layer approach (ephemeral anti-hallucination prompt, live token filtering, session-history cleanup) that the streaming pipeline still uses.
   709|
   710|**[@Hinotoi-agent](https://github.com/Hinotoi-agent)** — Profile + session security (PRs #351, #2048)
   711|Profile `.env` secret isolation fix (PR #351) preventing API key leakage between profiles, and session-import workspace validation (PR #2048) blocking a crafted-JSON file-read against `/`.
   712|
   713|**[@Sanjays2402](https://github.com/Sanjays2402)** — Endless-scroll + Start-jump race fix (PR #1949)
   714|A generation-token + mutex pair fixing the v0.51.30 race between endless-scroll prefetch and Start-jump's `_ensureAllMessagesLoaded`. The naive same-flag-check approach (proposed in #1942 and #1962) was a no-op for the post-await race — Sanjays2402's fix was the correct shape.
   715|
   716|**[@fxd-jason](https://github.com/fxd-jason)** — Real-time approval + clarify via SSE (PRs #1350, #1355)
   717|Replaced 1.5s HTTP polling with SSE long-connections for both approval and clarify, cutting latency from up to 1.5s to near-instant. Got all the correctness details right (atomic subscribe + snapshot, notify-inside-lock, head-of-queue payload, trailing event re-emission).
   718|
   719|**[@happy5318](https://github.com/happy5318)** — Custom provider model dedup (PR #1947)
   720|Fixed the same model from different named custom providers being silently deduplicated in the picker, with Opus catching a race in the original tests that needed augmentation.
   721|
   722|**[@NocGeek](https://github.com/NocGeek)** — Streaming scroll + manual cron output persistence (7 PRs)
   723|Streaming scroll viewport stability when tool/queue cards insert (#1360), manual cron-run output and metadata persistence (#1372, split from held #1352).
   724|
   725|**[@DavidSchuchert](https://github.com/DavidSchuchert)** — German translation (PR #190)
   726|Complete German locale (`de`) covering all UI strings, settings labels, commands, and system messages — and stress-tested the i18n system, exposing several elements that weren't yet translatable and getting them fixed as part of the same PR.
   727|
   728|**[@Bobby9228](https://github.com/Bobby9228)** — Mobile Profiles button (PR #265)
   729|Added the Profiles entry to the mobile navigation flow, making profile switching reachable on phones.
   730|
   731|**[@kevin-ho](https://github.com/kevin-ho)** — OLED theme (PR #168)
   732|The 7th built-in theme: pure black backgrounds with warm accents tuned to reduce burn-in risk.
   733|
   734|**[@andrewy-wizard](https://github.com/andrewy-wizard)** — Chinese localization (PR #177)
   735|Initial Simplified Chinese (`zh`) locale. One of the first non-English locales.
   736|
   737|**[@DelightRun](https://github.com/DelightRun)** — `session_search` fix for WebUI sessions (PR #356)
   738|Tracked down the missing `SessionDB` injection in the streaming path that was silently breaking the tool for every WebUI session.
   739|
   740|**[@lawrencel1ng](https://github.com/lawrencel1ng)** — Bandit security fixes (PR #354)
   741|Systematic bandit-scan fixes: URL scheme validation before `urlopen`, MD5 `usedforsecurity=False`, and 40+ bare `except: pass` blocks replaced with proper logging.
   742|
   743|**[@shaoxianbilly](https://github.com/shaoxianbilly)** — Unicode filename downloads (PR #378)
   744|Proper `Content-Disposition` with RFC 5987 `filename*=UTF-8''...` encoding so non-ASCII filenames download without crashing.
   745|
   746|**[@lx3133584](https://github.com/lx3133584)** — CSRF fix for reverse proxy (PR #360)
   747|A real-world blocker for anyone hosting behind Nginx Proxy Manager or similar on a port other than 80/443.
   748|
   749|**[@betamod](https://github.com/betamod)** — Security audit (PR #171)
   750|A comprehensive CSRF / SSRF / XSS / env-race-condition audit that shipped in v0.39.0.
   751|
   752|**[@TaraTheStar](https://github.com/TaraTheStar)** — Bot name + thinking blocks + login refactor (PRs #132, #176, #181)
   753|Configurable assistant display name, thinking/reasoning block display, and a login page refactor.
   754|
   755|## 仓库
   756|
   757|```
   758|git@github.com:nesquena/hermes-webui.git
   759|```
   760|