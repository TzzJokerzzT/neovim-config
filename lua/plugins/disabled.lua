return {
  -- Disabled bufferline
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },

  -- Disable angularls: nvim-lspconfig ships an angularls config whose filetypes
  -- include "typescript", which matches Vue/TS projects. Without this override,
  -- `:lsp enable` (no args) in Neovim 0.12 tries to start ngserver and fails.
  --
  -- Disable autoUseWorkspaceTsdk: Mason's @vue/typescript-plugin 3.x requires
  -- TS 6.x. With autoUseWorkspaceTsdk=true, vtsls picks the project's TS (often
  -- 5.x), causing TSServer to crash with SIGABRT. Using the vtsls-bundled TS
  -- avoids the mismatch and works across any project (Vue, React, Angular, etc.)
  -- without per-project configuration.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        angularls = { enabled = false },
        vtsls = {
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = false,
            },
            typescript = {
              tsserver = {
                maxTsServerMemory = 8192,
              },
            },
          },
        },
      },
    },
  },
}
