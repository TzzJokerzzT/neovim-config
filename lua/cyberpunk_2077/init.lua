local M = {}

M.defaults = {
  transparent = false,
}

M.state = vim.deepcopy(M.defaults)

M.colors = {
  -- Base palette (required)
  black = "#000000",
  neon_red = "#c5003c",
  deep_red = "#880425",
  acid_yellow = "#f3e600",
  neon_cyan = "#55ead4",

  -- Derived palette
  bg = "#000000",
  bg_alt = "#0d0a0d",
  bg_highlight = "#1a1018",
  fg = "#f5f3ef",
  fg_alt = "#b9b2a9",
  border = "#36202a",
  muted = "#776d66",

  string = "#55ead4",
  number = "#f3e600",
  keyword = "#c5003c",
  func = "#f3e600",
  type = "#55ead4",
  constant = "#ff7a00",
  warning = "#ffb300",
  error = "#ff305a",
  info = "#55ead4",
  hint = "#84ffd1",
  diff_add = "#55ead4",
  diff_change = "#f3e600",
  diff_delete = "#c5003c",
}

function M.setup(opts)
  local config = vim.tbl_deep_extend("force", M.defaults, M.state, opts or {})
  M.state = config

  local transparent = config.transparent

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "cyberpunk_2077"
  vim.o.background = "dark"

  local c = M.colors
  local function bg(value)
    return transparent and "NONE" or value
  end

  local normal_bg = bg(c.bg)
  local alt_bg = bg(c.bg_alt)
  local highlight_bg = bg(c.bg_highlight)

  local highlights = {
    Normal = { fg = c.fg, bg = normal_bg },
    NormalNC = { fg = c.fg, bg = normal_bg },
    NormalFloat = { fg = c.fg, bg = alt_bg },
    FloatBorder = { fg = c.border, bg = alt_bg },
    FloatTitle = { fg = c.acid_yellow, bg = alt_bg, bold = true },
    EndOfBuffer = { fg = c.muted, bg = normal_bg },
    Cursor = { fg = c.black, bg = c.acid_yellow },
    CursorLine = { bg = highlight_bg },
    CursorColumn = { bg = highlight_bg },
    ColorColumn = { bg = highlight_bg },
    SignColumn = { bg = normal_bg },
    LineNr = { fg = c.muted },
    CursorLineNr = { fg = c.acid_yellow, bold = true },
    WinSeparator = { fg = c.border },

    Visual = { fg = c.black, bg = c.neon_cyan },
    VisualNOS = { fg = c.black, bg = c.neon_cyan },

    Search = { fg = c.black, bg = c.acid_yellow, bold = true },
    IncSearch = { fg = c.fg, bg = c.neon_red, bold = true },

    StatusLine = { fg = c.fg, bg = alt_bg },
    StatusLineNC = { fg = c.muted, bg = alt_bg },
    TabLine = { fg = c.fg_alt, bg = alt_bg },
    TabLineSel = { fg = c.black, bg = c.acid_yellow, bold = true },
    TabLineFill = { bg = alt_bg },

    Pmenu = { fg = c.fg, bg = alt_bg },
    PmenuSel = { fg = c.black, bg = c.neon_cyan, bold = true },
    PmenuSbar = { bg = highlight_bg },
    PmenuThumb = { bg = c.border },

    DiffAdd = { fg = c.diff_add, bg = highlight_bg },
    DiffChange = { fg = c.diff_change, bg = highlight_bg },
    DiffDelete = { fg = c.diff_delete, bg = highlight_bg },
    DiffText = { fg = c.black, bg = c.acid_yellow, bold = true },

    Comment = { fg = c.muted, italic = true },

    Constant = { fg = c.constant },
    String = { fg = c.string },
    Character = { fg = c.string },
    Number = { fg = c.number },
    Boolean = { fg = c.number },
    Float = { fg = c.number },

    Identifier = { fg = c.fg },
    Function = { fg = c.func, bold = true },

    Statement = { fg = c.keyword, bold = true },
    Conditional = { fg = c.keyword, bold = true },
    Repeat = { fg = c.keyword, bold = true },
    Label = { fg = c.keyword },
    Operator = { fg = c.neon_cyan },
    Keyword = { fg = c.keyword, bold = true },
    Exception = { fg = c.error, bold = true },

    PreProc = { fg = c.acid_yellow },
    Include = { fg = c.acid_yellow, bold = true },
    Define = { fg = c.acid_yellow },
    Macro = { fg = c.acid_yellow },
    PreCondit = { fg = c.acid_yellow },

    Type = { fg = c.type, bold = true },
    StorageClass = { fg = c.type, bold = true },
    Structure = { fg = c.type, bold = true },
    Typedef = { fg = c.type, bold = true },

    Special = { fg = c.neon_red },
    SpecialChar = { fg = c.neon_red },
    Tag = { fg = c.neon_red },
    Delimiter = { fg = c.fg_alt },
    SpecialComment = { fg = c.warning, italic = true },
    Debug = { fg = c.warning },

    Underlined = { fg = c.neon_cyan, underline = true },
    Ignore = { fg = c.muted },
    Error = { fg = c.error, bold = true },
    Todo = { fg = c.black, bg = c.acid_yellow, bold = true },

    ErrorMsg = { fg = c.error, bold = true },
    WarningMsg = { fg = c.warning, bold = true },
    MoreMsg = { fg = c.info, bold = true },
    ModeMsg = { fg = c.neon_red, bold = true },
  }

  for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  local ok_languages, languages = pcall(require, "cyberpunk_2077.languages")
  if ok_languages then
    languages.setup()
  end

  local ok_plugins, plugins = pcall(require, "cyberpunk_2077.plugins")
  if ok_plugins then
    plugins.setup(config)
  end
end

return M
