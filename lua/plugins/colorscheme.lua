return {
  -- {
  --   "ricardoraposo/nightwolf.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("nightwolf").setup({
  --       theme = "black",
  --       transparency = true,
  --       italic = true,
  --       palette_overrides = {
  --         background = "#000000",
  --         black = "#000000",
  --         red = "#f05050", --Typescript errors, Errors, Diagnostics errors
  --         white = "#d36c40",
  --         blue = "#00b1ff", --Reserve words, Variables not used
  --         lightPurple = "#d36c40", --{ Imports }
  --         darkPurple = "#e60c0c", --Const, Let, return, exports, className, props
  --         cyan = "#00DCDC", --Functions Names
  --         lightYellow = "#d36c40", --Brackets, props inside Brackets, backstick ``
  --         darkYellow = "#d36c40", --Numbers, imports
  --         green = "#00b1ff", --String
  --         lightRed = "#ff7878", --Operators, Components, if, else,
  --         muted = "#F6F4F4", --Telescope border, Telescope selection, Punctuation, Telescope variables
  --         comment = "#647882",
  --         color12 = "#000000", --Status line
  --         color14 = "#141414", --Telespcope background, <Leader> background
  --         color15 = "#161b10",
  --         color16 = "#230c0b",
  --         color17 = "#343434",
  --         color18 = "#6f6f6f", --Tabs line Numbers
  --         color19 = "#787878",
  --       },
  --     })
  --     vim.cmd("colorscheme nightwolf")
  --   end,
  -- },
  {
    "doki-theme/doki-theme-vim",
    lazy = false, -- Cargar el plugin inmediatamente
    priority = 1000, -- Asegurarse de que se cargue antes que otros plugins
    config = function()
      -- Configuración del tema (opcional)
      vim.g.doki_theme_settings = {
        italic_comments = true, -- Habilita cursivas en comentarios
        italic_keywords = true, -- Opcional: habilita cursivas en palabras clave
        italic_functions = true, -- Opcional: deshabilita cursivas en funciones
        italic_variables = true, -- Opcional: deshabilita cursivas en variables
      }
      vim.cmd("colorscheme essex") -- Cambia "doki-theme" por el nombre del tema que prefieras
      -- vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#928e8e" })
      -- vim.api.nvim_set_hl(0, "Comment", { italic = true })
      -- vim.api.nvim_set_hl(0, "Keyword", { italic = true, fg = "#7b7979" })
      -- vim.api.nvim_set_hl(0, "Keyword", { italic = true })
      -- vim.api.nvim_set_hl(0, "Function", { italic = false, fg = "#848db8", bold = true })
      -- vim.api.nvim_set_hl(0, "Function", { italic = false, bold = true })
      -- vim.api.nvim_set_hl(0, "Variable", { italic = true, fg = "#928e8e" })
      -- vim.api.nvim_set_hl(0, "Type", { italic = false, fg = "#f2eded", bold = true })
      -- vim.api.nvim_set_hl(0, "Operator", { italic = true, fg = "#98473b" })
      -- vim.api.nvim_set_hl(0, "Directory", { italic = true, fg = "#f2eded" })
      -- vim.g.doki_theme_style = "rei" -- Cambia a otro tema
    end,
  },
}
