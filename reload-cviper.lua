-- Reload C. Viper colorscheme completely
vim.cmd("hi clear")
package.loaded["c_viper"] = nil
package.loaded["c_viper.init"] = nil
package.loaded["c_viper.languages"] = nil
package.loaded["c_viper.plugins"] = nil

require("c_viper").setup()
print("C. Viper colorscheme reloaded!")
