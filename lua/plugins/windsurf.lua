return {
  "Exafunction/windsurf.nvim",
  config = function()
    require("codeium").setup({
      -- Aquí van tus configuraciones personalizadas
      enable = true,
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        manual = false,
        -- filetypes = {
        --   python = true,
        --   javascript = true,
        --   typescript = true,
        --   jsx = true,
        --   lua = true,
        --   c = true,
        --   cpp = true,
        --   java = true,
        -- },
        default_filetype_enabled = true,
        idle_delay = 75,
        virtual_text_priority = 65535,
        map_keys = true,
        accept_fallback = nil,
        key_bindings = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          clear = false,
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    })
    -- cmp.setup({
    --   source = {
    --     { name = "codeium" },
    --   },
    --   formatting = {
    --     format = require("lspkind").cmp_format({
    --       mode = "symbol",
    --       maxwidth = 50,
    --       ellipsis_char = "...",
    --       symbol_map = { Codeium = "" },
    --     }),
    --   },
    -- })
  end,
}
