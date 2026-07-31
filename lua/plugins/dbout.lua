return {
  {
    "zongben/dbout.nvim",
    build = "npm install",
    lazy = "VeryLazy",
    cmd = { "Dbout" },
    config = function()
      require("dbout").setup({})
    end,
  },
}
