-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = false })

-- Custom save function
function SaveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved and ready for a fight󰞇") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Shades and Huefy keymaps
map("n", "<leader>ms", ":Shades<CR>", opts)
map("n", "<leader>mh", ":Huefy<CR>", opts)

-- Delete all buffers but the current one
vim.keymap.set(
  "n",
  "<leader>bq",
  '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers but the current one" }
)

-- Map Ctrl+b in insert mode to delete to the end of the word without leaving insert mode
vim.keymap.set("i", "<C-b>", "<C-o>de")

-- Map Ctrl+d in insert mode to delete all the row without leaving insert mode
vim.api.nvim_set_keymap("i", "<C-d>", "<C-o>dd", { noremap = true, silent = true })

-- Map Ctrl+v in insert mode to paste without leaving insert mode
vim.api.nvim_set_keymap("i", "<C-v>", '<C-o>"+p', { noremap = true, silent = true })

-- Move line up or down on insert mode
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Optional: Easily remove wrappers
vim.keymap.set("n", "<leader>ds", "ds", { desc = "Remove wrapper" })

-- Optional: Change wrapper from one delimiter to another
vim.keymap.set("n", "<leader>cs", "cs", { desc = "Change wrapper" })

-- Markdown preview keymap
vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })

-- Window navigation keymaps en cool- retro-term
vim.keymap.set("n", "<BS>", "<C-w>h", { desc = "Go to Left Window" })

-- Enhaced LSP Hover (expands Typescript interfaces/type aliases)
vim.keymap.set("n", "<leader>k", function()
  require("lib.enhanced_hover").hover()
end, { desc = "Enhanced Hover" })

-- Tailwind Tools keymaps
vim.keymap.set("n", "<leader>ts", ":TailwindSort<CR>", { desc = "Sort Tailwind Classes" })

-- VSC NEOVIM
-- VSCode Neovim keymaps (only active when running inside VSCode)
if vim.g.vscode then
  local vscode = require("vscode")

  -- <leader>p - Toggle file explorer
  vim.keymap.set("n", "<leader>p", function()
    vscode.action("workbench.view.explorer")
  end, { desc = "Toggle file explorer" })

  -- <leader>| - Split editor vertically
  vim.keymap.set("n", "<leader>|", function()
    vscode.action("workbench.action.splitEditor")
  end, { desc = "Split editor vertically" })

  -- <leader><Right> - Focus next editor group
  vim.keymap.set("n", "<leader><Right>", function()
    vscode.action("workbench.action.focusNextGroup")
  end, { desc = "Focus next editor group" })

  -- <leader>q - Close active editor (buffer/tab)
  vim.keymap.set("n", "<leader>q", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "Close active editor" })

  -- <leader>k - Show hover information
  vim.keymap.set("n", "<leader>k", function()
    vscode.action("editor.action.showHover")
  end, { desc = "Show hover information" })

  -- <leader>e - Toggle integrated terminal
  vim.keymap.set("n", "<leader>e", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "Toggle terminal" })
end
