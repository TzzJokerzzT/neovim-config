local M = {}

-- C. Viper inspired color palette
M.colors = {
  -- Background and foreground
  bg = "#0a0a0f", -- Deep dark blue-black
  bg_alt = "#111118", -- Slightly lighter background
  bg_highlight = "#1a1a24", -- Highlight background
  fg = "#e8e8f0", -- Light grayish white
  fg_alt = "#c0c0d0", -- Dimmer foreground

  -- C. Viper's signature colors
  electric_red = "#ff4148", -- Her electric attacks
  deep_blue = "#0099cc", -- Darker blue variant
  viper_white = "#fdfcfe", -- Her suit accents
  light_purple = "#b347d9", -- Lighter purple variant
  cyber_green = "#00ff88", -- Tech/cyber green
  warning_orange = "#ff8800", -- Warning/energy color
  danger_red = "#ff4444", -- Error/critical color

  -- Neutrals and grays
  light_gray = "#a0a0b0", -- Comments and secondary text
  med_gray = "#707080", -- Muted elements
  dark_gray = "#404050", -- Borders and separators

  -- Accent colors for syntax
  string_green = "#88ff88", -- Strings
  number_cyan = "#44dddd", -- Numbers
  keyword_blue = "#66bbff", -- Keywords
  function_yellow = "#ffdd44", -- Functions
  method_orange = "#ff9966", -- Methods (different from functions)
  property_cyan = "#66ddff", -- Properties (different from variables)
  jsx_attr_green = "#88dd88", -- JSX attribute names (fallback, className, etc.)
  jsx_prop_purple = "#cc88ff", -- JSX prop values and expressions
  type_magenta = "#dd88ff", -- Types
  constant_orange = "#ffaa44", -- Constants
  html_tag_blue = "#4488ff", -- HTML tags (keep consistent)
}

-- Apply colorscheme
function M.setup(opts)
  opts = opts or {}
  local transparent = opts.transparent or true -- Default to transparent

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "c_viper"
  vim.o.background = "dark"

  local c = M.colors

  -- Override background colors for transparency
  if transparent then
    c.bg = "NONE"
    c.bg_alt = "NONE"
  end

  -- -- Basic highlight groups
  local highlights = {
    -- Editor highlights
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = transparent and "NONE" or c.bg_alt },
    Cursor = { fg = c.bg, bg = c.dark_gray },
    CursorLine = { bg = c.bg_highlight },
    CursorColumn = { bg = c.bg_highlight },
    LineNr = { fg = c.med_gray },
    CursorLineNr = { fg = c.electric_red, bold = true },
    SignColumn = { bg = transparent and "NONE" or c.bg },
    ColorColumn = { bg = c.bg_highlight },

    -- Visual selection
    Visual = { bg = c.light_gray, fg = c.bg },
    VisualNOS = { bg = c.deep_blue, fg = c.fg },

    -- Search
    Search = { bg = c.warning_orange, fg = c.bg, bold = true },
    IncSearch = { bg = c.electric_red, fg = c.bg, bold = true },

    -- Messages and command line
    MsgArea = { fg = c.fg, bg = transparent and "NONE" or c.bg },
    ModeMsg = { fg = c.electric_red, bold = true },
    MoreMsg = { fg = c.cyber_green, bold = true },
    ErrorMsg = { fg = c.danger_red, bold = true },
    WarningMsg = { fg = c.warning_orange, bold = true },

    -- Popup menu
    Pmenu = { fg = c.fg, bg = c.bg_alt },
    PmenuSel = { fg = c.bg, bg = c.electric_red },
    PmenuSbar = { bg = c.dark_gray },
    PmenuThumb = { bg = c.med_gray },

    -- Tabs and status line
    TabLine = { fg = c.light_gray, bg = c.bg_alt },
    TabLineSel = { fg = c.fg, bg = c.viper_white, bold = true },
    TabLineFill = { bg = c.bg_alt },
    StatusLine = { fg = c.fg, bg = c.bg_alt },
    StatusLineNC = { fg = c.med_gray, bg = c.bg_alt },

    -- Diff
    DiffAdd = { fg = c.cyber_green, bg = c.bg_highlight },
    DiffChange = { fg = c.warning_orange, bg = c.bg_highlight },
    DiffDelete = { fg = c.danger_red, bg = c.bg_highlight },
    DiffText = { fg = c.electric_red, bg = c.bg_highlight, bold = true },

    -- Folding
    Folded = { fg = c.light_gray, bg = c.bg_alt, italic = true },
    FoldColumn = { fg = c.med_gray, bg = transparent and "NONE" or c.bg },

    -- Syntax highlighting
    Comment = { fg = c.light_gray, italic = true },

    Constant = { fg = c.constant_orange },
    String = { fg = c.string_green },
    Character = { fg = c.string_green },
    Number = { fg = c.number_cyan },
    Boolean = { fg = c.number_cyan },
    Float = { fg = c.number_cyan },

    Identifier = { fg = c.fg },
    Function = { fg = c.function_yellow, bold = true },

    Statement = { fg = c.keyword_blue, bold = true },
    Conditional = { fg = c.keyword_blue, bold = true },
    Repeat = { fg = c.keyword_blue, bold = true },
    Label = { fg = c.keyword_blue, bold = true },
    Operator = { fg = c.deep_blue },
    Keyword = { fg = c.keyword_blue, bold = true },
    Exception = { fg = c.danger_red, bold = true },

    PreProc = { fg = c.viper_white },
    Include = { fg = c.viper_white, bold = true },
    Define = { fg = c.viper_white },
    Macro = { fg = c.viper_white },
    PreCondit = { fg = c.viper_white },

    Type = { fg = c.type_magenta, bold = true },
    StorageClass = { fg = c.type_magenta, bold = true },
    Structure = { fg = c.type_magenta, bold = true },
    Typedef = { fg = c.type_magenta, bold = true },

    Special = { fg = c.electric_red },
    SpecialChar = { fg = c.electric_red },
    Tag = { fg = c.electric_red },
    -- htmlTagName = { fg = c.html_tag_blue, bold = true },
    -- htmlEndTag = { fg = c.html_tag_blue, bold = true },
    -- htmlArg = { fg = c.html_tag_blue },
    -- htmlTagN = { fg = c.html_tag_blue, bold = true },
    Delimiter = { fg = c.fg_alt },
    SpecialComment = { fg = c.cyber_green, italic = true },
    Debug = { fg = c.warning_orange },

    Underlined = { fg = c.electric_red, underline = true },
    Ignore = { fg = c.med_gray },
    Error = { fg = c.danger_red, bold = true },
    Todo = { fg = c.warning_orange, bg = c.bg_alt, bold = true },
  }

  -- Apply highlights
  for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Setup language-specific highlights
  local ok, languages = pcall(require, "c_viper.languages")
  if ok then
    languages.setup()
  end

  -- Setup plugin integrations if available
  local ok, plugins = pcall(require, "c_viper.plugins")
  if ok then
    plugins.setup()
  end
end

return M
