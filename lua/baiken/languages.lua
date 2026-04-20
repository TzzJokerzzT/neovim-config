local M = {}

function M.setup()
  local c = require("baiken").colors

  -- TypeScript/JavaScript specific highlights
  local ts_highlights = {
    -- KEYWORDS
    ["@keyword.typescript"] = { fg = c.keyword_indigo, bold = true },
    ["@keyword.javascript"] = { fg = c.keyword_indigo, bold = true },

    -- TYPES
    ["@type.typescript"] = { fg = c.type_indigo, bold = true },
    ["@type.builtin.typescript"] = { fg = c.type_indigo, bold = true },
    ["@type.definition.typescript"] = { fg = c.type_indigo, bold = true },

    -- VARIABLES AND IDENTIFIERS
    ["@variable.typescript"] = { fg = c.fg },
    ["@variable.javascript"] = { fg = c.fg },
    ["@variable.builtin.typescript"] = { fg = c.vermilion },
    ["@variable.builtin.javascript"] = { fg = c.vermilion },
    ["@variable.parameter.typescript"] = { fg = c.fg_alt, italic = true },
    ["@variable.parameter.javascript"] = { fg = c.fg_alt, italic = true },

    -- FUNCTIONS
    ["@function.typescript"] = { fg = c.function_gold, bold = true },
    ["@function.javascript"] = { fg = c.function_gold, bold = true },
    ["@function.method.typescript"] = { fg = c.method_vermilion, bold = true },
    ["@function.method.javascript"] = { fg = c.method_vermilion, bold = true },
    ["@function.builtin.typescript"] = { fg = c.success_green, bold = true },
    ["@function.builtin.javascript"] = { fg = c.success_green, bold = true },

    -- CONSTANTS AND PROPERTIES
    ["@constant.typescript"] = { fg = c.constant_gold },
    ["@constant.javascript"] = { fg = c.constant_gold },
    ["@property.typescript"] = { fg = c.property_cherry },
    ["@property.javascript"] = { fg = c.property_cherry },

    -- STRINGS AND LITERALS
    ["@string.typescript"] = { fg = c.string_pink },
    ["@string.javascript"] = { fg = c.string_pink },
    ["@string.template.typescript"] = { fg = c.string_pink },
    ["@string.template.javascript"] = { fg = c.string_pink },

    -- NUMBERS
    ["@number.typescript"] = { fg = c.number_gold },
    ["@number.javascript"] = { fg = c.number_gold },

    -- OPERATORS
    ["@operator.typescript"] = { fg = c.indigo },
    ["@operator.javascript"] = { fg = c.indigo },

    -- PUNCTUATION
    ["@punctuation.bracket.typescript"] = { fg = c.fg_alt },
    ["@punctuation.bracket.javascript"] = { fg = c.fg_alt },
    ["@punctuation.delimiter.typescript"] = { fg = c.fg_alt },
    ["@punctuation.delimiter.javascript"] = { fg = c.fg_alt },

    -- SPECIAL CONSTRUCTS
    ["@constructor.typescript"] = { fg = c.type_indigo, bold = true },
    ["@constructor.javascript"] = { fg = c.type_indigo, bold = true },
    ["@namespace.typescript"] = { fg = c.cherry_blossom, bold = true },

    -- IMPORT/EXPORT
    ["@keyword.import.typescript"] = { fg = c.cherry_blossom, bold = true },
    ["@keyword.import.javascript"] = { fg = c.cherry_blossom, bold = true },
    ["@keyword.export.typescript"] = { fg = c.cherry_blossom, bold = true },
    ["@keyword.export.javascript"] = { fg = c.cherry_blossom, bold = true },

    -- COMMENTS
    ["@comment.typescript"] = { fg = c.light_gray, italic = true },
    ["@comment.javascript"] = { fg = c.light_gray, italic = true },
    ["@comment.documentation.typescript"] = { fg = c.gold, italic = true },
    ["@comment.documentation.javascript"] = { fg = c.gold, italic = true },
  }

  -- React/JSX specific highlights
  local react_highlights = {
    -- JSX COMPONENT TAGS
    ["@tag.tsx"] = { fg = c.vermilion, bold = true },
    ["@tag.jsx"] = { fg = c.vermilion, bold = true },

    -- HTML TAGS IN JSX
    ["@tag.builtin.tsx"] = { fg = c.indigo_light, bold = true },
    ["@tag.builtin.jsx"] = { fg = c.indigo_light, bold = true },

    -- JSX TAG DELIMITERS
    ["@tag.delimiter.tsx"] = { fg = c.vermilion },
    ["@tag.delimiter.jsx"] = { fg = c.vermilion },

    -- JSX ATTRIBUTE NAMES
    ["@tag.attribute.tsx"] = { fg = c.cherry_blossom },
    ["@tag.attribute.jsx"] = { fg = c.cherry_blossom },
    ["@attribute.tsx"] = { fg = c.cherry_blossom },
    ["@attribute.jsx"] = { fg = c.cherry_blossom },
    ["@property.tsx"] = { fg = c.cherry_blossom },
    ["@property.jsx"] = { fg = c.cherry_blossom },
    ["@field.tsx"] = { fg = c.jsx_attr_cherry },
    ["@field.jsx"] = { fg = c.jsx_attr_cherry },
    ["@variable.member.tsx"] = { fg = c.jsx_attr_cherry },
    ["@variable.member.jsx"] = { fg = c.jsx_attr_cherry },

    -- COMPONENT NAMES
    ["@constructor.tsx"] = { fg = c.vermilion, bold = true },
    ["@constructor.jsx"] = { fg = c.vermilion, bold = true },

    -- REACT HOOKS
    ["@function.builtin.tsx"] = { fg = c.success_green, bold = true },
    ["@function.builtin.jsx"] = { fg = c.success_green, bold = true },

    -- COMPONENT PROPS
    ["@variable.parameter.tsx"] = { fg = c.cherry_dark, italic = true },
    ["@variable.parameter.jsx"] = { fg = c.cherry_dark, italic = true },

    -- JSX EXPRESSION BRACES
    ["@punctuation.special.tsx"] = { fg = c.gold },
    ["@punctuation.special.jsx"] = { fg = c.gold },
  }

  -- Vue specific highlights
  local vue_highlights = {
    ["@tag.vue"] = { fg = c.indigo_light, bold = true },
    ["@tag.builtin.vue"] = { fg = c.indigo_light, bold = true },
    ["@tag.delimiter.vue"] = { fg = c.indigo_light },
    ["@tag.attribute.vue"] = { fg = c.cherry_blossom },
    ["@keyword.directive.vue"] = { fg = c.gold, bold = true },
    ["@keyword.vue"] = { fg = c.keyword_indigo, bold = true },
    ["@function.vue"] = { fg = c.function_gold, bold = true },
    ["@punctuation.special.vue"] = { fg = c.gold },
  }

  -- Apply all highlights
  for group, hl_opts in pairs(ts_highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end

  for group, hl_opts in pairs(react_highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end

  -- High-priority JSX attribute overrides
  local jsx_attribute_overrides = {
    ["@tag.attribute"] = { fg = c.cherry_blossom },
    ["@attribute"] = { fg = c.cherry_blossom },
    ["htmlArg"] = { fg = c.cherry_blossom },
    ["jsxAttrib"] = { fg = c.cherry_blossom },
  }

  for group, hl_opts in pairs(jsx_attribute_overrides) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end

  for group, hl_opts in pairs(vue_highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end

  -- Additional TreeSitter highlights
  local additional_highlights = {
    ["@field"] = { fg = c.property_cherry },
    ["@property"] = { fg = c.property_cherry },
    ["@method"] = { fg = c.method_vermilion, bold = true },
    ["@method.call"] = { fg = c.method_vermilion, bold = true },
    ["@symbol"] = { fg = c.cherry_blossom, bold = true },
    ["@decorator"] = { fg = c.cherry_blossom, bold = true },
    ["@string.escape"] = { fg = c.vermilion },
    ["@embedded"] = { fg = c.fg },
    ["@exception"] = { fg = c.danger_red, bold = true },
    ["@keyword.exception"] = { fg = c.danger_red, bold = true },
    ["@keyword.coroutine"] = { fg = c.cherry_blossom, bold = true },
    ["@include"] = { fg = c.cherry_blossom, bold = true },
    ["@namespace"] = { fg = c.cherry_blossom, bold = true },
  }

  for group, hl_opts in pairs(additional_highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end

  -- Node.js specific highlights
  local node_highlights = {
    -- Node built-in globals (process, Buffer, __dirname, __filename, global)
    ["@variable.builtin.javascript"] = { fg = c.vermilion },
    ["@constant.builtin.javascript"] = { fg = c.vermilion, bold = true },

    -- require/module (CommonJS)
    ["@function.call.javascript"] = { fg = c.function_gold },
    ["@module.javascript"] = { fg = c.cherry_blossom, bold = true },

    -- Node core modules style (fs, path, http, etc.)
    ["@module.builtin.javascript"] = { fg = c.indigo_light, bold = true },

    -- Callbacks and error-first pattern
    ["@variable.parameter.javascript"] = { fg = c.fg_alt, italic = true },

    -- JSON highlights (common in Node.js)
    ["@property.json"] = { fg = c.cherry_blossom },
    ["@string.json"] = { fg = c.string_pink },
    ["@number.json"] = { fg = c.number_gold },
    ["@boolean.json"] = { fg = c.number_gold },
    ["@constant.json"] = { fg = c.constant_gold },

    -- Environment variables pattern (UPPER_CASE constants)
    ["@constant.javascript"] = { fg = c.constant_gold, bold = true },

    -- Promise/async patterns
    ["@keyword.coroutine.javascript"] = { fg = c.cherry_blossom, bold = true },
    ["@keyword.return.javascript"] = { fg = c.keyword_indigo, bold = true },

    -- YAML/TOML (config files common in Node projects)
    ["@property.yaml"] = { fg = c.cherry_blossom },
    ["@string.yaml"] = { fg = c.string_pink },
    ["@number.yaml"] = { fg = c.number_gold },
    ["@boolean.yaml"] = { fg = c.number_gold },
    ["@property.toml"] = { fg = c.cherry_blossom },
    ["@string.toml"] = { fg = c.string_pink },
    ["@number.toml"] = { fg = c.number_gold },
    ["@boolean.toml"] = { fg = c.number_gold },
  }

  for group, hl_opts in pairs(node_highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end

  -- HTML specific highlights
  local html_highlights = {
    ["@tag.html"] = { fg = c.indigo_light, bold = true },
    ["@tag.builtin.html"] = { fg = c.indigo_light, bold = true },
    ["@tag.delimiter.html"] = { fg = c.indigo_light },
    ["@tag.attribute.html"] = { fg = c.cherry_blossom },
    ["@string.html"] = { fg = c.string_pink },
    ["@tag.xml"] = { fg = c.indigo_light, bold = true },
    ["@tag.delimiter.xml"] = { fg = c.indigo_light },
    ["@tag.attribute.xml"] = { fg = c.cherry_blossom },
  }

  for group, hl_opts in pairs(html_highlights) do
    vim.api.nvim_set_hl(0, group, hl_opts)
  end
end

return M
