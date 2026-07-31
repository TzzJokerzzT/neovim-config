-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
require('config.remote_clipboard').setup()
vim.opt.relativenumber = false
vim.g.autoformat = true

-- Prettier only runs when a .prettierrc config file exists in the project.
-- This prevents conflicts with Biome in projects that use biome.json instead.
vim.g.lazyvim_prettier_needs_config = true
