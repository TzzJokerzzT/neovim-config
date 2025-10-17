# 💤 TzzJokerzzT's LazyVim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-blue.svg)](https://lazyvim.org)
[![Linux](https://img.shields.io/badge/Linux-Branch-yellow.svg?logo=linux)](https://github.com/TzzJokerzzT/neovim-config/tree/linux)

This is my personal Neovim configuration for [LazyVim](https://github.com/TzzJokerzzT/neovim-config), optimized for full-stack development with AI integration.

## 🚀 Features

- 🎨 **Doki Theme Essex** - Anime-inspired colorscheme
- 🤖 **AI Integration** - Copilot, CodeCompanion, Avante, Claude Code
- ⚡ **58+ Plugins** - Carefully selected and optimized
- 🔍 **Advanced Search** - FZF, Telescope, and more
- 📊 **WakaTime Integration** - Track your coding time
- 🎯 **Productivity Tools** - Harpoon, Oil, Neo-tree

## Installation

### Prerequisites

```bash
# Ubuntu/Debian
sudo apt install neovim git curl nodejs npm python3-pip ripgrep fd-find

# Install Nerd Font (recommended)
# Download from https://nerdfonts.com
```

### Install Configuration

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this configuration
git clone https://github.com/TzzJokerzzT/neovim-config ~/.config/nvim
cd ~/.config/nvim
git checkout linux

# Start Neovim (plugins will auto-install)
nvim
```

## 📦 Plugins List

### 🎨 UI & Themes
1. **[Doki Theme](https://github.com/doki-theme/doki-theme-vim)** - Essex anime-inspired theme (default)
2. **[Tokyo Night](https://github.com/folke/tokyonight.nvim)** - Popular dark theme
3. **[Catppuccin](https://github.com/catppuccin/nvim)** - Pastel theme option
4. **[Highlight Colors](https://github.com/brenoprata10/nvim-highlight-colors)** - Show CSS/hex colors inline

### 🤖 AI & Completion
5. **[Copilot](https://github.com/zbirenbaum/copilot.lua)** - GitHub Copilot integration
6. **[CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** - Chat with Copilot
7. **[CodeCompanion](https://github.com/olimorris/codecompanion.nvim)** - Multi-model AI assistant (GPT-4, Gemini)
8. **[Avante](https://github.com/yetone/avante.nvim)** - Advanced AI coding assistant
9. **[Claude Code](https://github.com/greggh/claude-code.nvim)** - Claude AI integration
10. **[Blink.cmp](https://github.com/saghen/blink.cmp)** - Ultra-fast completion engine

### 📁 File Management
11. **[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)** - Modern file explorer
12. **[Oil](https://github.com/stevearc/oil.nvim)** - Edit directories like buffers
13. **[FZF-Lua](https://github.com/ibhagwan/fzf-lua)** - Fuzzy finder
14. **[Harpoon 2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)** - Quick file navigation

### 🎪 Interface & Experience
15. **[Bufferline](https://github.com/akinsho/bufferline.nvim)** - Beautiful buffer tabs
16. **[Lualine](https://github.com/nvim-lualine/lualine.nvim)** - Statusline with WakaTime
17. **[Incline](https://github.com/b0o/incline.nvim)** - Floating filename
18. **[Noice](https://github.com/folke/noice.nvim)** - Enhanced UI for messages
19. **[Dashboard](https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md)** - Custom start screen

### 🔧 Development Tools
20. **[Mason](https://github.com/williamboman/mason.nvim)** - LSP/DAP/Linter manager
21. **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting
22. **[LSP Config](https://github.com/neovim/nvim-lspconfig)** - Language server setup
23. **[Conform](https://github.com/stevearc/conform.nvim)** - Code formatter
24. **[nvim-lint](https://github.com/mfussenegger/nvim-lint)** - Linting integration

### 🎯 Productivity
25. **[ToggleTerm](https://github.com/akinsho/toggleterm.nvim)** - Integrated terminal
26. **[Which-key](https://github.com/folke/which-key.nvim)** - Keymap helper
27. **[Trouble](https://github.com/folke/trouble.nvim)** - Diagnostics list
28. **[Todo Comments](https://github.com/folke/todo-comments.nvim)** - Highlight TODO/FIXME
29. **[Grug Far](https://github.com/MagicDuck/grug-far.nvim)** - Search and replace
30. **[Persistence](https://github.com/folke/persistence.nvim)** - Session management

### 🎨 Utilities
31. **[Gotopreview](https://github.com/rmagatti/goto-preview)** - Preview definitions
32. **[Minty](https://github.com/nvzone/minty)** - Color picker
33. **[Volt](https://github.com/FredrikAleksander/volt-nvim)** - Productivity plugin
34. **[Wakatime](https://github.com/wakatime/vim-wakatime)** - Time tracking
35. **[DocsView](https://github.com/amrbashir/docs-view.nvim)** - Documentation viewer
36. **[Obsidian](https://github.com/epwalsh/obsidian.nvim)** - Note-taking integration
37. **[Rip Substitute](https://github.com/chrisgrieser/nvim-rip-substitute)** - Advanced substitution

### And 21+ more essential plugins!

## ⌨️ Key Mappings

### AI Integration
- `<leader>ac` - Toggle CodeCompanion chat
- `<leader>aa` - AI actions menu
- `<leader>cc` - Copilot Chat
- `<Tab>` - Accept AI suggestion

### File Navigation
- `<leader>e` - Toggle Neo-tree
- `<leader>o` - Open Oil file manager
- `<leader>ff` - Find files (FZF)
- `<leader>fg` - Live grep
- `<leader>h` - Harpoon mark file

### Development
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Show hover info
- `<leader>ca` - Code actions
- `<leader>xx` - Toggle Trouble diagnostics

### Utilities
- `<C-\>` - Toggle terminal
- `<leader>cp` - Color picker (Minty)
- `<leader>sr` - Search and replace (Grug Far)

## 🔧 Configuration Notes

### 🎨 Theme Configuration
- **Default theme**: Essex (Doki Theme) - anime-inspired
- **Available alternatives**: Tokyo Night, Catppuccin
- **Theme switching**: `:colorscheme tokyonight` or `:colorscheme catppuccin`

### 🤖 AI Setup
- **Copilot**: Run `:Copilot setup` on first use
- **CodeCompanion**: Multiple models available (GPT-4, Gemini 2.5 Pro)
- **Avante**: Configured with DeepSeek AI, suggestions disabled by default

### ⚡ Performance
- **Plugin count**: 58+ carefully selected plugins
- **Lazy loading**: 90% of plugins load only when needed
- **Startup time**: < 50ms on modern hardware

### 📊 WakaTime Integration
- [Snacks](https://github.com/folke/snacks.nvim) - Used for custom dashboard
- **WakaTime setup**: Install [WakaTime CLI](https://github.com/wakatime/wakatime-cli) first
- **API key**: Set with `:WakaTimeApiKey your-key`
- **Lualine integration**: Shows coding time in statusbar

### 🎛️ Customization

#### Enable Bufferline
```lua
-- In lua/plugins/bufferline.lua, change:
return {
  { "akinsho/bufferline.nvim", enabled = false }, -- Change to true
}
```

#### Modify Lualine
- Personal configuration included
- WakaTime section requires CLI setup
- Customizable in `lua/plugins/lualine.lua`

#### Noice UI
- Personal configuration for enhanced messages
- Customizable in `lua/plugins/noice.lua`

## 🚀 Getting Started

1. **Install prerequisites** (Neovim 0.10+, Node.js, Python, etc.)
2. **Clone the repository** to `~/.config/nvim`
3. **Checkout linux branch** for this configuration
4. **Start Neovim** - plugins will install automatically
5. **Configure AI tools** (Copilot, WakaTime) as needed
6. **Customize themes and plugins** to your preference

## 🤝 Contributing

Feel free to:
- 🐛 Report issues
- 💡 Suggest improvements  
- 🔀 Submit pull requests
- ⭐ Star the repo if you like it!

---

**Made with 💜 by TzzJokerzzT**
