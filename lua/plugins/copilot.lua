return {
  "github/copilot.vim",
  init = function()
    -- Use Node.js 22 LTS for Copilot (v24 has incompatible native module ABI)
    vim.g.copilot_node_command = "/home/alex_buelvas/.nvm/versions/node/v22.22.0/bin/node"
    -- Disable npx completely to use the bundled language server with our node command
    vim.g.copilot_npx = 0
    vim.g.copilot_npx_command = 0
  end,
}
