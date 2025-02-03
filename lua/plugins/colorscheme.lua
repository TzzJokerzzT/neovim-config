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
      vim.cmd("colorscheme rei") -- Cambia "doki-theme" por el nombre del tema que prefieras
      -- vim.g.doki_theme_style = "rei" -- Cambia a otro tema
    end,
  },
}
