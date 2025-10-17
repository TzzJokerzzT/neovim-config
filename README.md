# 💤 LazyVim Configuration

This is my personal Neovim configuration for [LazyVim](https://github.com/TzzJokerzzT/neovim-config).

## Installation

Use you favorite terminal an use this command

```bash
git clone https://github.com/TzzJokerzzT/neovim-config ~/.config/nvim
```

## Plugins List

1. [Nightworlf](https://github.com/ricardoraposo/nightwolf.nvim?tab=readme-ov-file) - ColorScheme with my own style
2. [Lualine](https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file)
3. [Oil](https://github.com/stevearc/oil.nvim)
4. [Dashboard](https://github.com/folke/snacks.nvim/blob/main/docs/dashboard.md) - for this plugins you must have [Snacks](https://github.com/folke/snacks.nvim)
5. [Gotopreview](https://github.com/rmagatti/goto-preview)
6. [Hightlight CSS](https://github.com/princejoogie/tailwind-highlight.nvim)
7. [Minty](https://github.com/nvzone/minty)
8. [ToggleTerm](https://github.com/akinsho/toggleterm.nvim)
9. [Volt](https://github.com/FredrikAleksander/volt-nvim)
10. [Wakatime](https://github.com/wakatime/vim-wakatime)
11. [Lualine](https://github.com/nvim-lualine/lualine.nvim)
12. [Bufferline](https://github.com/akinsho/bufferline.nvim)
13. [Incline](https://github.com/b0o/incline.nvim)
14. [Noice](https://github.com/folke/noice.nvim)
15. [Rip Substitute](https://github.com/chrisgrieser/vim-rip-substitute)
16. [Trouble](https://github.com/folke/trouble.nvim)
17. [Avante](https://github.com/yetone/avante.nvim)
18. [DocsView](https://github.com/amrbashir/docs-view.nvim)
19. [Obsidian](https://github.com/epwalsh/obsidian.nvim)

## NOTES

- [Snacks](https://github.com/folke/snacks.nvim) - I use this plugin for my dashboard, but you can use this plugin for your dashboard.
- If you install Lualine the Wakatime section won't work, because you need install [Wakatime CLI](https://github.com/wakatime/wakatime-cli), after that the Wakatime section will work again.
- The Bufferline is disabled by default, if you want to use the Bufferline you need change the config:

```
return {
  { "akinsho/bufferline.nvim", enabled = false },
}

to

return {
  { "akinsho/bufferline.nvim", enabled = true },
}
```

- Lualine also have my personal configuration, if you want to use it you need change the config.
- Noice also have my personal configuration, if you want to use it you need change the config.
- Avante have for default the deepseek AI and autocomplete and suggestion disabled.
