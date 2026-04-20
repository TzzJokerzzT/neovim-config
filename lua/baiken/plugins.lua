local M = {}

function M.setup()
  local c = require("baiken").colors

  local plugin_highlights = {
    -- LSP highlights
    LspReferenceText = { bg = c.bg_highlight },
    LspReferenceRead = { bg = c.bg_highlight },
    LspReferenceWrite = { bg = c.bg_highlight, underline = true },

    -- Diagnostic highlights
    DiagnosticError = { fg = c.danger_red },
    DiagnosticWarn = { fg = c.warning_amber },
    DiagnosticInfo = { fg = c.info_blue },
    DiagnosticHint = { fg = c.success_green },

    DiagnosticUnderlineError = { sp = c.danger_red, underline = true },
    DiagnosticUnderlineWarn = { sp = c.warning_amber, underline = true },
    DiagnosticUnderlineInfo = { sp = c.info_blue, underline = true },
    DiagnosticUnderlineHint = { sp = c.success_green, underline = true },

    -- Telescope highlights
    TelescopeNormal = { fg = c.fg, bg = c.bg_alt },
    TelescopeBorder = { fg = c.indigo, bg = c.bg_alt },
    TelescopeSelection = { fg = c.fg, bg = c.charcoal },
    TelescopeSelectionCaret = { fg = c.vermilion },
    TelescopeMultiSelection = { fg = c.gold },
    TelescopeMatching = { fg = c.function_gold, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = c.bg_highlight },
    TelescopePromptBorder = { fg = c.indigo, bg = c.bg_highlight },
    TelescopePromptTitle = { fg = "#0d0b0f", bg = c.vermilion, bold = true },
    TelescopePreviewTitle = { fg = "#0d0b0f", bg = c.gold, bold = true },
    TelescopeResultsTitle = { fg = "#0d0b0f", bg = c.indigo, bold = true },

    -- Git signs
    GitSignsAdd = { fg = c.success_green },
    GitSignsChange = { fg = c.warning_amber },
    GitSignsDelete = { fg = c.danger_red },
    GitSignsCurrentLineBlame = { fg = c.med_gray, italic = true },

    -- NvimTree / File explorer
    NvimTreeNormal = { fg = c.fg, bg = c.bg_alt },
    NvimTreeNormalNC = { fg = c.fg, bg = c.bg_alt },
    NvimTreeRootFolder = { fg = c.vermilion, bold = true },
    NvimTreeFolderName = { fg = c.indigo_light },
    NvimTreeFolderIcon = { fg = c.indigo_light },
    NvimTreeOpenedFolderName = { fg = c.indigo_light, bold = true },
    NvimTreeOpenedFile = { fg = c.function_gold },
    NvimTreeGitDirty = { fg = c.warning_amber },
    NvimTreeGitNew = { fg = c.success_green },
    NvimTreeGitDeleted = { fg = c.danger_red },
    NvimTreeSpecialFile = { fg = c.cherry_blossom, underline = true },
    NvimTreeIndentMarker = { fg = c.dark_gray },

    -- Lualine
    lualine_a_normal = { fg = "#0d0b0f", bg = c.indigo, bold = true },
    lualine_a_insert = { fg = "#0d0b0f", bg = c.success_green, bold = true },
    lualine_a_visual = { fg = "#0d0b0f", bg = c.vermilion, bold = true },
    lualine_a_replace = { fg = "#0d0b0f", bg = c.danger_red, bold = true },
    lualine_a_command = { fg = "#0d0b0f", bg = c.gold, bold = true },
    lualine_b_normal = { fg = c.fg, bg = c.bg_alt },
    lualine_c_normal = { fg = c.fg_alt, bg = c.bg },

    -- Which-key
    WhichKey = { fg = c.vermilion, bold = true },
    WhichKeyGroup = { fg = c.indigo_light, bold = true },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeperator = { fg = c.gold },
    WhichKeyFloat = { bg = c.bg_alt },
    WhichKeyBorder = { fg = c.indigo, bg = c.bg_alt },

    -- Indent Blankline
    IndentBlanklineChar = { fg = c.dark_gray },
    IndentBlanklineContextChar = { fg = c.indigo },
    IndentBlanklineSpaceChar = { fg = c.dark_gray },
    IndentBlanklineSpaceCharBlankline = { fg = c.dark_gray },

    -- CMP (completion)
    CmpItemAbbrDeprecated = { fg = c.med_gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.vermilion, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.vermilion, bold = true },
    CmpItemKindVariable = { fg = c.fg },
    CmpItemKindInterface = { fg = c.type_indigo },
    CmpItemKindText = { fg = c.fg },
    CmpItemKindFunction = { fg = c.function_gold },
    CmpItemKindMethod = { fg = c.function_gold },
    CmpItemKindKeyword = { fg = c.keyword_indigo },
    CmpItemKindProperty = { fg = c.property_cherry },
    CmpItemKindUnit = { fg = c.number_gold },
    CmpItemKindConstructor = { fg = c.type_indigo },
    CmpItemKindClass = { fg = c.type_indigo },
    CmpItemKindModule = { fg = c.indigo_light },
    CmpItemKindOperator = { fg = c.indigo },
    CmpItemKindSnippet = { fg = c.gold },
    CmpItemKindFile = { fg = c.fg_alt },
    CmpItemKindFolder = { fg = c.indigo_light },
    CmpItemKindConstant = { fg = c.constant_gold },
    CmpItemKindEnum = { fg = c.type_indigo },
    CmpItemKindEnumMember = { fg = c.constant_gold },
    CmpItemKindStruct = { fg = c.type_indigo },
    CmpItemKindTypeParameter = { fg = c.type_indigo },

    -- Notify
    NotifyERRORBorder = { fg = c.danger_red },
    NotifyWARNBorder = { fg = c.warning_amber },
    NotifyINFOBorder = { fg = c.info_blue },
    NotifyDEBUGBorder = { fg = c.med_gray },
    NotifyTRACEBorder = { fg = c.cherry_blossom },
    NotifyERRORIcon = { fg = c.danger_red },
    NotifyWARNIcon = { fg = c.warning_amber },
    NotifyINFOIcon = { fg = c.info_blue },
    NotifyDEBUGIcon = { fg = c.med_gray },
    NotifyTRACEIcon = { fg = c.cherry_blossom },
    NotifyERRORTitle = { fg = c.danger_red, bold = true },
    NotifyWARNTitle = { fg = c.warning_amber, bold = true },
    NotifyINFOTitle = { fg = c.info_blue, bold = true },
    NotifyDEBUGTitle = { fg = c.med_gray, bold = true },
    NotifyTRACETitle = { fg = c.cherry_blossom, bold = true },
  }

  -- Apply plugin highlights
  for group, hl_opts in pairs(plugin_highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end
end

return M
