return {
  --Blink Indent
  {
    "saghen/blink.indent",
    --- @module 'blink.indent'
    --- @type blink.indent.Config
    -- opts = {},
  },

  --Retrospect
  {
    "mrquantumcodes/retrospect.nvim",
    config = function()
      require("retrospect").setup({
        save_key = "<leader>rp", -- Keybinding to save session (default: <leader>\)
        load_key = "<leader><C-r>", -- Keybinding to load session (default: <leader><BS>)
        autosave = false, -- Autosave session on every file write (default: false)
      })
    end,
  },

  -- Fyler
  {
    "A7Lavinraj/fyler.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    branch = "stable", -- Use stable branch for production
    lazy = false, -- Necessary for `default_explorer` to work properly
    keys = {
      { "-", "<CMD>Fyler kind=float<CR>", desc = "Open Fyler (parent dir)" },
    },
    config = function()
      require("fyler").setup({
        integrations = {
          icon = "nvim_web_devicons",
        },
        default_file_explorer = true,
        view = {
          mappings = {
            ["q"] = "CloseView",
            ["<CR>"] = "Select",
            ["<C-t>"] = "SelectTab",
            ["|"] = "SelectVSplit",
            ["-"] = "SelectSplit",
            ["<BS>"] = "GotoParent",
            ["="] = "GotoCwd",
            ["."] = "GotoNode",
            ["#"] = "CollapseAll",
            ["<C>"] = "CollapseNode",
          },
        },
      })
    end,
  },
}
