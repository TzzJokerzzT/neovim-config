return {
  {
    "ziontee113/icon-picker.nvim",
    cmd = { "IconPickerNormal", "IconPickerYank", "IconPickerInsert" }, -- Lazy load on command
    keys = {
      { "<Leader>si", "<cmd>IconPickerNormal<cr>", desc = "Icon Picker" },
      { "<Leader>sy", "<cmd>IconPickerYank<cr>", desc = "Icon Picker Yank" },
      { "<C-i>", "<cmd>IconPickerInsert<cr>", mode = "i", desc = "Icon Picker Insert" },
    },
    config = function()
      require("icon-picker").setup({ disable_legacy_commands = true })
    end,
  },
}
