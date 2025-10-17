# 🚀 TzzJokerzzT's NeoVim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-blue.svg)](https://lazyvim.org)
[![Linux](https://img.shields.io/badge/Linux-Optimized-yellow.svg?logo=linux)](https://github.com/TzzJokerzzT/neovim-config)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

> ✨ A modern NeoVim configuration optimized for full-stack development with advanced AI integration

**🌐 Language**: [Español](README.md) | **English**

## 📋 Table of Contents

- [🎯 Key Features](#-key-features)
- [📦 Installation](#-installation)
- [🔧 Plugins and Tools](#-plugins-and-tools)
- [⌨️ Keyboard Shortcuts](#️-keyboard-shortcuts)
- [🍅 Pomodoro System](#-pomodoro-system)
- [🤖 AI Configuration](#-ai-configuration)
- [🎨 Customization](#-customization)
- [📊 Monitoring and Productivity](#-monitoring-and-productivity)
- [🚀 Getting Started](#-getting-started)

## 🎯 Key Features

### 🌟 Highlights

- **🎨 Essex Theme (Doki Theme)** - Anime-inspired with full support
- **🤖 Multiple AI Integration** - Copilot, CodeCompanion, Avante, Claude
- **🍅 Integrated Pomodoro Timer** - Complete productivity system with Lualine
- **⚡ 50+ Optimized Plugins** - Smart lazy loading, startup < 50ms
- **📊 WakaTime Integration** - Time tracking in status bar
- **🔍 Advanced Search** - FZF, Telescope, Grug Far for maximum efficiency
- **🎯 Productivity Tools** - Harpoon, Oil, Neo-tree, ToggleTerm

### 💻 Development

- **Complete LSP** - Support for TypeScript, JavaScript, Angular, Astro, JSON, Markdown
- **Auto Formatting** - Prettier integrated with Conform
- **Smart Linting** - ESLint and nvim-lint
- **Git Integration** - Fugitive, Gitsigns, Lazygit
- **Integrated Terminal** - ToggleTerm with custom configuration

## 📦 Installation

### 📋 Prerequisites

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y \
  neovim git curl nodejs npm python3-pip \
  ripgrep fd-find build-essential

# Arch Linux
sudo pacman -S neovim git curl nodejs npm python-pip ripgrep fd

# Install Nerd Font (recommended)
# Download from: https://nerdfonts.com
```

### 🚀 Quick Installation

```bash
# 1. Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# 2. Clone this configuration
git clone https://github.com/TzzJokerzzT/neovim-config ~/.config/nvim
cd ~/.config/nvim

# 3. Start NeoVim (plugins install automatically)
nvim
```

### 🔧 Post-Installation Setup

```bash
# Setup Copilot (optional but recommended)
# In NeoVim run: :Copilot setup

# Setup WakaTime (optional)
# 1. Install CLI: https://github.com/wakatime/wakatime-cli
# 2. In NeoVim run: :WakaTimeApiKey your-api-key
```

## 🔧 Plugins and Tools

### 🎨 UI and Themes

| Plugin                                                            | Description                           | Status        |
| ----------------------------------------------------------------- | ------------------------------------- | ------------- |
| **[Doki Theme](https://github.com/doki-theme/doki-theme-vim)**    | Anime-inspired theme (default)        | ✅ Active     |
| **[Tokyo Night](https://github.com/folke/tokyonight.nvim)**       | Popular dark theme                    | ✅ Available  |
| **[Catppuccin](https://github.com/catppuccin/nvim)**              | Pastel theme                          | ✅ Available  |
| **[Lualine](https://github.com/nvim-lualine/lualine.nvim)**       | Status bar with Pomodoro and WakaTime | ✅ Customized |
| **[Bufferline](https://github.com/akinsho/bufferline.nvim)**      | Elegant buffer tabs                   | ⚠️ Disabled   |
| **[Noice](https://github.com/folke/noice.nvim)**                  | Enhanced UI for messages              | ✅ Active     |
| **[Icon Picker](https://github.com/ziontee113/icon-picker.nvim)** | Icon and emoji selector               | ✅ Active     |

### 🤖 AI and Completion

| Plugin                                                               | Description                  | Configuration     |
| -------------------------------------------------------------------- | ---------------------------- | ----------------- |
| **[GitHub Copilot](https://github.com/zbirenbaum/copilot.lua)**      | GitHub AI assistant          | `<Tab>` to accept |
| **[CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** | Chat with Copilot            | ⚠️ Disabled       |
| **[CodeCompanion](https://github.com/olimorris/codecompanion.nvim)** | Multi-model (GPT-4, Gemini)  | `<leader>ac`      |
| **[Blink.cmp](https://github.com/saghen/blink.cmp)**                 | Ultra-fast completion engine | Automatic         |

### 📁 File Management

| Plugin                                                                 | Description                 | Shortcut     |
| ---------------------------------------------------------------------- | --------------------------- | ------------ |
| **[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)**         | Modern file explorer        | `<leader>e`  |
| **[Oil](https://github.com/stevearc/oil.nvim)**                        | Edit directories as buffers | `<leader>o`  |
| **[FZF-Lua](https://github.com/ibhagwan/fzf-lua)**                     | Fuzzy finder                | `<leader>ff` |
| **[Harpoon 2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)** | Quick file navigation       | `<leader>h`  |

### 🍅 Productivity System

| Tool               | Description                        | Commands                       |
| ------------------ | ---------------------------------- | ------------------------------ |
| **Pomodoro Timer** | Complete work→standby→break system | `<leader>ps`, `:PomodoroStart` |
| **WakaTime**       | Coding time tracking               | Automatic in Lualine           |
| **ToggleTerm**     | Floating integrated terminal       | `<C-\>`                        |
| **Which-key**      | Keyboard shortcut help             | Automatic                      |

### 🔧 Development

| Plugin                                                               | Description                   | Languages             |
| -------------------------------------------------------------------- | ----------------------------- | --------------------- |
| **[Mason](https://github.com/williamboman/mason.nvim)**              | LSP/DAP/Linter manager        | All                   |
| **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** | Syntax highlighting           | 40+ languages         |
| **[LSP Config](https://github.com/neovim/nvim-lspconfig)**           | Language server configuration | TS, JS, Angular, etc. |
| **[Conform](https://github.com/stevearc/conform.nvim)**              | Code formatter                | Prettier, etc.        |

### 🐛 Debugging and Git

| Plugin                                                     | Description                                 | Shortcut                   |
| ---------------------------------------------------------- | ------------------------------------------- | -------------------------- |
| **[nvim-dap](https://github.com/mfussenegger/nvim-dap)**   | Debugging Protocol with UI and virtual text | `<leader>d*`               |
| **[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)** | Visual debugging interface                  | Automatic                  |
| **[git.nvim](https://github.com/dinhhuy258/git.nvim)**     | Advanced Git integration                    | `<leader>gb`, `<leader>go` |

## ⌨️ Keyboard Shortcuts

### 🤖 AI Integration

```
<leader>ac    - Open CodeCompanion chat
<leader>aa    - AI actions menu
<Tab>         - Accept AI suggestion
<leader>co    - Copilot panel
```

### 🍅 Pomodoro System

```
<leader>ps    - Start interactive session (work → break → standby)
<leader>pS    - Stop current session
<leader>pi    - Show information/status
<leader>pw    - Configure work time (interactive)
<leader>pb    - Configure break time (interactive)
<leader>pc    - Set default times
<leader>p1    - Quick start: 25min work, 5min break
<leader>p2    - Quick start: 45min work, 10min break
<leader>p3    - Quick start: 90min work, 20min break
```

### 📁 File Navigation

```
<leader>e     - Toggle Neo-tree
<leader>o     - Open Oil (edit directory)
<leader>ff    - Find files (FZF)
<leader>fg    - Live grep search
<leader>fr    - Recent files
<leader>h     - Mark file with Harpoon
<C-e>         - Harpoon menu
```

### 💻 Development

```
gd            - Go to definition
gr            - Go to references
K             - Show hover information
<leader>ca    - Code actions
<leader>cr    - Rename symbol
<leader>xx    - Toggle Trouble diagnostics
<leader>xw    - Workspace diagnostics
```

### 🐛 Debugging

```
<leader>d     - Debugging menu
<leader>db    - Toggle breakpoint
<leader>dB    - Conditional breakpoint
<leader>dc    - Continue execution
<leader>di    - Step into
<leader>do    - Step out
<leader>dO    - Step over
<leader>dr    - Toggle REPL
<leader>dt    - Terminate debug session
```

### 🔧 Git and Utilities

```
<leader>gb    - Git blame
<leader>go    - Open in repository/browser
<leader>gg    - Lazygit
<C-\>         - Toggle terminal
<leader>sr    - Search and replace (Grug Far)
<leader>cp    - Color picker (Minty)
<leader>si    - Icon selector (Icon Picker)
<leader>sy    - Yank selected icon
<C-i>         - Insert icon (insert mode)
<leader>uc    - Toggle colorscheme
```

## 🍅 Pomodoro System

### 🎯 Features

- **Visual Timer**: Integrated in Lualine with icons and progress
- **Complete Flow**: Work → Standby → Break → Idle
- **Flexible Configuration**: Customizable times with smart formatting
- **Notifications**: Friendly alerts for each transition
- **Interactive Commands**: Floating windows for configuration

### 📊 Timer States

| State       | Icon | Description                           |
| ----------- | ---- | ------------------------------------- |
| **Work**    | ⏰   | Active work session                   |
| **Standby** | ⏸️   | Brief transition before break         |
| **Break**   | ☕   | Well-deserved break time              |
| **Idle**    | 🍅   | Timer inactive, ready for new session |

### 🕐 Supported Time Formats

```
25           - 25 minutes
25min        - 25 minutes
1h           - 1 hour
1h30m        - 1 hour 30 minutes
90s          - 90 seconds
30           - 30 minutes
```

### 📝 Available Commands

```vim
:PomodoroStart [work] [break] [standby]  " Start with optional times
:PomodoroInteractive                     " Full interactive mode
:PomodoroWork [time]                     " Configure work (interactive)
:PomodoroBreak [time]                    " Configure break (interactive)
:PomodoroStop                            " Stop session
:PomodoroStatus                          " Show current status
:PomodoroConfig [work] [break] [standby] " Set defaults
```

## 🤖 AI Configuration

### 🔧 GitHub Copilot

```vim
" Initial setup
:Copilot setup

" Useful commands
:Copilot status    " Check status
:Copilot enable    " Enable
:Copilot disable   " Disable
```

### 💬 CodeCompanion

- **Available models**: GPT-4, Gemini 2.5 Pro, Claude
- **Interactive chat**: `<leader>ac`
- **Contextual actions**: `<leader>aa`
- **Configuration**: Auto-detects API keys in environment variables

### ⚙️ Advanced Configuration

```lua
-- Customize in lua/plugins/codecompanion.lua
{
  models = {
    ["gpt-4o"] = { name = "GPT-4O", enabled = true },
    ["gemini-2.0-flash-exp"] = { name = "Gemini 2.5 Pro", enabled = true }
  }
}
```

## 🐛 Debugging System

### 🎯 DAP Features

- **Complete Debug Adapter Protocol** with nvim-dap
- **Visual interface** with automatic nvim-dap-ui
- **Virtual text** for real-time variables
- **VSCode support** - Reads `.vscode/launch.json` configurations
- **Environment variables** - Auto-loads from `.env`

### 🔧 Debugging Setup

```json
// .vscode/launch.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch Go",
      "type": "go",
      "request": "launch",
      "mode": "auto",
      "program": "${workspaceFolder}",
      "env": {},
      "args": []
    }
  ]
}
```

### 🎮 Debug Commands

```vim
:DapToggleBreakpoint    " Toggle breakpoint on current line
:DapContinue           " Continue execution
:DapStepInto           " Step into function
:DapStepOver           " Step over
:DapTerminate          " Terminate debug session
```

### 📋 Debugging Workflow

1. **Set breakpoint**: `<leader>db` on desired line
2. **Start debugging**: `<leader>dc` to begin
3. **Navigate code**: `<leader>di/do/dO` for step into/out/over
4. **Inspect variables**: Automatic virtual text + hover with `<leader>dw`
5. **End session**: `<leader>dt` when finished

## 🎨 Customization

### 🌈 Change Theme

```vim
:colorscheme tokyonight    " Tokyo Night
:colorscheme catppuccin    " Catppuccin
:colorscheme doki-theme    " Essex (default)
```

### 🔧 Enable Bufferline

```lua
-- In lua/plugins/ui.lua, change enabled = false to enabled = true
{
  "akinsho/bufferline.nvim",
  enabled = true,  -- Change here
}
```

### 📊 Customize Lualine

Configuration includes:

- **Section A**: Vim mode
- **Section B**: Git branch + diff
- **Section C**: Filename + diagnostics
- **Section X**: Filetype + encoding
- **Section Y**: Pomodoro timer + WakaTime
- **Section Z**: Location + progress

### 🔔 Configure Notifications

```lua
-- In lua/plugins/ui.lua customize Noice
{
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
    hover = { enabled = false },
    signature = { enabled = false },
  },
}
```

## 📊 Monitoring and Productivity

### ⏱️ WakaTime Integration

1. **Install CLI**:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py | python
   ```

2. **Configure API Key**:

   ```vim
   :WakaTimeApiKey your-api-key-here
   ```

3. **Visualization**: Time appears automatically in Lualine

### 📈 Available Metrics

- **Real-time coding time**
- **Visual Pomodoro progress**
- **Completed sessions** per day
- **Most worked files and projects**

### 🎯 Custom Dashboard

Using Snacks.nvim dashboard with:

- **Recent files**
- **WakaTime statistics**
- **Quick project access**
- **System information**

## 🚀 Getting Started

### 📚 First Steps

1. **Install configuration** following the instructions
2. **Configure AI tools** (Copilot, WakaTime)
3. **Try Pomodoro**: `<leader>ps` for interactive session
4. **Explore plugins**: `<leader>ff` to find files
5. **Customize theme**: `:colorscheme` + `<Tab>` for options

### 💡 Productivity Tips

- **Use Harpoon**: Mark frequent files with `<leader>h`
- **Leverage AI**: `<leader>ac` for chat, `<Tab>` for suggestions
- **Setup Pomodoro**: Start with `<leader>p1` (25min session)
- **Integrated terminal**: `<C-\>` for quick access
- **Powerful search**: `<leader>fg` to search entire project

### 🔍 Useful Commands

```vim
:checkhealth          " Check configuration
:Lazy                 " Plugin manager
:Mason                " Install LSPs/formatters
:Telescope            " Explore all options
:WhichKey             " See all available shortcuts
```

## 🤝 Contributing

### 🐛 Report Issues

- Use the [issue tracker](https://github.com/TzzJokerzzT/neovim-config/issues)
- Include system information (`nvim --version`)
- Attach `:checkhealth` if configuration problem

### 💡 Suggest Improvements

- **Fork** the repository
- **Create** a branch: `feature/new-functionality`
- **Commit** your changes
- **Push** and create a **Pull Request**

### ⭐ Show Support

- **Star** the repository if you like it
- **Fork** for your own modifications
- **Share** with other developers

## 📄 License

This project is under the MIT License. See [LICENSE](LICENSE) for more details.

---

<div align="center">

**🚀 Made with 💜 by [TzzJokerzzT](https://github.com/TzzJokerzzT)**

_A modern NeoVim configuration for developers seeking productivity and elegance_

[![GitHub](https://img.shields.io/badge/GitHub-TzzJokerzzT-181717?logo=github)](https://github.com/TzzJokerzzT)
[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-6366f1)](https://lazyvim.org)

</div>

