return {
  {
    "wakatime/vim-wakatime",
    lazy = false,
    init = function()
      -- Ensure the CLI always resolves $HOME correctly regardless of how
      -- Neovim is launched (terminal, GUI, tmux, etc.).  The plugin and the
      -- CLI both derive the config-file path from $WAKATIME_HOME (falling
      -- back to $HOME), so pinning it here makes the setup portable across
      -- machines — just keep ~/.wakatime.cfg in place.
      vim.env.WAKATIME_HOME = vim.fn.expand("~")
    end,
  },
}
