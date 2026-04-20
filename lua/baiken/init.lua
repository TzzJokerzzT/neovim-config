local M = {}

-- Baiken inspired color palette
M.colors = {
  -- Background and foreground
  bg = "#0d0b0f", -- Deep dark with slight warm tint
  bg_alt = "#151219", -- Slightly lighter background
  bg_highlight = "#1f1a24", -- Highlight background (warm purple-gray)
  fg = "#ebe4ef", -- Light warm white
  fg_alt = "#c4bac8", -- Dimmer foreground

  -- Baiken's signature colors
  vermilion = "#E34234", -- Primary kimono red
  indigo = "#3D4F91", -- Armor/details blue
  charcoal = "#36454F", -- Base clothes dark
  gold = "#D4AF37", -- Armor trim
  cherry_blossom = "#F6AEA9", -- Accents pink

  -- Derived accent colors
  vermilion_light = "#f0665a", -- Lighter vermilion for readability
  indigo_light = "#5a6fbd", -- Lighter indigo for syntax
  gold_light = "#e8c95a", -- Lighter gold for functions
  cherry_dark = "#d4807a", -- Muted cherry for subtle accents

  -- Semantic colors
  danger_red = "#ff4444", -- Errors
  warning_amber = "#e8a030", -- Warnings
  success_green = "#6abf6a", -- Success/added
  info_blue = "#5a8fd4", -- Info/hints

  -- Neutrals and grays
  light_gray = "#9a9099", -- Comments and secondary text
  med_gray = "#6b6070", -- Muted elements
  dark_gray = "#3d3545", -- Borders and separators

  -- Syntax colors (derived from palette)
  string_pink = "#F6AEA9", -- Strings (cherry blossom)
  number_gold = "#D4AF37", -- Numbers (gold)
  keyword_indigo = "#5a6fbd", -- Keywords (indigo light)
  function_gold = "#e8c95a", -- Functions (gold light)
  method_vermilion = "#f0665a", -- Methods (vermilion light)
  property_cherry = "#d4807a", -- Properties (cherry dark)
  type_indigo = "#7b8fd4", -- Types (lighter indigo)
  constant_gold = "#D4AF37", -- Constants (gold)
  html_tag_indigo = "#3D4F91", -- HTML tags (indigo)
  jsx_attr_cherry = "#F6AEA9", -- JSX attributes (cherry blossom)
  jsx_prop_vermilion = "#E34234", -- JSX prop values (vermilion)
}

-- Apply colorscheme
function M.setup(opts)
  opts = opts or {}
  local transparent = opts.transparent == nil and true or opts.transparent

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "baiken"
  vim.o.background = "dark"

  local c = M.colors

  -- Override background colors for transparency
  if transparent then
    c.bg = "NONE"
    c.bg_alt = "NONE"
  end

  local highlights = {
    -- Editor highlights
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = transparent and "NONE" or c.bg_alt },
    Cursor = { fg = c.bg, bg = c.dark_gray },
    CursorLine = { bg = c.bg_highlight },
    CursorColumn = { bg = c.bg_highlight },
    LineNr = { fg = c.med_gray },
    CursorLineNr = { fg = c.vermilion, bold = true },
    SignColumn = { bg = transparent and "NONE" or c.bg },
    ColorColumn = { bg = c.bg_highlight },

    -- Visual selection
    Visual = { bg = c.light_gray, fg = c.bg },
    VisualNOS = { bg = c.indigo, fg = c.fg },

    -- Search
    Search = { bg = c.gold, fg = "#0d0b0f", bold = true },
    IncSearch = { bg = c.vermilion, fg = "#0d0b0f", bold = true },

    -- Messages and command line
    MsgArea = { fg = c.fg, bg = transparent and "NONE" or c.bg },
    ModeMsg = { fg = c.vermilion, bold = true },
    MoreMsg = { fg = c.success_green, bold = true },
    ErrorMsg = { fg = c.danger_red, bold = true },
    WarningMsg = { fg = c.warning_amber, bold = true },

    -- Popup menu
    Pmenu = { fg = c.fg, bg = c.bg_alt },
    PmenuSel = { fg = "#0d0b0f", bg = c.vermilion },
    PmenuSbar = { bg = c.dark_gray },
    PmenuThumb = { bg = c.med_gray },

    -- Tabs and status line
    TabLine = { fg = c.light_gray, bg = c.bg_alt },
    TabLineSel = { fg = c.fg, bg = c.charcoal, bold = true },
    TabLineFill = { bg = c.bg_alt },
    StatusLine = { fg = c.fg, bg = c.bg_alt },
    StatusLineNC = { fg = c.med_gray, bg = c.bg_alt },

    -- Diff
    DiffAdd = { fg = c.success_green, bg = c.bg_highlight },
    DiffChange = { fg = c.warning_amber, bg = c.bg_highlight },
    DiffDelete = { fg = c.danger_red, bg = c.bg_highlight },
    DiffText = { fg = c.vermilion, bg = c.bg_highlight, bold = true },

    -- Folding
    Folded = { fg = c.light_gray, bg = c.bg_alt, italic = true },
    FoldColumn = { fg = c.med_gray, bg = transparent and "NONE" or c.bg },

    -- Syntax highlighting
    Comment = { fg = c.light_gray, italic = true },

    Constant = { fg = c.constant_gold },
    String = { fg = c.string_pink },
    Character = { fg = c.string_pink },
    Number = { fg = c.number_gold },
    Boolean = { fg = c.number_gold },
    Float = { fg = c.number_gold },

    Identifier = { fg = c.fg },
    Function = { fg = c.function_gold, bold = true },

    Statement = { fg = c.keyword_indigo, bold = true },
    Conditional = { fg = c.keyword_indigo, bold = true },
    Repeat = { fg = c.keyword_indigo, bold = true },
    Label = { fg = c.keyword_indigo, bold = true },
    Operator = { fg = c.indigo },
    Keyword = { fg = c.keyword_indigo, bold = true },
    Exception = { fg = c.danger_red, bold = true },

    PreProc = { fg = c.cherry_blossom },
    Include = { fg = c.cherry_blossom, bold = true },
    Define = { fg = c.cherry_blossom },
    Macro = { fg = c.cherry_blossom },
    PreCondit = { fg = c.cherry_blossom },

    Type = { fg = c.type_indigo, bold = true },
    StorageClass = { fg = c.type_indigo, bold = true },
    Structure = { fg = c.type_indigo, bold = true },
    Typedef = { fg = c.type_indigo, bold = true },

    Special = { fg = c.vermilion },
    SpecialChar = { fg = c.vermilion },
    Tag = { fg = c.vermilion },
    Delimiter = { fg = c.fg_alt },
    SpecialComment = { fg = c.gold, italic = true },
    Debug = { fg = c.warning_amber },

    Underlined = { fg = c.vermilion, underline = true },
    Ignore = { fg = c.med_gray },
    Error = { fg = c.danger_red, bold = true },
    Todo = { fg = c.gold, bg = c.bg_alt, bold = true },
  }

  -- Apply highlights
  for group, hl_opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end

  -- Setup language-specific highlights
  local ok, languages = pcall(require, "baiken.languages")
  if ok then
    languages.setup()
  end

  -- Setup plugin integrations if available
  local ok2, plugins = pcall(require, "baiken.plugins")
  if ok2 then
    plugins.setup()
  end
end

return M
