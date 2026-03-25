local M = {}

function M.setup(opts)
  local theme = require("cyberpunk_2077")
  local c = theme.colors
  local transparent = ((opts or {}).transparent) or ((theme.state or {}).transparent) or false

  local function bg(value)
    return transparent and "NONE" or value
  end

  local alt_bg = bg(c.bg_alt)
  local highlight_bg = bg(c.bg_highlight)

  local plugin_highlights = {
    -- LSP references
    LspReferenceText = { bg = highlight_bg },
    LspReferenceRead = { bg = highlight_bg },
    LspReferenceWrite = { bg = highlight_bg, underline = true },

    -- Diagnostics
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },

    DiagnosticUnderlineError = { sp = c.error, underline = true },
    DiagnosticUnderlineWarn = { sp = c.warning, underline = true },
    DiagnosticUnderlineInfo = { sp = c.info, underline = true },
    DiagnosticUnderlineHint = { sp = c.hint, underline = true },

    -- Telescope
    TelescopeNormal = { fg = c.fg, bg = alt_bg },
    TelescopeBorder = { fg = c.border, bg = alt_bg },
    TelescopeSelection = { fg = c.black, bg = c.neon_cyan },
    TelescopeSelectionCaret = { fg = c.neon_red },
    TelescopeMultiSelection = { fg = c.info },
    TelescopeMatching = { fg = c.acid_yellow, bold = true },
    TelescopePromptNormal = { fg = c.fg, bg = highlight_bg },
    TelescopePromptBorder = { fg = c.border, bg = highlight_bg },
    TelescopePromptTitle = { fg = c.black, bg = c.neon_red, bold = true },
    TelescopePreviewTitle = { fg = c.black, bg = c.neon_cyan, bold = true },
    TelescopeResultsTitle = { fg = c.black, bg = c.acid_yellow, bold = true },

    -- Git signs
    GitSignsAdd = { fg = c.diff_add },
    GitSignsChange = { fg = c.diff_change },
    GitSignsDelete = { fg = c.diff_delete },
    GitSignsCurrentLineBlame = { fg = c.muted, italic = true },

    -- NvimTree
    NvimTreeNormal = { fg = c.fg, bg = alt_bg },
    NvimTreeNormalNC = { fg = c.fg, bg = alt_bg },
    NvimTreeRootFolder = { fg = c.neon_red, bold = true },
    NvimTreeFolderName = { fg = c.neon_cyan },
    NvimTreeFolderIcon = { fg = c.neon_cyan },
    NvimTreeOpenedFolderName = { fg = c.neon_cyan, bold = true },
    NvimTreeOpenedFile = { fg = c.acid_yellow },
    NvimTreeGitDirty = { fg = c.warning },
    NvimTreeGitNew = { fg = c.info },
    NvimTreeGitDeleted = { fg = c.error },
    NvimTreeSpecialFile = { fg = c.neon_red, underline = true },
    NvimTreeIndentMarker = { fg = c.border },

    -- Cmp
    CmpItemAbbrDeprecated = { fg = c.muted, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.neon_cyan, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.neon_cyan, bold = true },
    CmpItemKindVariable = { fg = c.fg },
    CmpItemKindInterface = { fg = c.type },
    CmpItemKindText = { fg = c.fg },
    CmpItemKindFunction = { fg = c.func },
    CmpItemKindMethod = { fg = c.neon_cyan },
    CmpItemKindKeyword = { fg = c.keyword },
    CmpItemKindProperty = { fg = c.neon_cyan },
    CmpItemKindUnit = { fg = c.number },
    CmpItemKindConstructor = { fg = c.type },
    CmpItemKindClass = { fg = c.type },
    CmpItemKindModule = { fg = c.acid_yellow },
    CmpItemKindOperator = { fg = c.neon_cyan },
    CmpItemKindSnippet = { fg = c.info },
    CmpItemKindFile = { fg = c.fg_alt },
    CmpItemKindFolder = { fg = c.neon_cyan },
    CmpItemKindConstant = { fg = c.constant },
    CmpItemKindEnum = { fg = c.type },
    CmpItemKindEnumMember = { fg = c.constant },
    CmpItemKindStruct = { fg = c.type },
    CmpItemKindTypeParameter = { fg = c.type },

    -- WhichKey
    WhichKey = { fg = c.neon_red, bold = true },
    WhichKeyGroup = { fg = c.acid_yellow, bold = true },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeperator = { fg = c.info },
    WhichKeyFloat = { bg = alt_bg },
    WhichKeyBorder = { fg = c.border, bg = alt_bg },

    -- Notify
    NotifyERRORBorder = { fg = c.error },
    NotifyWARNBorder = { fg = c.warning },
    NotifyINFOBorder = { fg = c.info },
    NotifyDEBUGBorder = { fg = c.muted },
    NotifyTRACEBorder = { fg = c.neon_cyan },
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.muted },
    NotifyTRACEIcon = { fg = c.neon_cyan },
    NotifyERRORTitle = { fg = c.error, bold = true },
    NotifyWARNTitle = { fg = c.warning, bold = true },
    NotifyINFOTitle = { fg = c.info, bold = true },
    NotifyDEBUGTitle = { fg = c.muted, bold = true },
    NotifyTRACETitle = { fg = c.neon_cyan, bold = true },
  }

  for group, hl in pairs(plugin_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
