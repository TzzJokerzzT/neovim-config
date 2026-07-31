-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- ─── Project Formatter/Linter Detection ────────────────────────────────────────
-- Detects which formatter/linter config files exist in the project root and
-- notifies once per directory so you always know what tools are active.

local notified_dirs = {}

local tool_configs = {
  {
    name = "Biome",
    icon = "🧬",
    files = { "biome.json", "biome.jsonc" },
  },
  {
    name = "Prettier",
    icon = "🎨",
    files = {
      ".prettierrc",
      ".prettierrc.json",
      ".prettierrc.js",
      ".prettierrc.cjs",
      ".prettierrc.mjs",
      ".prettierrc.yml",
      ".prettierrc.yaml",
      ".prettierrc.toml",
      "prettier.config.js",
      "prettier.config.cjs",
      "prettier.config.mjs",
    },
  },
  {
    name = "ESLint",
    icon = "📏",
    files = {
      ".eslintrc",
      ".eslintrc.json",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.yml",
      ".eslintrc.yaml",
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.cjs",
      "eslint.config.ts",
      "eslint.config.mts",
    },
  },
}

local function detect_project_tools()
  local cwd = vim.fn.getcwd()
  if notified_dirs[cwd] then
    return
  end
  notified_dirs[cwd] = true

  -- Only detect in projects that have a package.json (JS/TS projects)
  if vim.fn.filereadable(cwd .. "/package.json") == 0 then
    return
  end

  local found = {}

  for _, tool in ipairs(tool_configs) do
    for _, file in ipairs(tool.files) do
      if vim.fn.filereadable(cwd .. "/" .. file) == 1 then
        table.insert(found, tool.icon .. " " .. tool.name)
        break
      end
    end
  end

  if #found > 0 then
    vim.notify("  " .. table.concat(found, "  +  "), vim.log.levels.INFO, {
      title = "Project Tools",
    })
  else
    vim.notify("  No formatter/linter config detected", vim.log.levels.WARN, {
      title = "Project Tools",
    })
  end
end

vim.api.nvim_create_autocmd({ "DirChanged", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("project_tool_detection", { clear = true }),
  callback = detect_project_tools,
  desc = "Detect and notify project formatter/linter tools",
})

-- Run immediately since this file loads on VeryLazy (after VimEnter)
vim.schedule(detect_project_tools)

-- ─── Macro Recording Notifications ──────────────────────────────────────
-- Shows a notification when macro recording starts/stops, including
-- the register being used.

local macro_recording_group = vim.api.nvim_create_augroup("macro_recording_notify", { clear = true })

vim.api.nvim_create_autocmd("RecordingEnter", {
  group = macro_recording_group,
  callback = function()
    local reg = vim.fn.reg_recording()
    vim.notify("Recording macro @" .. reg, vim.log.levels.INFO, {
      title = "󰑋 Macro",
      icon = "⏺️",
    })
  end,
  desc = "Notify when macro recording starts",
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  group = macro_recording_group,
  callback = function()
    local reg = vim.fn.reg_recording()
    if reg ~= "" then
      vim.notify("Macro saved to register @" .. reg, vim.log.levels.INFO, {
        title = "󰑋 Macro",
        icon = "⏹️",
      })
    end
  end,
  desc = "Notify when macro recording stops",
})
