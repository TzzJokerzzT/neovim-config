return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      vtsls = {
        autoUseWorkspaceTsdk = true,
        -- settings = {
        --   typescript = {
        --     inlayHints = {
        --       includeInlayParameterNameHints = "none",
        --       includeInlayFunctionParameterTypeHints = false,
        --       includeInlayVariableTypeHints = false,
        --       includeInlayPropertyDeclarationTypeHints = false,
        --       includeInlayFunctionLikeReturnTypeHints = false,
        --       includeInlayEnumMemberValueHints = false,
        --     },
        --   },
        -- javascript = {
        --   inlayHints = {
        --     includeInlayParameterNameHints = "none",
        --     includeInlayFunctionParameterTypeHints = false,
        --     includeInlayVariableTypeHints = false,
        --     includeInlayPropertyDeclarationTypeHints = false,
        --     includeInlayFunctionLikeReturnTypeHints = false,
        --     includeInlayEnumMemberValueHints = false,
        --   },
        -- },
        -- },
      },
    },
  },
}
