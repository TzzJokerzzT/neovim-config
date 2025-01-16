return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background", -- Puede ser 'background', 'foreground', o 'first_column'
        enable_named_colors = true, -- Permite colores nombrados como 'red', 'blue', etc.
        enable_tailwind = false, -- Soporte para colores de TailwindCSS
      })
    end,
  },
}
