local M = {}

function M.setup()
  local c = require("cyberpunk_2077").colors

  local ts_highlights = {
    ["@keyword.typescript"] = { fg = c.keyword, bold = true },
    ["@keyword.javascript"] = { fg = c.keyword, bold = true },

    ["@type.typescript"] = { fg = c.type, bold = true },
    ["@type.builtin.typescript"] = { fg = c.type, bold = true },
    ["@type.definition.typescript"] = { fg = c.type, bold = true },

    ["@variable.typescript"] = { fg = c.fg },
    ["@variable.javascript"] = { fg = c.fg },
    ["@variable.builtin.typescript"] = { fg = c.neon_red },
    ["@variable.builtin.javascript"] = { fg = c.neon_red },
    ["@variable.parameter.typescript"] = { fg = c.fg_alt, italic = true },
    ["@variable.parameter.javascript"] = { fg = c.fg_alt, italic = true },

    ["@function.typescript"] = { fg = c.func, bold = true },
    ["@function.javascript"] = { fg = c.func, bold = true },
    ["@function.method.typescript"] = { fg = c.neon_cyan, bold = true },
    ["@function.method.javascript"] = { fg = c.neon_cyan, bold = true },
    ["@function.builtin.typescript"] = { fg = c.acid_yellow, bold = true },
    ["@function.builtin.javascript"] = { fg = c.acid_yellow, bold = true },

    ["@constant.typescript"] = { fg = c.constant },
    ["@constant.javascript"] = { fg = c.constant },
    ["@property.typescript"] = { fg = c.neon_cyan },
    ["@property.javascript"] = { fg = c.neon_cyan },

    ["@string.typescript"] = { fg = c.string },
    ["@string.javascript"] = { fg = c.string },
    ["@string.template.typescript"] = { fg = c.string },
    ["@string.template.javascript"] = { fg = c.string },

    ["@number.typescript"] = { fg = c.number },
    ["@number.javascript"] = { fg = c.number },

    ["@operator.typescript"] = { fg = c.neon_cyan },
    ["@operator.javascript"] = { fg = c.neon_cyan },

    ["@punctuation.bracket.typescript"] = { fg = c.fg_alt },
    ["@punctuation.bracket.javascript"] = { fg = c.fg_alt },
    ["@punctuation.delimiter.typescript"] = { fg = c.fg_alt },
    ["@punctuation.delimiter.javascript"] = { fg = c.fg_alt },

    ["@constructor.typescript"] = { fg = c.type, bold = true },
    ["@constructor.javascript"] = { fg = c.type, bold = true },
    ["@namespace.typescript"] = { fg = c.acid_yellow, bold = true },

    ["@keyword.import.typescript"] = { fg = c.acid_yellow, bold = true },
    ["@keyword.import.javascript"] = { fg = c.acid_yellow, bold = true },
    ["@keyword.export.typescript"] = { fg = c.acid_yellow, bold = true },
    ["@keyword.export.javascript"] = { fg = c.acid_yellow, bold = true },

    ["@comment.typescript"] = { fg = c.muted, italic = true },
    ["@comment.javascript"] = { fg = c.muted, italic = true },
    ["@comment.documentation.typescript"] = { fg = c.info, italic = true },
    ["@comment.documentation.javascript"] = { fg = c.info, italic = true },
  }

  local react_highlights = {
    ["@tag.tsx"] = { fg = c.neon_red, bold = true },
    ["@tag.jsx"] = { fg = c.neon_red, bold = true },

    ["@tag.builtin.tsx"] = { fg = c.type, bold = true },
    ["@tag.builtin.jsx"] = { fg = c.type, bold = true },

    ["@tag.delimiter.tsx"] = { fg = c.neon_red },
    ["@tag.delimiter.jsx"] = { fg = c.neon_red },

    ["@tag.attribute.tsx"] = { fg = c.acid_yellow },
    ["@tag.attribute.jsx"] = { fg = c.acid_yellow },
    ["@attribute.tsx"] = { fg = c.acid_yellow },
    ["@attribute.jsx"] = { fg = c.acid_yellow },
    ["@property.tsx"] = { fg = c.acid_yellow },
    ["@property.jsx"] = { fg = c.acid_yellow },
    ["@field.tsx"] = { fg = c.acid_yellow },
    ["@field.jsx"] = { fg = c.acid_yellow },
    ["@variable.member.tsx"] = { fg = c.neon_cyan },
    ["@variable.member.jsx"] = { fg = c.neon_cyan },

    ["@constructor.tsx"] = { fg = c.neon_red, bold = true },
    ["@constructor.jsx"] = { fg = c.neon_red, bold = true },

    ["@function.builtin.tsx"] = { fg = c.info, bold = true },
    ["@function.builtin.jsx"] = { fg = c.info, bold = true },

    ["@variable.parameter.tsx"] = { fg = c.fg_alt, italic = true },
    ["@variable.parameter.jsx"] = { fg = c.fg_alt, italic = true },

    ["@punctuation.special.tsx"] = { fg = c.warning },
    ["@punctuation.special.jsx"] = { fg = c.warning },
  }

  local vue_highlights = {
    ["@tag.vue"] = { fg = c.type, bold = true },
    ["@tag.builtin.vue"] = { fg = c.type, bold = true },
    ["@tag.delimiter.vue"] = { fg = c.type },

    ["@tag.attribute.vue"] = { fg = c.acid_yellow },
    ["@keyword.directive.vue"] = { fg = c.keyword, bold = true },

    ["@keyword.vue"] = { fg = c.keyword, bold = true },
    ["@function.vue"] = { fg = c.func, bold = true },

    ["@punctuation.special.vue"] = { fg = c.warning },
  }

  for group, hl in pairs(ts_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  for group, hl in pairs(react_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  local jsx_attribute_overrides = {
    ["@tag.attribute"] = { fg = c.acid_yellow },
    ["@attribute"] = { fg = c.acid_yellow },
    ["htmlArg"] = { fg = c.acid_yellow },
    ["jsxAttrib"] = { fg = c.acid_yellow },
  }

  for group, hl in pairs(jsx_attribute_overrides) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  for group, hl in pairs(vue_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  local additional_highlights = {
    ["@field"] = { fg = c.neon_cyan },
    ["@property"] = { fg = c.neon_cyan },

    ["@method"] = { fg = c.neon_cyan, bold = true },
    ["@method.call"] = { fg = c.neon_cyan, bold = true },

    ["@symbol"] = { fg = c.acid_yellow, bold = true },
    ["@decorator"] = { fg = c.acid_yellow, bold = true },

    ["@string.escape"] = { fg = c.neon_red },
    ["@embedded"] = { fg = c.fg },

    ["@exception"] = { fg = c.error, bold = true },
    ["@keyword.exception"] = { fg = c.error, bold = true },

    ["@keyword.coroutine"] = { fg = c.acid_yellow, bold = true },

    ["@include"] = { fg = c.acid_yellow, bold = true },
    ["@namespace"] = { fg = c.acid_yellow, bold = true },
  }

  for group, hl in pairs(additional_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  local html_highlights = {
    ["@tag.html"] = { fg = c.type, bold = true },
    ["@tag.builtin.html"] = { fg = c.type, bold = true },
    ["@tag.delimiter.html"] = { fg = c.type },

    ["@tag.attribute.html"] = { fg = c.acid_yellow },
    ["@string.html"] = { fg = c.string },

    ["@tag.xml"] = { fg = c.type, bold = true },
    ["@tag.delimiter.xml"] = { fg = c.type },
    ["@tag.attribute.xml"] = { fg = c.acid_yellow },
  }

  for group, hl in pairs(html_highlights) do
    vim.api.nvim_set_hl(0, group, hl)
  end
end

return M
