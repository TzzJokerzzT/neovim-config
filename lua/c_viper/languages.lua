local M = {}

function M.setup()
  local c = require("c_viper").colors

  -- TypeScript/JavaScript specific highlights
  local ts_highlights = {
    -- KEYWORDS: if, else, for, while, function, const, let, var, return, etc.
    ["@keyword.typescript"] = { fg = c.keyword_blue, bold = true },
    ["@keyword.javascript"] = { fg = c.keyword_blue, bold = true },

    -- TYPES: string, number, boolean, interface definitions, type aliases
    ["@type.typescript"] = { fg = c.type_magenta, bold = true },
    ["@type.builtin.typescript"] = { fg = c.type_magenta, bold = true },
    ["@type.definition.typescript"] = { fg = c.type_magenta, bold = true },

    -- VARIABLES AND IDENTIFIERS
    ["@variable.typescript"] = { fg = c.fg }, -- Regular variables: const myVar = 5
    ["@variable.javascript"] = { fg = c.fg }, -- Regular variables: const myVar = 5
    ["@variable.builtin.typescript"] = { fg = c.electric_red }, -- Built-in vars: this, arguments, window
    ["@variable.builtin.javascript"] = { fg = c.electric_red }, -- Built-in vars: this, arguments, window
    ["@variable.parameter.typescript"] = { fg = c.fg_alt, italic = true }, -- Function parameters: function(param1, param2)
    ["@variable.parameter.javascript"] = { fg = c.fg_alt, italic = true }, -- Function parameters: function(param1, param2)

    -- FUNCTIONS
    ["@function.typescript"] = { fg = c.electric_red, bold = true }, -- Function names: function myFunc(), const myFunc = ()
    ["@function.javascript"] = { fg = c.electric_red, bold = true }, -- Function names: function myFunc(), const myFunc = ()
    ["@function.method.typescript"] = { fg = c.method_orange, bold = true }, -- Object methods: obj.method(), class methods
    ["@function.method.javascript"] = { fg = c.method_orange, bold = true }, -- Object methods: obj.method(), class methods
    ["@function.builtin.typescript"] = { fg = c.cyber_green, bold = true }, -- Built-in functions: console.log, parseInt, Array.map
    ["@function.builtin.javascript"] = { fg = c.cyber_green, bold = true }, -- Built-in functions: console.log, parseInt, Array.map

    -- CONSTANTS AND PROPERTIES
    ["@constant.typescript"] = { fg = c.constant_orange }, -- Constants: const MY_CONSTANT, enum values
    ["@constant.javascript"] = { fg = c.constant_orange }, -- Constants: const MY_CONSTANT
    ["@property.typescript"] = { fg = c.property_cyan }, -- Object properties: obj.property, destructured props
    ["@property.javascript"] = { fg = c.property_cyan }, -- Object properties: obj.property, destructured props

    -- STRINGS AND LITERALS
    ["@string.typescript"] = { fg = c.string_green }, -- String literals: "hello", 'world'
    ["@string.javascript"] = { fg = c.string_green }, -- String literals: "hello", 'world'
    ["@string.template.typescript"] = { fg = c.string_green }, -- Template literals: `hello ${name}`
    ["@string.template.javascript"] = { fg = c.string_green }, -- Template literals: `hello ${name}`

    -- NUMBERS
    ["@number.typescript"] = { fg = c.number_cyan }, -- Number literals: 42, 3.14, 0xFF
    ["@number.javascript"] = { fg = c.number_cyan }, -- Number literals: 42, 3.14, 0xFF

    -- OPERATORS
    ["@operator.typescript"] = { fg = c.deep_blue }, -- Operators: +, -, *, /, =, ==, ===, !, &&, ||
    ["@operator.javascript"] = { fg = c.deep_blue }, -- Operators: +, -, *, /, =, ==, ===, !, &&, ||

    -- PUNCTUATION
    ["@punctuation.bracket.typescript"] = { fg = c.fg_alt }, -- Brackets: [], {}, ()
    ["@punctuation.bracket.javascript"] = { fg = c.fg_alt }, -- Brackets: [], {}, ()
    ["@punctuation.delimiter.typescript"] = { fg = c.fg_alt }, -- Delimiters: ,, ;, .
    ["@punctuation.delimiter.javascript"] = { fg = c.fg_alt }, -- Delimiters: ,, ;, .

    -- SPECIAL CONSTRUCTS
    ["@constructor.typescript"] = { fg = c.type_magenta, bold = true }, -- Constructor functions: new MyClass()
    ["@constructor.javascript"] = { fg = c.type_magenta, bold = true }, -- Constructor functions: new MyClass()
    ["@namespace.typescript"] = { fg = c.viper_white, bold = true }, -- Namespaces: namespace MyNamespace

    -- IMPORT/EXPORT
    ["@keyword.import.typescript"] = { fg = c.viper_white, bold = true }, -- import keyword
    ["@keyword.import.javascript"] = { fg = c.viper_white, bold = true }, -- import keyword
    ["@keyword.export.typescript"] = { fg = c.viper_white, bold = true }, -- export keyword
    ["@keyword.export.javascript"] = { fg = c.viper_white, bold = true }, -- export keyword

    -- COMMENTS
    ["@comment.typescript"] = { fg = c.light_gray, italic = true }, -- Regular comments: // comment, /* comment */
    ["@comment.javascript"] = { fg = c.light_gray, italic = true }, -- Regular comments: // comment, /* comment */
    ["@comment.documentation.typescript"] = { fg = c.cyber_green, italic = true }, -- JSDoc comments: /** @param */
    ["@comment.documentation.javascript"] = { fg = c.cyber_green, italic = true }, -- JSDoc comments: /** @param */
  }

  -- React/JSX specific highlights
  local react_highlights = {
    -- JSX COMPONENT TAGS: <Suspense>, <MyComponent>, <React.Fragment>
    ["@tag.tsx"] = { fg = c.electric_red, bold = true }, -- Component tags in JSX
    ["@tag.jsx"] = { fg = c.electric_red, bold = true }, -- Component tags in JSX

    -- HTML TAGS IN JSX: <div>, <span>, <p>, <button>, etc.
    ["@tag.builtin.tsx"] = { fg = c.html_tag_blue, bold = true }, -- Built-in HTML tags
    ["@tag.builtin.jsx"] = { fg = c.html_tag_blue, bold = true }, -- Built-in HTML tags

    -- JSX TAG DELIMITERS: <, >, </, />
    ["@tag.delimiter.tsx"] = { fg = c.electric_red }, -- Opening/closing brackets for components
    ["@tag.delimiter.jsx"] = { fg = c.electric_red }, -- Opening/closing brackets for components

    -- JSX ATTRIBUTE NAMES: fallback, className, onClick, style, etc. (COMPREHENSIVE MAPPING)
    ["@tag.attribute.tsx"] = { fg = c.viper_white }, -- Attribute names like "fallback" in <Suspense fallback={...}>
    ["@tag.attribute.jsx"] = { fg = c.viper_white }, -- Attribute names like "className" in <div className="...">
    ["@attribute.tsx"] = { fg = c.viper_white }, -- Alternative attribute token
    ["@attribute.jsx"] = { fg = c.viper_white }, -- Alternative attribute token
    ["@property.tsx"] = { fg = c.viper_white }, -- Sometimes attributes are parsed as properties
    ["@property.jsx"] = { fg = c.viper_white }, -- Sometimes attributes are parsed as properties
    ["@field.tsx"] = { fg = c.viper_white }, -- JSX attributes might be parsed as fields
    ["@field.jsx"] = { fg = c.jsx_attr_green }, -- JSX attributes might be parsed as fields
    ["@variable.member.tsx"] = { fg = c.jsx_attr_green }, -- Member access in JSX attributes
    ["@variable.member.jsx"] = { fg = c.jsx_attr_green }, -- Member access in JSX attributes

    -- COMPONENT NAMES (when used as constructors)
    ["@constructor.tsx"] = { fg = c.electric_red, bold = true }, -- Component constructors
    ["@constructor.jsx"] = { fg = c.electric_red, bold = true }, -- Component constructors

    -- REACT HOOKS: useState, useEffect, useCallback, etc.
    ["@function.builtin.tsx"] = { fg = c.cyber_green, bold = true }, -- React hooks
    ["@function.builtin.jsx"] = { fg = c.cyber_green, bold = true }, -- React hooks

    -- COMPONENT PROPS: props passed to components
    ["@variable.parameter.tsx"] = { fg = c.jsx_prop_purple, italic = true }, -- Component props
    ["@variable.parameter.jsx"] = { fg = c.jsx_prop_purple, italic = true }, -- Component props

    -- JSX EXPRESSION BRACES: { and } in JSX expressions
    ["@punctuation.special.tsx"] = { fg = c.warning_orange }, -- Curly braces in JSX: {expression}
    ["@punctuation.special.jsx"] = { fg = c.warning_orange }, -- Curly braces in JSX: {expression}
  }

  -- Vue specific highlights
  local vue_highlights = {
    -- VUE TEMPLATE TAGS: <template>, <div>, <span> in Vue templates
    ["@tag.vue"] = { fg = c.html_tag_blue, bold = true }, -- Vue template tags
    ["@tag.builtin.vue"] = { fg = c.html_tag_blue, bold = true }, -- Built-in HTML tags in Vue
    ["@tag.delimiter.vue"] = { fg = c.html_tag_blue }, -- Tag delimiters in Vue

    -- VUE DIRECTIVES AND ATTRIBUTES: v-if, v-for, :class, @click, etc.
    ["@tag.attribute.vue"] = { fg = c.jsx_attr_green }, -- Vue directives and attributes
    ["@keyword.directive.vue"] = { fg = c.cyber_green, bold = true }, -- Vue directive keywords

    -- VUE SCRIPT SECTION
    ["@keyword.vue"] = { fg = c.keyword_blue, bold = true }, -- Keywords in Vue script
    ["@function.vue"] = { fg = c.function_yellow, bold = true }, -- Functions in Vue script

    -- VUE TEMPLATE EXPRESSIONS: {{ expression }}
    ["@punctuation.special.vue"] = { fg = c.warning_orange }, -- Vue template expression delimiters
  }

  -- Apply all highlights (order matters - React highlights should override general TS/JS)
  for group, opts in pairs(ts_highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  for group, opts in pairs(react_highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- High-priority JSX attribute overrides (applied last to ensure they take precedence)
  local jsx_attribute_overrides = {
    ["@tag.attribute"] = { fg = c.jsx_attr_green }, -- Universal JSX attribute token
    ["@attribute"] = { fg = c.jsx_attr_green }, -- Universal attribute token
    ["htmlArg"] = { fg = c.jsx_attr_green }, -- Legacy HTML argument highlighting
    ["jsxAttrib"] = { fg = c.jsx_attr_green }, -- JSX-specific attribute highlighting
  }

  for group, opts in pairs(jsx_attribute_overrides) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  for group, opts in pairs(vue_highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Additional TreeSitter highlights for better syntax support
  local additional_highlights = {
    -- OBJECT FIELDS AND PROPERTIES: obj.field, class.property
    ["@field"] = { fg = c.property_cyan }, -- Object fields in definitions
    ["@property"] = { fg = c.property_cyan }, -- Object properties in access

    -- METHODS: obj.method(), class.method()
    ["@method"] = { fg = c.method_orange, bold = true }, -- Method definitions
    ["@method.call"] = { fg = c.method_orange, bold = true }, -- Method calls

    -- DECORATORS: @Component, @Injectable (Angular/TypeScript)
    ["@symbol"] = { fg = c.viper_white, bold = true }, -- Symbol literals
    ["@decorator"] = { fg = c.viper_white, bold = true }, -- Decorator syntax

    -- TEMPLATE LITERALS AND INTERPOLATION
    ["@string.escape"] = { fg = c.electric_red }, -- Escape sequences in strings: \n, \t, \"
    ["@embedded"] = { fg = c.fg }, -- Embedded code in templates

    -- ERROR HANDLING: try, catch, finally, throw
    ["@exception"] = { fg = c.danger_red, bold = true }, -- Exception objects
    ["@keyword.exception"] = { fg = c.danger_red, bold = true }, -- Exception keywords

    -- ASYNC/AWAIT: async function, await promise
    ["@keyword.coroutine"] = { fg = c.viper_white, bold = true }, -- async/await keywords

    -- MODULE SYSTEM: import, export, from, require
    ["@include"] = { fg = c.viper_white, bold = true }, -- Include/import statements
    ["@namespace"] = { fg = c.viper_white, bold = true }, -- Namespace declarations
  }

  for group, opts in pairs(additional_highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- HTML specific highlights
  local html_highlights = {
    -- HTML TAGS: <div>, <span>, <p>, <button>, <input>, etc.
    ["@tag.html"] = { fg = c.html_tag_blue, bold = true }, -- HTML tag names
    ["@tag.builtin.html"] = { fg = c.html_tag_blue, bold = true }, -- Built-in HTML tags
    ["@tag.delimiter.html"] = { fg = c.html_tag_blue }, -- HTML tag delimiters: <, >, </, />

    -- HTML ATTRIBUTES: class, id, style, onclick, etc.
    ["@tag.attribute.html"] = { fg = c.jsx_attr_green }, -- HTML attribute names
    ["@string.html"] = { fg = c.string_green }, -- HTML attribute values: class="my-class"

    -- XML/HTML similar patterns
    ["@tag.xml"] = { fg = c.html_tag_blue, bold = true }, -- XML tag names
    ["@tag.delimiter.xml"] = { fg = c.html_tag_blue }, -- XML tag delimiters
    ["@tag.attribute.xml"] = { fg = c.jsx_attr_green }, -- XML attribute names
  }

  for group, opts in pairs(html_highlights) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
