return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    build = "make",
    enabled = true,
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        api_key_name = "OPENAI_API_KEY",
        timeout = 30000,
        temperature = 0.3,
        max_tokens = 4096,
      },
      dual_boost = {
        enabled = false,
        first_provider = "openai",
        second_provider = "claude",
        prompt = "ased on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
        timeout = 60000, -- Timeout in milliseconds
      },
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
        behaviour = {
          auto_suggestions = false, -- Experimental stage
          auto_set_highlight_group = true,
          auto_set_keymaps = true,
          auto_apply_diff_after_generation = false,
          support_paste_from_clipboard = false,
          minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        },
      },
      ui = {
        sidebar = {
          enabled = true,
          width = 50,
          dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
          },
        },
      },
    },
  },
}
