# 🚀 TzzJokerzzT's NeoVim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-blue.svg)](https://lazyvim.org)
[![Linux](https://img.shields.io/badge/Linux-Optimized-yellow.svg?logo=linux)](https://github.com/TzzJokerzzT/neovim-config)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

> ✨ Una configuración moderna de NeoVim optimizada para desarrollo full-stack con integración AI avanzada

## 📋 Tabla de Contenidos

- [🎯 Características Principales](#-características-principales)
- [📦 Instalación](#-instalación)
- [🔧 Plugins y Herramientas](#-plugins-y-herramientas)
- [⌨️ Atajos de Teclado](#️-atajos-de-teclado)
- [🍅 Sistema Pomodoro](#-sistema-pomodoro)
- [🤖 Configuración AI](#-configuración-ai)
- [🎨 Personalización](#-personalización)
- [📊 Monitoreo y Productividad](#-monitoreo-y-productividad)
- [🚀 Comenzar](#-comenzar)

## 🎯 Características Principales

### 🌟 Destacados
- **🎨 Tema Essex (Doki Theme)** - Inspirado en anime con soporte completo
- **🤖 Integración AI Múltiple** - Copilot, CodeCompanion, Avante, Claude
- **🍅 Pomodoro Timer Integrado** - Sistema completo de productividad con Lualine
- **⚡ 50+ Plugins Optimizados** - Carga lazy inteligente, inicio < 50ms
- **📊 WakaTime Integrado** - Seguimiento de tiempo en la barra de estado
- **🔍 Búsqueda Avanzada** - FZF, Telescope, Grug Far para máxima eficiencia
- **🎯 Herramientas de Productividad** - Harpoon, Oil, Neo-tree, ToggleTerm

### 💻 Desarrollo
- **LSP Completo** - Soporte para TypeScript, JavaScript, Angular, Astro, JSON, Markdown
- **Formateo Automático** - Prettier integrado con Conform
- **Linting Inteligente** - ESLint y nvim-lint
- **Git Integrado** - Fugitive, Gitsigns, Lazygit
- **Terminal Integrado** - ToggleTerm con configuración personalizada

## 📦 Instalación

### 📋 Prerequisitos

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y \
  neovim git curl nodejs npm python3-pip \
  ripgrep fd-find build-essential

# Arch Linux
sudo pacman -S neovim git curl nodejs npm python-pip ripgrep fd

# Instalar fuente Nerd Font (recomendado)
# Descargar desde: https://nerdfonts.com
```

### 🚀 Instalación Rápida

```bash
# 1. Respaldar configuración existente
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# 2. Clonar esta configuración
git clone https://github.com/TzzJokerzzT/neovim-config ~/.config/nvim
cd ~/.config/nvim

# 3. Iniciar NeoVim (los plugins se instalan automáticamente)
nvim
```

### 🔧 Configuración Post-Instalación

```bash
# Configurar Copilot (opcional pero recomendado)
# En NeoVim ejecutar: :Copilot setup

# Configurar WakaTime (opcional)
# 1. Instalar CLI: https://github.com/wakatime/wakatime-cli
# 2. En NeoVim ejecutar: :WakaTimeApiKey tu-api-key
```

## 🔧 Plugins y Herramientas

### 🎨 UI y Temas
| Plugin | Descripción | Estado |
|--------|-------------|--------|
| **[Doki Theme](https://github.com/doki-theme/doki-theme-vim)** | Tema Essex inspirado en anime (por defecto) | ✅ Activo |
| **[Tokyo Night](https://github.com/folke/tokyonight.nvim)** | Tema oscuro popular | ✅ Disponible |
| **[Catppuccin](https://github.com/catppuccin/nvim)** | Tema pastel | ✅ Disponible |
| **[Lualine](https://github.com/nvim-lualine/lualine.nvim)** | Barra de estado con Pomodoro y WakaTime | ✅ Personalizada |
| **[Bufferline](https://github.com/akinsho/bufferline.nvim)** | Pestañas de buffer elegantes | ⚠️ Deshabilitado |
| **[Noice](https://github.com/folke/noice.nvim)** | UI mejorada para mensajes | ✅ Activo |

### 🤖 AI y Completado
| Plugin | Descripción | Configuración |
|--------|-------------|---------------|
| **[GitHub Copilot](https://github.com/zbirenbaum/copilot.lua)** | Asistente AI de GitHub | `<Tab>` para aceptar |
| **[CopilotChat](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** | Chat con Copilot | `<leader>cc` |
| **[CodeCompanion](https://github.com/olimorris/codecompanion.nvim)** | Multi-modelo (GPT-4, Gemini) | `<leader>ac` |
| **[Blink.cmp](https://github.com/saghen/blink.cmp)** | Motor de completado ultra-rápido | Automático |

### 📁 Gestión de Archivos
| Plugin | Descripción | Atajo |
|--------|-------------|-------|
| **[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)** | Explorador de archivos moderno | `<leader>e` |
| **[Oil](https://github.com/stevearc/oil.nvim)** | Editar directorios como buffers | `<leader>o` |
| **[FZF-Lua](https://github.com/ibhagwan/fzf-lua)** | Buscador difuso | `<leader>ff` |
| **[Harpoon 2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)** | Navegación rápida de archivos | `<leader>h` |

### 🍅 Sistema de Productividad
| Herramienta | Descripción | Comandos |
|-------------|-------------|----------|
| **Pomodoro Timer** | Sistema completo trabajo→standby→descanso | `<leader>ps`, `:PomodoroStart` |
| **WakaTime** | Seguimiento de tiempo de codificación | Automático en Lualine |
| **ToggleTerm** | Terminal integrado flotante | `<C-\>` |
| **Which-key** | Ayuda de atajos de teclado | Automático |

### 🔧 Desarrollo
| Plugin | Descripción | Lenguajes |
|--------|-------------|-----------|
| **[Mason](https://github.com/williamboman/mason.nvim)** | Gestor LSP/DAP/Linter | Todos |
| **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** | Resaltado de sintaxis | 40+ lenguajes |
| **[LSP Config](https://github.com/neovim/nvim-lspconfig)** | Configuración de servidores de lenguaje | TS, JS, Angular, etc. |
| **[Conform](https://github.com/stevearc/conform.nvim)** | Formateador de código | Prettier, etc. |

## ⌨️ Atajos de Teclado

### 🤖 Integración AI
```
<leader>ac    - Abrir CodeCompanion chat
<leader>aa    - Menú de acciones AI  
<leader>cc    - Copilot Chat
<Tab>         - Aceptar sugerencia AI
<leader>co    - Copilot panel
```

### 🍅 Sistema Pomodoro
```
<leader>ps    - Iniciar sesión interactiva (trabajo → descanso → standby)
<leader>pS    - Detener sesión actual
<leader>pi    - Mostrar información/estado
<leader>pw    - Configurar tiempo de trabajo (interactivo)
<leader>pb    - Configurar tiempo de descanso (interactivo)  
<leader>pc    - Configurar tiempos por defecto
<leader>p1    - Inicio rápido: 25min trabajo, 5min descanso
<leader>p2    - Inicio rápido: 45min trabajo, 10min descanso
<leader>p3    - Inicio rápido: 90min trabajo, 20min descanso
```

### 📁 Navegación de Archivos
```
<leader>e     - Alternar Neo-tree
<leader>o     - Abrir Oil (editar directorio)
<leader>ff    - Buscar archivos (FZF)
<leader>fg    - Búsqueda en vivo (grep)
<leader>fr    - Archivos recientes
<leader>h     - Marcar archivo con Harpoon
<C-e>         - Menú Harpoon
```

### 💻 Desarrollo
```
gd            - Ir a definición
gr            - Ir a referencias  
K             - Mostrar información hover
<leader>ca    - Acciones de código
<leader>cr    - Renombrar símbolo
<leader>xx    - Alternar diagnósticos Trouble
<leader>xw    - Workspace diagnostics
```

### 🔧 Utilidades
```
<C-\>         - Alternar terminal
<leader>sr    - Buscar y reemplazar (Grug Far)
<leader>gg    - Lazygit
<leader>cp    - Selector de colores (Minty)
<leader>uc    - Alternar colorscheme
```

## 🍅 Sistema Pomodoro

### 🎯 Características
- **Timer Visual**: Integrado en Lualine con iconos y progreso
- **Flujo Completo**: Trabajo → Standby → Descanso → Idle
- **Configuración Flexible**: Tiempos personalizables con formato inteligente
- **Notificaciones**: Alertas amigables para cada transición
- **Comandos Interactivos**: Ventanas flotantes para configuración

### 📊 Estados del Timer
| Estado | Icono | Descripción |
|--------|-------|-------------|
| **Trabajo** | ⏰ | Sesión de trabajo activa |
| **Standby** | ⏸️ | Transición breve antes del descanso | 
| **Descanso** | ☕ | Tiempo de descanso merecido |
| **Idle** | 🍅 | Timer inactivo, listo para nueva sesión |

### 🕐 Formatos de Tiempo Soportados
```
25           - 25 minutos
25min        - 25 minutos  
1h           - 1 hora
1h30m        - 1 hora 30 minutos
90s          - 90 segundos
30           - 30 minutos
```

### 📝 Comandos Disponibles
```vim
:PomodoroStart [trabajo] [descanso] [standby]  " Iniciar con tiempos opcionales
:PomodoroInteractive                           " Modo interactivo completo
:PomodoroWork [tiempo]                         " Configurar trabajo (interactivo)
:PomodoroBreak [tiempo]                        " Configurar descanso (interactivo)
:PomodoroStop                                  " Detener sesión
:PomodoroStatus                               " Mostrar estado actual
:PomodoroConfig [trabajo] [descanso] [standby] " Configurar por defecto
```

## 🤖 Configuración AI

### 🔧 GitHub Copilot
```vim
" Primera configuración
:Copilot setup

" Comandos útiles
:Copilot status    " Ver estado
:Copilot enable    " Habilitar
:Copilot disable   " Deshabilitar
```

### 💬 CodeCompanion
- **Modelos disponibles**: GPT-4, Gemini 2.5 Pro, Claude
- **Chat interactivo**: `<leader>ac`
- **Acciones contextuales**: `<leader>aa`
- **Configuración**: Auto-detecta API keys en variables de entorno

### ⚙️ Configuración Avanzada
```lua
-- Personalizar en lua/plugins/codecompanion.lua
{
  models = {
    ["gpt-4o"] = { name = "GPT-4O", enabled = true },
    ["gemini-2.0-flash-exp"] = { name = "Gemini 2.5 Pro", enabled = true }
  }
}
```

## 🎨 Personalización

### 🌈 Cambiar Tema
```vim
:colorscheme tokyonight    " Tokyo Night
:colorscheme catppuccin    " Catppuccin  
:colorscheme doki-theme    " Essex (por defecto)
```

### 🔧 Habilitar Bufferline
```lua
-- En lua/plugins/ui.lua, cambiar enabled = false a enabled = true
{
  "akinsho/bufferline.nvim",
  enabled = true,  -- Cambiar aquí
}
```

### 📊 Personalizar Lualine
La configuración incluye:
- **Sección A**: Modo vim
- **Sección B**: Branch git + diff
- **Sección C**: Filename + diagnostics  
- **Sección X**: Filetype + encoding
- **Sección Y**: Pomodoro timer + WakaTime
- **Sección Z**: Location + progress

### 🔔 Configurar Notificaciones
```lua
-- En lua/plugins/ui.lua personalizar Noice
{
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
    hover = { enabled = false },
    signature = { enabled = false },
  },
}
```

## 📊 Monitoreo y Productividad

### ⏱️ WakaTime Integration
1. **Instalar CLI**: 
   ```bash
   curl -fsSL https://raw.githubusercontent.com/wakatime/vim-wakatime/master/scripts/install_cli.py | python
   ```

2. **Configurar API Key**:
   ```vim
   :WakaTimeApiKey tu-api-key-aqui
   ```

3. **Visualización**: Tiempo aparece automáticamente en Lualine

### 📈 Métricas Disponibles
- **Tiempo de codificación** en tiempo real
- **Progreso del Pomodoro** visual
- **Sessiones completadas** por día
- **Archivos y proyectos** más trabajados

### 🎯 Dashboard Personalizado
Usando Snacks.nvim dashboard con:
- **Archivos recientes**
- **Estadísticas de WakaTime**  
- **Accesos rápidos** a proyectos
- **Información del sistema**

## 🚀 Comenzar

### 📚 Primeros Pasos
1. **Instalar configuración** siguiendo las instrucciones
2. **Configurar AI tools** (Copilot, WakaTime)
3. **Probar Pomodoro**: `<leader>ps` para sesión interactiva
4. **Explorar plugins**: `<leader>ff` para buscar archivos
5. **Personalizar tema**: `:colorscheme` + `<Tab>` para opciones

### 💡 Tips de Productividad
- **Usar Harpoon**: Marca archivos frecuentes con `<leader>h`
- **Aprovechar AI**: `<leader>ac` para chat, `<Tab>` para sugerencias
- **Configurar Pomodoro**: Empieza con `<leader>p1` (sesión de 25min)
- **Terminal integrado**: `<C-\>` para acceso rápido
- **Búsqueda potente**: `<leader>fg` para buscar en todo el proyecto

### 🔍 Comandos Útiles
```vim
:checkhealth          " Verificar configuración
:Lazy                 " Gestor de plugins
:Mason                " Instalar LSPs/formatters
:Telescope            " Explorar todas las opciones
:WhichKey             " Ver todos los atajos disponibles
```

## 🤝 Contribuir

### 🐛 Reportar Issues
- Usa el [issue tracker](https://github.com/TzzJokerzzT/neovim-config/issues)
- Incluye información del sistema (`nvim --version`)
- Adjunta `:checkhealth` si es problema de configuración

### 💡 Sugerir Mejoras
- **Fork** el repositorio
- **Crea** una branch: `feature/nueva-funcionalidad`
- **Commit** tus cambios
- **Push** y crea un **Pull Request**

### ⭐ Mostrar Apoyo
- **Star** el repositorio si te gusta
- **Fork** para tus propias modificaciones
- **Share** con otros desarrolladores

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver [LICENSE](LICENSE) para más detalles.

---

<div align="center">

**🚀 Hecho con 💜 por [TzzJokerzzT](https://github.com/TzzJokerzzT)**

*Una configuración moderna de NeoVim para desarrolladores que buscan productividad y elegancia*

[![GitHub](https://img.shields.io/badge/GitHub-TzzJokerzzT-181717?logo=github)](https://github.com/TzzJokerzzT)
[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-6366f1)](https://lazyvim.org)

</div>