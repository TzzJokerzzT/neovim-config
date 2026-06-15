return {
  -- Live Server
  {
    "https://git.barrettruth.com/barrettruth/live-server.nvim",
    config = function()
      vim.g.live_server_port = {
        port = 4856,
        browser = false,
      }
    end,
  },

  -- Obsidian
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    enabled = function()
      return not vim.g.disable_obsidian
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      legacy_commands = false, -- this will be removed in 4.0.0
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Obsidian/Personal",
        },
        {
          name = "work",
          path = "~/Documents/Obsidian/Work",
        },
        {
          name = "study",
          path = "~/Documents/Obsidian/Study",
        },
      },
      picker = {
        name = "snacks.picker",
      },
      sync = {
        enabled = false,
      },
      -- Optional, define your own callbacks to further customize behavior.
      callbacks = {
        -- Runs anytime you enter the buffer for a note.
        -- NOTE: Breaking change in obsidian.nvim - callback now receives only (note), not (client, note)
        enter_note = function(note)
          if not note then
            return
          end
          -- Setup keymaps for obsidian notes
          vim.keymap.set("n", "gf", function()
            return require("obsidian").util.gf_passthrough()
          end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })

          vim.keymap.set("n", "<leader>ch", function()
            return require("obsidian").util.toggle_checkbox()
          end, { buffer = note.bufnr, desc = "Toggle checkbox" })

  { "sindrets/diffview.nvim", dependecies = { "nvim-lua/plenary.nvim" } },

  -- Tailwind Tools
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },
}
