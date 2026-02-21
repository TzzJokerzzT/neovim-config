# TzzJokerzzT's NeoVim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-blue.svg)](https://lazyvim.org)
[![Linux](https://img.shields.io/badge/Linux-Optimized-yellow.svg?logo=linux)](https://github.com/TzzJokerzzT/neovim-config)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

> A modern NeoVim configuration optimized for full-stack development with advanced AI integration

**Language**: [Espanol](README.md) | **English**

## Table of Contents

- [Key Features](#key-features)
- [Installation](#installation)
- [Plugins and Tools](#plugins-and-tools)
- [Keyboard Shortcuts](#keyboard-shortcuts)
- [Pomodoro System](#pomodoro-system)
- [AI Configuration](#ai-configuration)
- [Gamification System (Triforce)](#gamification-system-triforce)
- [Customization](#customization)
- [Monitoring and Productivity](#monitoring-and-productivity)
- [Getting Started](#getting-started)

## Key Features

### Highlights

- **C. Viper Custom Theme** - Custom colorscheme inspired by Street Fighter with transparency
- **AI Integration** - GitHub Copilot + OpenCode (chat, actions, operator)
- **Integrated Pomodoro Timer** - Complete productivity system with Lualine
- **Triforce Gamification** - XP system, levels, achievements and coding streaks
- **WakaTime Integration** - Time tracking in status bar
- **Summon Floating Terminal** - Floating terminals for zellij, lazygit, opencode and TODOs
- **Zelda Dashboard** - Custom dashboard with themed ASCII art

### Development

- **Complete LSP** - Support for TypeScript, JavaScript, Angular, Tailwind, JSON, Markdown (via LazyVim)
- **Auto Formatting** - Prettier integrated with Conform (via LazyVim)
- **Smart Linting** - ESLint and nvim-lint (via LazyVim)
- **Git Integration** - Neogit, Gitsigns, Lazygit (via Summon)
- **Floating Terminal** - Summon with zellij, lazygit, opencode

## Installation

### Prerequisites

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y \
  neovim git curl nodejs npm python3-pip \
  ripgrep fd-find build-essential zellij

# Arch Linux
sudo pacman -S neovim git curl nodejs npm python-pip ripgrep fd zellij

# Install Nerd Font (recommended)
# Download from: https://nerdfonts.com

# OpenCode for AI (optional)
# Install from: https://github.com/sst/opencode
npm install -g @sst/opencode
```

### Quick Installation

```bash
# 1. Backup existing configuration
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# 2. Clone this configuration
git clone https://github.com/TzzJokerzzT/neovim-config ~/.config/nvim
cd ~/.config/nvim

# 3. Start NeoVim (plugins install automatically)
nvim
```

### Post-Installation Setup

```bash
# Setup Copilot (optional but recommended)
# In NeoVim run: :Copilot setup

# Setup WakaTime (optional)
# 1. Install CLI: https://github.com/wakatime/wakatime-cli
# 2. In NeoVim run: :WakaTimeApiKey your-api-key
```

## Plugins and Tools

### UI and Themes

| Plugin | Description | Status |
| --- | --- | --- |
| **[C. Viper](lua/c_viper/)** | Street Fighter custom theme with transparency (default) | Active |
| **[Lualine](https://github.com/nvim-lualine/lualine.nvim)** | Status bar with Pomodoro, WakaTime and Triforce | Customized |
| **[Noice](https://github.com/folke/noice.nvim)** | Enhanced UI for messages and cmdline | Active |
| **[Incline](https://github.com/b0o/incline.nvim)** | Lightweight, backgroundless floating window titles | Active |
| **[Smear Cursor](https://github.com/sphamba/smear-cursor.nvim)** | Smooth cursor animation with particles | Active |
| **[Snacks.nvim](https://github.com/folke/snacks.nvim)** | Custom dashboard with Zelda ASCII art | Active |

### AI and Completion

| Plugin | Description | Configuration |
| --- | --- | --- |
| **[GitHub Copilot](https://github.com/github/copilot.vim)** | GitHub AI assistant (inline completion) | `<Tab>` to accept |
| **[OpenCode](https://github.com/NickvanDyke/opencode.nvim)** | AI chat, actions, operator and terminal | `<leader>ak`, `<C-;>` |
| **[Blink.cmp](https://github.com/saghen/blink.cmp)** | Ultra-fast completion engine (via LazyVim) | Automatic |

### File Management

| Plugin | Description | Shortcut |
| --- | --- | --- |
| **[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)** | Modern file explorer (via LazyVim) | `<leader>e` |
| **[Oil](https://github.com/stevearc/oil.nvim)** | Edit directories as buffers | `-`, `<leader>-` |
| **[Goto Preview](https://github.com/rmagatti/goto-preview)** | LSP preview in floating windows | `gzd`, `gpr`, etc. |
| **[Rip Substitute](https://github.com/chrisgrieser/nvim-rip-substitute)** | Advanced regex search and replace | `<leader>fs` |

### Productivity

| Tool | Description | Commands |
| --- | --- | --- |
| **Pomodoro Timer** | Complete work -> standby -> break system | `<leader>ps`, `:PomodoroStart` |
| **WakaTime** | Coding time tracking | Automatic in Lualine |
| **Triforce** | Gamification system with XP, levels and achievements | `<leader>tp` |
| **Summon** | Floating terminals (zellij, lazygit, opencode, TODOs) | `<C-e>`, `<leader>ge`, `<leader>o` |
| **Which-key** | Keyboard shortcut help (via LazyVim) | Automatic |

### Development (via LazyVim + Extras)

| Plugin | Description | Languages |
| --- | --- | --- |
| **[Mason](https://github.com/williamboman/mason.nvim)** | LSP/DAP/Linter manager | All |
| **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** | Syntax highlighting | 40+ languages |
| **[LSP Config](https://github.com/neovim/nvim-lspconfig)** | Language server configuration | TS, JS, Angular, etc. |
| **[Conform](https://github.com/stevearc/conform.nvim)** | Code formatter | Prettier, etc. |
| **[Mini Surround](https://github.com/echasnovski/mini.surround)** | Add/change/delete surrounding characters | `gsa`, `gsd`, `gsr` |
| **[Colorizer](https://github.com/catgoose/nvim-colorizer.lua)** | Inline color highlighting (hex, RGB, Tailwind) | Automatic |

### Git

| Plugin | Description | Shortcut |
| --- | --- | --- |
| **[Neogit](https://github.com/NeogitOrg/neogit)** | Full Git client | `<leader>gn` |
| **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)** | Git signs in gutter (via LazyVim) | Automatic |
| **Lazygit (via Summon)** | Floating lazygit terminal | `<leader>ge` |

### Enabled LazyVim Extras

| Extra | Description |
| --- | --- |
| `lang.typescript` | Full TypeScript support |
| `lang.tailwind` | Tailwind CSS support |
| `coding.mini-surround` | Text surrounding operations |
| `util.mini-hipatterns` | Text pattern highlighting |

### Disabled Plugins

| Plugin | Reason |
| --- | --- |
| `akinsho/bufferline.nvim` | Intentionally disabled |
| `akinsho/toggleterm.nvim` | Replaced by Summon |

## Keyboard Shortcuts

### AI / OpenCode

```
<leader>ak    - Ask OpenCode with "@this:" context
<C-x>         - Select/execute OpenCode action
<C-;>         - Toggle OpenCode terminal
go            - Add range to OpenCode (operator mode)
goo           - Add current line to OpenCode
<S-C-u>       - Scroll up in OpenCode
<S-C-d>       - Scroll down in OpenCode
<Tab>         - Accept Copilot suggestion
```

### Pomodoro

```
<leader>ps    - Start interactive session (work -> break -> standby)
<leader>pS    - Stop current session
<leader>pi    - Show information/status
<leader>pw    - Configure work time (interactive)
<leader>pb    - Configure break time (interactive)
<leader>pc    - Set default times
<leader>p1    - Quick start: 25min work, 5min break
<leader>p2    - Quick start: 45min work, 10min break
<leader>p3    - Quick start: 90min work, 20min break
```

### File Navigation

```
<leader>e     - Toggle Neo-tree (LazyVim)
-             - Open Oil floating
<leader>-     - Open Oil in current file's directory
<leader>ff    - Find files (LazyVim)
<leader>fg    - Live grep search (LazyVim)
<leader>fr    - Recent files (LazyVim)
<leader>fs    - Search and replace (Rip Substitute)
```

### LSP Preview (goto-preview)

```
gzd           - Preview definition
gpD           - Preview declaration
gpi           - Preview implementation
gpy           - Preview type definition
gpr           - Preview references
gP            - Close all preview windows
```

### Development (LSP via LazyVim)

```
gd            - Go to definition
gr            - Go to references
K             - Show hover information
<leader>ca    - Code actions
<leader>cr    - Rename symbol
<leader>xx    - Toggle Trouble diagnostics
<leader>xw    - Workspace diagnostics
```

### Terminals and Tools (Summon)

```
<C-e>         - Floating terminal (zellij)
<leader>o     - Open OpenCode CLI
<leader>ge    - Open Lazygit
<leader>t     - Open TODOs file
```

### Git

```
<leader>gn    - Open Neogit
<leader>ge    - Lazygit (via Summon)
```

### Utilities

```
<C-s>         - Save file with custom notification
<leader>ms    - Color picker (Minty Shades)
<leader>mh    - Color picker (Minty Huefy)
<leader>bq    - Close all buffers except current
<leader>mp    - Markdown preview
<leader>ds    - Remove surrounding (surround)
<leader>cs    - Change surrounding (surround)
+             - Increment number under cursor
-             - Decrement number under cursor (outside Oil)
```

### Quick Wrapping (visual mode)

```
<leader>'     - Wrap with single quotes
<leader>"     - Wrap with double quotes
<leader>(     - Wrap with parentheses
<leader>{     - Wrap with curly braces
<leader>[     - Wrap with square brackets
<leader><     - Wrap with angle brackets
```

### Insert Mode Shortcuts

```
<C-b>         - Delete to end of word
<C-d>         - Delete entire line
<C-v>         - Paste from system clipboard
<A-j>         - Move line down
<A-k>         - Move line up
```

### Gamification (Triforce)

```
<leader>tp    - View gamification profile (level, XP, achievements)
```

## Pomodoro System

### Features

- **Visual Timer**: Integrated in Lualine with icons and dynamic colors
- **Complete Flow**: Work -> Standby -> Break -> Idle
- **Flexible Configuration**: Customizable times with smart formatting
- **Notifications**: Friendly alerts for each transition
- **Interactive Commands**: Floating windows for configuration

### Timer States

| State | Icon | Lualine Color | Description |
| --- | --- | --- | --- |
| **Work** | clock | Red | Active work session |
| **Standby** | pause | Yellow | Brief transition before break |
| **Break** | coffee | Green | Well-deserved break time |
| **Idle** | tomato | Blue | Timer inactive, ready for new session |

### Supported Time Formats

```
25           - 25 minutes
25min        - 25 minutes
1h           - 1 hour
1h30m        - 1 hour 30 minutes
90s          - 90 seconds
```

### Available Commands

```vim
:PomodoroStart [work] [break] [standby]  " Start with optional times
:PomodoroInteractive                     " Full interactive mode
:PomodoroWork [time]                     " Configure work (interactive)
:PomodoroBreak [time]                    " Configure break (interactive)
:PomodoroStop                            " Stop session
:PomodoroStatus                          " Show current status
:PomodoroConfig [work] [break] [standby] " Set defaults
```

## AI Configuration

### GitHub Copilot

```vim
" Initial setup
:Copilot setup

" Useful commands
:Copilot status    " Check status
:Copilot enable    " Enable
:Copilot disable   " Disable
```

### OpenCode

The `opencode.nvim` plugin provides direct integration with OpenCode AI:

- **Contextual chat**: `<leader>ak` sends selection/buffer with "@this:" context
- **AI actions**: `<C-x>` to select and execute actions
- **OpenCode terminal**: `<C-;>` to toggle terminal
- **Operator mode**: `go` to add ranges, `goo` for current line
- **CLI via Summon**: `<leader>o` opens OpenCode in floating terminal

## Gamification System (Triforce)

### Features

- **XP and Level System**: Earn experience by writing code
- **Unlockable Achievements**: Specific goals by language and activity
- **Coding Streaks**: Maintain daily consistency
- **Session Time**: Track active coding time
- **Notifications**: Alerts when leveling up or unlocking achievements
- **Lualine Integration**: Statistics visible in status bar (level, streak, time, achievements)

### Reward System

| Activity | XP Earned | Description |
| --- | --- | --- |
| **Characters** | 1 XP per character | Experience from writing code |
| **New Lines** | 1 XP per line | Bonus for creating new lines |
| **Save File** | 50 XP | Reward for saving changes |

### Level Progression

- **Tier 1** (Levels 1-10): 300 XP per level
- **Tier 2** (Levels 11-20): 500 XP per level
- **Tier 3** (Levels 21+): 1000 XP per level

### Commands

```vim
:Triforce profile    " View complete statistics
:Triforce reset      " Reset progress
```

## Customization

### Change Theme

The default active theme is C. Viper with transparency. Installation fallbacks are `tokyonight` and `habamax`.

```vim
:colorscheme c_viper       " C. Viper (default)
:colorscheme tokyonight    " Tokyo Night (fallback)
:colorscheme habamax       " Habamax (fallback)
```

### Customize Lualine

Configuration includes:

- **Section A**: Vim mode
- **Section X**: Triforce (level, streak, session time, achievements) + Pomodoro + WakaTime + Filetype
- **Theme**: `iceberg_dark`
- **Separators**: Solid arrows and component borders

### Noice (Cmdline)

```lua
-- cmdline appears at the bottom (not popup)
-- Enabled presets: bottom_search, command_palette, lsp_doc_border
```

### C. Viper Colorscheme

The custom theme includes:

- **33 named colors** inspired by the Street Fighter character C. Viper
- **Transparency** enabled by default
- **Language highlights**: TypeScript, JavaScript, React/JSX/TSX, Vue, HTML
- **13 plugin integrations**: LSP, Diagnostics, Telescope, GitSigns, NvimTree, Lualine, Which-key, Indent, CMP, Notify, and more
- **50+ base editor highlight groups**

## Monitoring and Productivity

### WakaTime

1. **Install CLI**: https://github.com/wakatime/wakatime-cli

2. **Configure API Key**:

   ```vim
   :WakaTimeApiKey your-api-key-here
   ```

3. **Visualization**: Time appears automatically in Lualine (updates every 5 minutes)

### Available Metrics in Lualine

- **Real-time coding time** (WakaTime)
- **Pomodoro progress** with dynamic colors
- **Level and XP** from Triforce
- **Daily coding streaks**
- **Active session time**
- **Unlocked achievements**

### Custom Dashboard

Using `Snacks.nvim` with:

- **Header** with Zelda-themed ASCII art
- **Quick actions**: Find file, new file, find text, recent files, config, restore session, extras, lazy, quit
- **Header color**: `#bbc443` (yellow-green)

## Project Structure

```
~/.config/nvim/
  init.lua                    # Entry point
  lazyvim.json                # Enabled LazyVim extras
  stylua.toml                 # Lua formatter configuration
  colors/
    c_viper.lua               # Colorscheme entry point
  lua/
    config/
      lazy.lua                # lazy.nvim bootstrap
      keymaps.lua             # Custom keymaps
      options.lua             # Vim options
      autocmds.lua            # Autocommands
    c_viper/
      init.lua                # Color palette and base highlights
      languages.lua           # Language highlights (TS, JSX, Vue, HTML)
      plugins.lua             # Plugin highlights
    lib/
      pomodoro.lua            # Complete Pomodoro system
    plugins/
      ui.lua                  # Snacks, Lualine, Noice, Incline, Smear, Triforce
      editor.lua              # Oil, goto-preview, OpenCode, rip-substitute, Minty
      colorscheme.lua         # C. Viper colorscheme configuration
      copilot.lua             # GitHub Copilot
      neogit.lua              # Neogit Git client
      testing.lua             # Colorizer, Summon
      wakatime.lua            # WakaTime
      toggleterm.lua          # ToggleTerm (disabled)
      disabled.lua            # Disabled plugins
```

## Getting Started

### First Steps

1. **Install configuration** following the instructions
2. **Setup Copilot**: `:Copilot setup`
3. **Try Pomodoro**: `<leader>ps` for interactive session
4. **Explore files**: `<leader>ff` to find files
5. **Open terminal**: `<C-e>` for floating zellij

### Productivity Tips

- **Use Oil**: `-` to navigate directories as buffers
- **Leverage AI**: `<leader>ak` for OpenCode chat, `<Tab>` for Copilot
- **Setup Pomodoro**: Start with `<leader>p1` (25min session)
- **Floating terminal**: `<C-e>` for zellij, `<leader>ge` for lazygit
- **Regex search**: `<leader>fs` for rip-substitute
- **LSP Preview**: `gzd` to view definitions without leaving the file

### Useful Commands

```vim
:checkhealth          " Check configuration
:Lazy                 " Plugin manager
:Mason                " Install LSPs/formatters
:Neogit               " Git client
:WhichKey             " See all available shortcuts
```

## Contributing

### Report Issues

- Use the [issue tracker](https://github.com/TzzJokerzzT/neovim-config/issues)
- Include system information (`nvim --version`)
- Attach `:checkhealth` if configuration problem

### Suggest Improvements

- **Fork** the repository
- **Create** a branch: `feature/new-functionality`
- **Commit** your changes
- **Push** and create a **Pull Request**

## License

This project is under the Apache 2.0 License. See [LICENSE](LICENSE) for more details.

---

<div align="center">

**Made with love by [TzzJokerzzT](https://github.com/TzzJokerzzT)**

_A modern NeoVim configuration for developers seeking productivity and elegance_

[![GitHub](https://img.shields.io/badge/GitHub-TzzJokerzzT-181717?logo=github)](https://github.com/TzzJokerzzT)
[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-6366f1)](https://lazyvim.org)

</div>
