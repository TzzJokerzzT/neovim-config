return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            -- Cambiar de <M-d> (Alt-d) a <C-x> (Ctrl-x) para cerrar buffers
            ["<C-x>"] = require("telescope.actions").delete_buffer,
          },
          n = {
            -- También en modo normal
            ["<C-x>"] = require("telescope.actions").delete_buffer,
          },
        },
      },
    },
  },
}
