return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
    requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
    opts = {
      options = {
        theme = "iceberg_dark", -- Set the theme for lualine
        icons_enabled = true, -- Enable icons in the statusline
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode", -- Display the current mode
            icon = "󰞇", -- Set the icon for the mode
          },
        },
      },
    },
  },
}
