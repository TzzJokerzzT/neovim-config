return {
  -- Colorizer
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" }, -- Filetype options.  Accepts table like `user_default_options`
        buftypes = {}, -- Buftype options.  Accepts table like `user_default_options`
        -- Boolean | List of usercommands to enable.  See User commands section.
        user_commands = true, -- Enable all or some usercommands
        lazy_load = false, -- Lazily schedule buffer highlighting setup function
        user_default_options = {
          names = true, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
          names_opts = { -- options for mutating/filtering names.
            lowercase = true, -- name:lower(), highlight `blue` and `red`
            camelcase = true, -- name, highlight `Blue` and `Red`
            uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
            strip_digits = false, -- ignore names with digits,
            -- highlight `blue` and `red`, but not `blue3` and `red4`
          },
          -- Expects a table of color name to #RRGGBB value pairs.  # is optional
          -- Example: { cool = "#107dac", ["notcool"] = "ee9240" }
          -- Set to false to disable, for example when setting filetype options
          names_custom = false, -- Custom names to be highlighted: table|function|false
          RGB = true, -- #RGB hex codes
          RGBA = true, -- #RGBA hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = false, -- #RRGGBBAA hex codes
          AARRGGBB = false, -- 0xAARRGGBB hex codes
          rgb_fn = false, -- CSS rgb() and rgba() functions
          hsl_fn = false, -- CSS hsl() and hsla() functions
          oklch_fn = true, -- CSS oklch() function
          css = true, -- Enable all CSS *features*:
          -- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn, oklch_fn
          css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn, oklch_fn
          -- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
          tailwind = true, -- Enable tailwind colors
          tailwind_opts = { -- Options for highlighting tailwind names
            update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
          },
          -- parsers can contain values used in `user_default_options`
          sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
          xterm = false, -- Enable xterm 256-color codes (#xNN, \e[38;5;NNNm)
          -- Highlighting mode.  'background'|'foreground'|'virtualtext'
          mode = "background", -- Set the display mode
          -- Virtualtext character to use
          virtualtext = "■",
          -- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
          virtualtext_inline = false,
          -- Virtualtext highlight mode: 'background'|'foreground'
          virtualtext_mode = "foreground",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false,
          -- hooks to invert control of colorizer
          hooks = {
            -- called before line parsing.  Accepts boolean or function that returns boolean
            -- see hooks section below
            disable_line_highlight = false,
          },
        },
      })
    end,
  },

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
          todos = {
            type = "file",
            command = "~/Documents/todos.md",
            title = " TODOs ",
            keymap = "<leader>t",
            filetype = "markdown", -- optional: override auto-detected filetype
          },
        },
      })
    end,
  },

  -- Diffview
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
