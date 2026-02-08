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

  -- Opencode
  {
    "NickvanDyke/opencode.nvim",
    dependencies = {
      -- Recommended for `ask()` and `select()`.
      -- Required for `snacks` provider.
      ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    keys = {
      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "<leader>ak", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode…" }),

      vim.keymap.set({ "n", "x" }, "<C-x>", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" }),

      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" }),

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "Add range to opencode", expr = true }),

      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Add line to opencode", expr = true }),

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "Scroll opencode up" }),

      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "Scroll opencode down" }),

      -- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true }),
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true }),
    },

    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
      }
      -- Required for `opts.events.reload`.
      vim.o.autoread = true
    end,
  },
}
