local M = {}

function M.setup()
  local c = require("c_viper").colors

  -- Plugin-specific highlights for better integration
  local plugin_highlights = {
    -- LSP highlights
    LspReferenceText = { bg = c.bg_highlight },
    LspReferenceRead = { bg = c.bg_highlight },
    LspReferenceWrite = { bg = c.bg_highlight, underline = true },

    -- Diagnostic highlights
    DiagnosticError = { fg = c.danger_red },
    DiagnosticWarn = { fg = c.warning_orange },
    DiagnosticInfo = { fg = c.electric_blue },
    DiagnosticHint = { fg = c.cyber_green },

    DiagnosticUnderlineError = { sp = c.danger_red, underline = true },
    DiagnosticUnderlineWarn = { sp = c.warning_orange, underline = true },
    DiagnosticUnderlineInfo = { sp = c.electric_blue, underline = true },
    DiagnosticUnderlineHint = { sp = c.cyber_green, underline = true },

    -- Telescope highlights
    TelescopeNormal = { fg = c.fg, bg = c.bg_alt },
    TelescopeBorder = { fg = c.electric_blue, bg = c.bg_alt },
    TelescopeSelection = { fg = c.fg, bg = c.viper_purple },
    TelescopeSelectionCaret = { fg = c.electric_blue },
    TelescopeMultiSelection = { fg = c.cyber_green },
    TelescopeMatching = { fg = c.function_yellow, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_highlight },
    TelescopePromptBorder = { fg = c.electric_blue, bg = c.bg_highlight },
    TelescopePromptTitle = { fg = c.bg, bg = c.electric_blue, bold = true },
    TelescopePreviewTitle = { fg = c.bg, bg = c.cyber_green, bold = true },
    TelescopeResultsTitle = { fg = c.bg, bg = c.viper_purple, bold = true },

    -- Git signs
    GitSignsAdd = { fg = c.cyber_green },
    GitSignsChange = { fg = c.warning_orange },
    GitSignsDelete = { fg = c.danger_red },
    GitSignsCurrentLineBlame = { fg = c.med_gray, italic = true },

    -- NvimTree / File explorer
    NvimTreeNormal = { fg = c.fg, bg = c.bg_alt },
    NvimTreeNormalNC = { fg = c.fg, bg = c.bg_alt },
    NvimTreeRootFolder = { fg = c.electric_blue, bold = true },
    NvimTreeFolderName = { fg = c.light_purple },
    NvimTreeFolderIcon = { fg = c.light_purple },
    NvimTreeOpenedFolderName = { fg = c.light_purple, bold = true },
    NvimTreeOpenedFile = { fg = c.function_yellow },
    NvimTreeGitDirty = { fg = c.warning_orange },
    NvimTreeGitNew = { fg = c.cyber_green },
    NvimTreeGitDeleted = { fg = c.danger_red },
    NvimTreeSpecialFile = { fg = c.electric_blue, underline = true },
    NvimTreeIndentMarker = { fg = c.dark_gray },

    -- Lualine
    lualine_a_normal = { fg = c.bg, bg = c.electric_blue, bold = true },
    lualine_a_insert = { fg = c.bg, bg = c.cyber_green, bold = true },
    lualine_a_visual = { fg = c.bg, bg = c.viper_purple, bold = true },
    lualine_a_replace = { fg = c.bg, bg = c.danger_red, bold = true },
    lualine_a_command = { fg = c.bg, bg = c.warning_orange, bold = true },
    lualine_b_normal = { fg = c.fg, bg = c.bg_alt },
    lualine_c_normal = { fg = c.fg_alt, bg = c.bg },

    -- Which-key
    WhichKey = { fg = c.electric_blue, bold = true },
    WhichKeyGroup = { fg = c.viper_purple, bold = true },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeperator = { fg = c.cyber_green },
    WhichKeyFloat = { bg = c.bg_alt },
    WhichKeyBorder = { fg = c.electric_blue, bg = c.bg_alt },

    -- Indent Blankline
    IndentBlanklineChar = { fg = c.dark_gray },
    IndentBlanklineContextChar = { fg = c.electric_blue },
    IndentBlanklineSpaceChar = { fg = c.dark_gray },
    IndentBlanklineSpaceCharBlankline = { fg = c.dark_gray },

    -- CMP (completion)
    CmpItemAbbrDeprecated = { fg = c.med_gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.electric_blue, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.electric_blue, bold = true },
    CmpItemKindVariable = { fg = c.fg },
    CmpItemKindInterface = { fg = c.type_magenta },
    CmpItemKindText = { fg = c.fg },
    CmpItemKindFunction = { fg = c.function_yellow },
    CmpItemKindMethod = { fg = c.function_yellow },
    CmpItemKindKeyword = { fg = c.keyword_blue },
    CmpItemKindProperty = { fg = c.light_purple },
    CmpItemKindUnit = { fg = c.number_cyan },
    CmpItemKindConstructor = { fg = c.type_magenta },
    CmpItemKindClass = { fg = c.type_magenta },
    CmpItemKindModule = { fg = c.viper_purple },
    CmpItemKindOperator = { fg = c.electric_blue },
    CmpItemKindSnippet = { fg = c.cyber_green },
    CmpItemKindFile = { fg = c.fg_alt },
    CmpItemKindFolder = { fg = c.light_purple },
    CmpItemKindConstant = { fg = c.constant_orange },
    CmpItemKindEnum = { fg = c.type_magenta },
    CmpItemKindEnumMember = { fg = c.constant_orange },
    CmpItemKindStruct = { fg = c.type_magenta },
    CmpItemKindTypeParameter = { fg = c.type_magenta },

    -- Notify
    NotifyERRORBorder = { fg = c.danger_red },
    NotifyWARNBorder = { fg = c.warning_orange },
    NotifyINFOBorder = { fg = c.electric_blue },
    NotifyDEBUGBorder = { fg = c.med_gray },
    NotifyTRACEBorder = { fg = c.viper_purple },
    NotifyERRORIcon = { fg = c.danger_red },
    NotifyWARNIcon = { fg = c.warning_orange },
    NotifyINFOIcon = { fg = c.electric_blue },
    NotifyDEBUGIcon = { fg = c.med_gray },
    NotifyTRACEIcon = { fg = c.viper_purple },
    NotifyERRORTitle = { fg = c.danger_red, bold = true },
    NotifyWARNTitle = { fg = c.warning_orange, bold = true },
    NotifyINFOTitle = { fg = c.electric_blue, bold = true },
    NotifyDEBUGTitle = { fg = c.med_gray, bold = true },
    NotifyTRACETitle = { fg = c.viper_purple, bold = true },
  }

  -- Apply plugin highlights
  for group, opts in pairs(plugin_highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
