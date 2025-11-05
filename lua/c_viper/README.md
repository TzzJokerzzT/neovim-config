# C. Viper Colorscheme

A custom Neovim colorscheme inspired by C. Viper from Street Fighter, designed specifically for modern web development with TypeScript, React, Vue, Angular, and Node.js.

## Features

- **C. Viper inspired colors**: Electric blues, purples, cyber greens, and mechanical grays
- **Optimized for web development**: Special highlight groups for TypeScript, React, Vue, Angular
- **Italic comments**: All comments are styled with italic fonts for better readability
- **TreeSitter support**: Advanced syntax highlighting with TreeSitter integration
- **Plugin integration**: Pre-configured highlights for popular plugins like Telescope, LSP, Git signs, etc.

## Color Palette

- **Electric Blue** (`#00d4ff`): Primary accent, cursors, search highlights
- **Viper Purple** (`#8A2BE2`): Keywords, imports, visual selection
- **Cyber Green** (`#00ff88`): Strings, success states, additions
- **Deep Blue** (`#0099cc`): Secondary accents, built-in functions
- **Warning Orange** (`#ff8800`): Numbers, constants, warnings
- **Danger Red** (`#ff4444`): Errors, exceptions, deletions

## Language Support

### TypeScript/JavaScript
- Proper type highlighting with distinct colors for built-in vs custom types
- Function and method highlighting with bold styling
- Variable parameter styling with italics
- Import/export statement highlighting

### React/JSX
- JSX tag highlighting with electric blue
- Component name highlighting (PascalCase detection)
- React hooks highlighting
- Props and attributes with distinct colors

### Vue
- Template directive highlighting
- Vue-specific syntax support
- Script and template section differentiation

### Angular
- Decorator highlighting for Angular decorators
- TypeScript integration for Angular services and components

## Plugin Integration

The colorscheme includes pre-configured highlights for:
- **LSP**: Diagnostic highlighting, references
- **Telescope**: Consistent UI theming
- **Git Signs**: Addition, modification, deletion indicators
- **NvimTree**: File explorer theming
- **Lualine**: Status line integration
- **Which-key**: Command palette theming
- **CMP**: Completion menu styling
- **Notify**: Notification styling

## Installation

The colorscheme is already configured in your Neovim setup. It's located in:
- Main colorscheme: `lua/cviper/init.lua`
- Language support: `lua/cviper/languages.lua`
- Plugin integration: `lua/cviper/plugins.lua`

## Switching Colorschemes

To switch back to other colorschemes, edit `lua/plugins/colorscheme.lua` and uncomment the desired theme while commenting out the C. Viper theme.

## Customization

You can customize the colors by modifying the `M.colors` table in `lua/cviper/init.lua`. The colorscheme will automatically apply your changes on the next restart.

## Screenshot

The colorscheme provides excellent contrast and readability for code, with special attention to:
- Distinguishing between different types of identifiers
- Making comments readable but not distracting with italic styling
- Highlighting important syntax elements like functions, types, and keywords
- Providing clear visual hierarchy in complex code structures