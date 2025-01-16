return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        -- Configuración básica
        size = 20, -- Tamaño del terminal (puede ser fijo o dinámico según orientación)
        open_mapping = [[<c-t>]], -- Atajo para abrir/cerrar el terminal
        hide_numbers = true, -- Ocultar números de línea en el terminal
        shade_filetypes = {}, -- Tipos de archivo a sombrear (vacío = sin sombra)
        shade_terminals = true, -- Habilitar sombreado para terminales
        shading_factor = 1, -- Nivel de sombreado (1-3)
        start_in_insert = true, -- Comenzar en modo inserción
        insert_mappings = true, -- Usar mapeos en modo inserción
        terminal_mappings = true, -- Habilitar mapeos en el terminal
        persist_size = true, -- Recordar tamaño del terminal al cerrarlo
        direction = "float", -- Dirección del terminal ('horizontal', 'vertical', 'tab', 'float')
        close_on_exit = true, -- Cerrar terminal al salir del shell
        shell = vim.o.shell, -- Shell predeterminado
        float_opts = {
          border = "curved", -- Estilo del borde ('single', 'double', 'shadow', 'curved')
          winblend = 0, -- Nivel de transparencia (0 = opaco, 100 = completamente transparente)
        },
      })

      -- Atajos adicionales para abrir terminales específicos
      local Terminal = require("toggleterm.terminal").Terminal

      -- Terminal para Git
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })
      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end
    end,
  },
}
