return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  enabled = false,
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = false,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>",
        },
        layout = {
          position = "right", -- | top | left | right | horizontal | vertical
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          accept_word = "<C-w>",
          accept_line = "<C-e>",
          next = "<C-n>",
          prev = "<C-p>",
          dismiss = "<C-d>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = true,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = "node", -- Node.js version must be > 18.x
      server_opts_overrides = {},
    })
  end,
  -- {
  --   "giuxtaposition/blink-cmp-copilot",
  --   dependencies = { "zbirenbaum/copilot.lua" },
  -- },
}
