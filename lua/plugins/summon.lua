return {
  -- Summon
  {
    "salkhalil/summon.nvim",
    opts = {},
    config = function()
      require("summon").setup({
        -- Global defaults (apply to all commands unless overridden)
        width = 0.85,
        height = 0.85,
        border = "rounded",
        close_keymap = "<Esc><Esc>",
        highlights = {
          float = { bg = nil },
          border = { fg = "#0099cc", bg = nil },
          title = { fg = "#fdfcfe", bg = "#0099cc", bold = true },
        },
        -- Colors accept hex strings ("#282828") or integers (0x282828)
        terminal_passthrough_keys = { "<C-o>", "<C-i>" }, -- keys passed to terminal apps

        -- Named commands
        commands = {
          terminal = {
            type = "terminal", -- or "file"
            command = "zellij", -- command to run (for "terminal" type) or file to open (for "file" type)
            title = " Terminal   ",
            keymap = "<C-e>",
          },
          opencode = {
            type = "terminal", -- or "file"
            command = "opencode",
            title = " Opencode   ",
            keymap = "<leader>o",
          },
          lazygit = {
            type = "terminal",
            command = "lazygit",
            title = " LazyGit  ",
            keymap = "<leader>ge",
            height = 0.9, -- override global default
            -- border_color = "#ff4444", -- custom border + title badge color
            border = "rounded",
            highlights = {
              border = { fg = "#ff4444", bg = nil },
              title = { fg = "#fdfcfe", bg = "#ff4444", bold = true },
            },
            terminal_passthrough_keys = {}, -- disable passthrough for lazygit
          },
        },
      })
    end,
  },
}
