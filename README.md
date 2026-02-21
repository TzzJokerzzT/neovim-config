# TzzJokerzzT's NeoVim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.10+-green.svg?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-blue.svg)](https://lazyvim.org)
[![Linux](https://img.shields.io/badge/Linux-Optimized-yellow.svg?logo=linux)](https://github.com/TzzJokerzzT/neovim-config)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

> Una configuracion moderna de NeoVim optimizada para desarrollo full-stack con integracion AI avanzada

**Idioma**: **Espanol** | [English](README-EN.md)

## Tabla de Contenidos

- [Caracteristicas Principales](#caracteristicas-principales)
- [Instalacion](#instalacion)
- [Plugins y Herramientas](#plugins-y-herramientas)
- [Atajos de Teclado](#atajos-de-teclado)
- [Sistema Pomodoro](#sistema-pomodoro)
- [Configuracion AI](#configuracion-ai)
- [Sistema de Gamificacion (Triforce)](#sistema-de-gamificacion-triforce)
- [Personalizacion](#personalizacion)
- [Monitoreo y Productividad](#monitoreo-y-productividad)
- [Comenzar](#comenzar)

## Caracteristicas Principales

### Destacados

- **C. Viper Custom Theme** - Colorscheme personalizado inspirado en Street Fighter con transparencia
- **Integracion AI** - GitHub Copilot + OpenCode (chat, acciones, operador)
- **Pomodoro Timer Integrado** - Sistema completo de productividad con Lualine
- **Triforce Gamificacion** - Sistema de XP, niveles, logros y rachas de codificacion
- **WakaTime Integrado** - Seguimiento de tiempo en la barra de estado
- **Summon Floating Terminal** - Terminales flotantes para zellij, lazygit, opencode y TODOs
- **Dashboard Zelda** - Dashboard personalizado con arte ASCII tematico

### Desarrollo

- **LSP Completo** - Soporte para TypeScript, JavaScript, Angular, Tailwind, JSON, Markdown (via LazyVim)
- **Formateo Automatico** - Prettier integrado con Conform (via LazyVim)
- **Linting Inteligente** - ESLint y nvim-lint (via LazyVim)
- **Git Integrado** - Neogit, Gitsigns, Lazygit (via Summon)
- **Terminal Flotante** - Summon con zellij, lazygit, opencode

## Instalacion

### Prerequisitos

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install -y \
  neovim git curl nodejs npm python3-pip \
  ripgrep fd-find build-essential zellij

# Arch Linux
sudo pacman -S neovim git curl nodejs npm python-pip ripgrep fd zellij

# Instalar fuente Nerd Font (recomendado)
# Descargar desde: https://nerdfonts.com

# OpenCode para AI (opcional)
# Instalar desde: https://github.com/sst/opencode
npm install -g @sst/opencode
```

### Instalacion Rapida

```bash
# 1. Respaldar configuracion existente
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true

# 2. Clonar esta configuracion
git clone https://github.com/TzzJokerzzT/neovim-config ~/.config/nvim
cd ~/.config/nvim

# 3. Iniciar NeoVim (los plugins se instalan automaticamente)
nvim
```

### Configuracion Post-Instalacion

```bash
# Configurar Copilot (opcional pero recomendado)
# En NeoVim ejecutar: :Copilot setup

# Configurar WakaTime (opcional)
# 1. Instalar CLI: https://github.com/wakatime/wakatime-cli
# 2. En NeoVim ejecutar: :WakaTimeApiKey tu-api-key
```

## Plugins y Herramientas

### UI y Temas

| Plugin | Descripcion | Estado |
| --- | --- | --- |
| **[C. Viper](lua/c_viper/)** | Tema personalizado Street Fighter con transparencia (por defecto) | Activo |
| **[Lualine](https://github.com/nvim-lualine/lualine.nvim)** | Barra de estado con Pomodoro, WakaTime y Triforce | Personalizada |
| **[Noice](https://github.com/folke/noice.nvim)** | UI mejorada para mensajes y cmdline | Activo |
| **[Incline](https://github.com/b0o/incline.nvim)** | Titulos de ventana flotantes y sin fondo | Activo |
| **[Smear Cursor](https://github.com/sphamba/smear-cursor.nvim)** | Animacion de cursor fluida con particulas | Activo |
| **[Snacks.nvim](https://github.com/folke/snacks.nvim)** | Dashboard personalizado con arte ASCII Zelda | Activo |

### AI y Completado

| Plugin | Descripcion | Configuracion |
| --- | --- | --- |
| **[GitHub Copilot](https://github.com/github/copilot.vim)** | Asistente AI de GitHub (completado inline) | `<Tab>` para aceptar |
| **[OpenCode](https://github.com/NickvanDyke/opencode.nvim)** | Chat AI, acciones, operador y terminal | `<leader>ak`, `<C-;>` |
| **[Blink.cmp](https://github.com/saghen/blink.cmp)** | Motor de completado ultra-rapido (via LazyVim) | Automatico |

### Gestion de Archivos

| Plugin | Descripcion | Atajo |
| --- | --- | --- |
| **[Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)** | Explorador de archivos moderno (via LazyVim) | `<leader>e` |
| **[Oil](https://github.com/stevearc/oil.nvim)** | Editar directorios como buffers | `-`, `<leader>-` |
| **[Goto Preview](https://github.com/rmagatti/goto-preview)** | Previsualizacion LSP en ventanas flotantes | `gzd`, `gpr`, etc. |
| **[Rip Substitute](https://github.com/chrisgrieser/nvim-rip-substitute)** | Busqueda y reemplazo con regex avanzado | `<leader>fs` |

### Productividad

| Herramienta | Descripcion | Comandos |
| --- | --- | --- |
| **Pomodoro Timer** | Sistema completo trabajo -> standby -> descanso | `<leader>ps`, `:PomodoroStart` |
| **WakaTime** | Seguimiento de tiempo de codificacion | Automatico en Lualine |
| **Triforce** | Sistema de gamificacion con XP, niveles y logros | `<leader>tp` |
| **Summon** | Terminales flotantes (zellij, lazygit, opencode, TODOs) | `<C-e>`, `<leader>ge`, `<leader>o` |
| **Which-key** | Ayuda de atajos de teclado (via LazyVim) | Automatico |

### Desarrollo (via LazyVim + Extras)

| Plugin | Descripcion | Lenguajes |
| --- | --- | --- |
| **[Mason](https://github.com/williamboman/mason.nvim)** | Gestor LSP/DAP/Linter | Todos |
| **[Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** | Resaltado de sintaxis | 40+ lenguajes |
| **[LSP Config](https://github.com/neovim/nvim-lspconfig)** | Configuracion de servidores de lenguaje | TS, JS, Angular, etc. |
| **[Conform](https://github.com/stevearc/conform.nvim)** | Formateador de codigo | Prettier, etc. |
| **[Mini Surround](https://github.com/echasnovski/mini.surround)** | Agregar/cambiar/eliminar caracteres envolventes | `gsa`, `gsd`, `gsr` |
| **[Colorizer](https://github.com/catgoose/nvim-colorizer.lua)** | Resaltado inline de colores (hex, RGB, Tailwind) | Automatico |

### Git

| Plugin | Descripcion | Atajo |
| --- | --- | --- |
| **[Neogit](https://github.com/NeogitOrg/neogit)** | Cliente Git completo | `<leader>gn` |
| **[Gitsigns](https://github.com/lewis6991/gitsigns.nvim)** | Senales Git en el gutter (via LazyVim) | Automatico |
| **Lazygit (via Summon)** | Terminal lazygit flotante | `<leader>ge` |

### LazyVim Extras Habilitados

| Extra | Descripcion |
| --- | --- |
| `lang.typescript` | Soporte completo para TypeScript |
| `lang.tailwind` | Soporte para Tailwind CSS |
| `coding.mini-surround` | Operaciones de envolvimiento de texto |
| `util.mini-hipatterns` | Resaltado de patrones en texto |

### Plugins Deshabilitados

| Plugin | Razon |
| --- | --- |
| `akinsho/bufferline.nvim` | Deshabilitado intencionalmente |
| `akinsho/toggleterm.nvim` | Reemplazado por Summon |

## Atajos de Teclado

### AI / OpenCode

```
<leader>ak    - Preguntar a OpenCode con contexto "@this:"
<C-x>         - Seleccionar/ejecutar accion de OpenCode
<C-;>         - Alternar terminal OpenCode
go            - Agregar rango a OpenCode (modo operador)
goo           - Agregar linea actual a OpenCode
<S-C-u>       - Scroll up en OpenCode
<S-C-d>       - Scroll down en OpenCode
<Tab>         - Aceptar sugerencia de Copilot
```

### Pomodoro

```
<leader>ps    - Iniciar sesion interactiva (trabajo -> descanso -> standby)
<leader>pS    - Detener sesion actual
<leader>pi    - Mostrar informacion/estado
<leader>pw    - Configurar tiempo de trabajo (interactivo)
<leader>pb    - Configurar tiempo de descanso (interactivo)
<leader>pc    - Configurar tiempos por defecto
<leader>p1    - Inicio rapido: 25min trabajo, 5min descanso
<leader>p2    - Inicio rapido: 45min trabajo, 10min descanso
<leader>p3    - Inicio rapido: 90min trabajo, 20min descanso
```

### Navegacion de Archivos

```
<leader>e     - Alternar Neo-tree (LazyVim)
-             - Abrir Oil flotante
<leader>-     - Abrir Oil en directorio del archivo actual
<leader>ff    - Buscar archivos (LazyVim)
<leader>fg    - Busqueda en vivo (grep, LazyVim)
<leader>fr    - Archivos recientes (LazyVim)
<leader>fs    - Buscar y reemplazar (Rip Substitute)
```

### Previsualizacion LSP (goto-preview)

```
gzd           - Preview definicion
gpD           - Preview declaracion
gpi           - Preview implementacion
gpy           - Preview tipo
gpr           - Preview referencias
gP            - Cerrar todas las ventanas de preview
```

### Desarrollo (LSP via LazyVim)

```
gd            - Ir a definicion
gr            - Ir a referencias
K             - Mostrar informacion hover
<leader>ca    - Acciones de codigo
<leader>cr    - Renombrar simbolo
<leader>xx    - Alternar diagnosticos Trouble
<leader>xw    - Workspace diagnostics
```

### Terminales y Herramientas (Summon)

```
<C-e>         - Terminal flotante (zellij)
<leader>o     - Abrir OpenCode CLI
<leader>ge    - Abrir Lazygit
<leader>t     - Abrir archivo de TODOs
```

### Git

```
<leader>gn    - Abrir Neogit
<leader>ge    - Lazygit (via Summon)
```

### Utilidades

```
<C-s>         - Guardar archivo con notificacion personalizada
<leader>ms    - Selector de colores (Minty Shades)
<leader>mh    - Selector de colores (Minty Huefy)
<leader>bq    - Cerrar todos los buffers excepto el actual
<leader>mp    - Vista previa de Markdown
<leader>ds    - Eliminar envolvente (surround)
<leader>cs    - Cambiar envolvente (surround)
+             - Incrementar numero bajo cursor
-             - Decrementar numero bajo cursor (fuera de Oil)
```

### Envoltura rapida (modo visual)

```
<leader>'     - Envolver con comillas simples
<leader>"     - Envolver con comillas dobles
<leader>(     - Envolver con parentesis
<leader>{     - Envolver con llaves
<leader>[     - Envolver con corchetes
<leader><     - Envolver con angulares
```

### Atajos en modo insertar

```
<C-b>         - Eliminar hasta fin de palabra
<C-d>         - Eliminar linea completa
<C-v>         - Pegar desde portapapeles del sistema
<A-j>         - Mover linea hacia abajo
<A-k>         - Mover linea hacia arriba
```

### Gamificacion (Triforce)

```
<leader>tp    - Ver perfil de gamificacion (nivel, XP, logros)
```

## Sistema Pomodoro

### Caracteristicas

- **Timer Visual**: Integrado en Lualine con iconos y colores dinamicos
- **Flujo Completo**: Trabajo -> Standby -> Descanso -> Idle
- **Configuracion Flexible**: Tiempos personalizables con formato inteligente
- **Notificaciones**: Alertas amigables para cada transicion
- **Comandos Interactivos**: Ventanas flotantes para configuracion

### Estados del Timer

| Estado | Icono | Color en Lualine | Descripcion |
| --- | --- | --- | --- |
| **Trabajo** | reloj | Rojo | Sesion de trabajo activa |
| **Standby** | pausa | Amarillo | Transicion breve antes del descanso |
| **Descanso** | cafe | Verde | Tiempo de descanso merecido |
| **Idle** | tomate | Azul | Timer inactivo, listo para nueva sesion |

### Formatos de Tiempo Soportados

```
25           - 25 minutos
25min        - 25 minutos
1h           - 1 hora
1h30m        - 1 hora 30 minutos
90s          - 90 segundos
```

### Comandos Disponibles

```vim
:PomodoroStart [trabajo] [descanso] [standby]  " Iniciar con tiempos opcionales
:PomodoroInteractive                           " Modo interactivo completo
:PomodoroWork [tiempo]                         " Configurar trabajo (interactivo)
:PomodoroBreak [tiempo]                        " Configurar descanso (interactivo)
:PomodoroStop                                  " Detener sesion
:PomodoroStatus                                " Mostrar estado actual
:PomodoroConfig [trabajo] [descanso] [standby] " Configurar por defecto
```

## Configuracion AI

### GitHub Copilot

```vim
" Primera configuracion
:Copilot setup

" Comandos utiles
:Copilot status    " Ver estado
:Copilot enable    " Habilitar
:Copilot disable   " Deshabilitar
```

### OpenCode

Plugin `opencode.nvim` proporciona integracion directa con OpenCode AI:

- **Chat contextual**: `<leader>ak` envia seleccion/buffer con contexto "@this:"
- **Acciones AI**: `<C-x>` para seleccionar y ejecutar acciones
- **Terminal OpenCode**: `<C-;>` para alternar terminal
- **Modo operador**: `go` para agregar rangos, `goo` para linea actual
- **CLI via Summon**: `<leader>o` abre OpenCode en terminal flotante

## Sistema de Gamificacion (Triforce)

### Caracteristicas

- **Sistema de XP y Niveles**: Gana experiencia escribiendo codigo
- **Logros Desbloqueables**: Metas especificas por lenguaje y actividad
- **Racha de Codificacion**: Manten tu consistencia diaria
- **Tiempo de Sesion**: Seguimiento de tiempo activo de codificacion
- **Notificaciones**: Alertas cuando subes de nivel o desbloqueas logros
- **Integracion Lualine**: Estadisticas visibles en la barra de estado (nivel, racha, tiempo, logros)

### Sistema de Recompensas

| Actividad | XP Ganada | Descripcion |
| --- | --- | --- |
| **Caracteres** | 1 XP por caracter | Experiencia al escribir codigo |
| **Lineas Nuevas** | 1 XP por linea | Bonus por crear nuevas lineas |
| **Guardar Archivo** | 50 XP | Recompensa por guardar cambios |

### Progresion de Niveles

- **Tier 1** (Niveles 1-10): 300 XP por nivel
- **Tier 2** (Niveles 11-20): 500 XP por nivel
- **Tier 3** (Niveles 21+): 1000 XP por nivel

### Comandos

```vim
:Triforce profile    " Ver estadisticas completas
:Triforce reset      " Reiniciar progreso
```

## Personalizacion

### Cambiar Tema

El tema activo por defecto es C. Viper con transparencia. Los fallbacks de instalacion son `tokyonight` y `habamax`.

```vim
:colorscheme c_viper       " C. Viper (por defecto)
:colorscheme tokyonight    " Tokyo Night (fallback)
:colorscheme habamax       " Habamax (fallback)
```

### Personalizar Lualine

La configuracion incluye:

- **Seccion A**: Modo vim
- **Seccion X**: Triforce (nivel, racha, tiempo de sesion, logros) + Pomodoro + WakaTime + Filetype
- **Tema**: `iceberg_dark`
- **Separadores**: Flechas solidas y componentes con bordes

### Noice (Cmdline)

```lua
-- cmdline aparece en la parte inferior (no popup)
-- Presets habilitados: bottom_search, command_palette, lsp_doc_border
```

### Colorscheme C. Viper

El tema personalizado incluye:

- **Paleta de 33 colores** inspirados en el personaje C. Viper de Street Fighter
- **Transparencia** habilitada por defecto
- **Highlights para lenguajes**: TypeScript, JavaScript, React/JSX/TSX, Vue, HTML
- **Integracion con 13 plugins**: LSP, Diagnostics, Telescope, GitSigns, NvimTree, Lualine, Which-key, Indent, CMP, Notify, y mas
- **50+ grupos de highlight** del editor base

## Monitoreo y Productividad

### WakaTime

1. **Instalar CLI**: https://github.com/wakatime/wakatime-cli

2. **Configurar API Key**:

   ```vim
   :WakaTimeApiKey tu-api-key-aqui
   ```

3. **Visualizacion**: Tiempo aparece automaticamente en Lualine (se actualiza cada 5 minutos)

### Metricas Disponibles en Lualine

- **Tiempo de codificacion** en tiempo real (WakaTime)
- **Progreso del Pomodoro** con colores dinamicos
- **Nivel y XP** de Triforce
- **Racha de codificacion** diaria
- **Tiempo de sesion** activo
- **Logros desbloqueados**

### Dashboard Personalizado

Usando `Snacks.nvim` con:

- **Header** con arte ASCII tematico de Zelda
- **Acciones rapidas**: Buscar archivo, nuevo archivo, buscar texto, archivos recientes, configuracion, restaurar sesion, extras, lazy, salir
- **Color del header**: `#bbc443` (verde-amarillo)

## Estructura del Proyecto

```
~/.config/nvim/
  init.lua                    # Punto de entrada
  lazyvim.json                # Extras de LazyVim habilitados
  stylua.toml                 # Configuracion del formateador Lua
  colors/
    c_viper.lua               # Entrada del colorscheme
  lua/
    config/
      lazy.lua                # Bootstrap de lazy.nvim
      keymaps.lua             # Keymaps personalizados
      options.lua             # Opciones de Vim
      autocmds.lua            # Autocomandos
    c_viper/
      init.lua                # Paleta de colores y highlights base
      languages.lua           # Highlights por lenguaje (TS, JSX, Vue, HTML)
      plugins.lua             # Highlights para plugins
    lib/
      pomodoro.lua            # Sistema Pomodoro completo
    plugins/
      ui.lua                  # Snacks, Lualine, Noice, Incline, Smear, Triforce
      editor.lua              # Oil, goto-preview, OpenCode, rip-substitute, Minty
      colorscheme.lua         # Configuracion del colorscheme C. Viper
      copilot.lua             # GitHub Copilot
      neogit.lua              # Cliente Git Neogit
      testing.lua             # Colorizer, Summon
      wakatime.lua            # WakaTime
      toggleterm.lua          # ToggleTerm (deshabilitado)
      disabled.lua            # Plugins deshabilitados
```

## Comenzar

### Primeros Pasos

1. **Instalar configuracion** siguiendo las instrucciones
2. **Configurar Copilot**: `:Copilot setup`
3. **Probar Pomodoro**: `<leader>ps` para sesion interactiva
4. **Explorar archivos**: `<leader>ff` para buscar archivos
5. **Abrir terminal**: `<C-e>` para zellij flotante

### Tips de Productividad

- **Usar Oil**: `-` para navegar directorios como buffers
- **Aprovechar AI**: `<leader>ak` para chat con OpenCode, `<Tab>` para Copilot
- **Configurar Pomodoro**: Empieza con `<leader>p1` (sesion de 25min)
- **Terminal flotante**: `<C-e>` para zellij, `<leader>ge` para lazygit
- **Busqueda regex**: `<leader>fs` para rip-substitute
- **Preview LSP**: `gzd` para ver definiciones sin salir del archivo

### Comandos Utiles

```vim
:checkhealth          " Verificar configuracion
:Lazy                 " Gestor de plugins
:Mason                " Instalar LSPs/formatters
:Neogit               " Cliente Git
:WhichKey             " Ver todos los atajos disponibles
```

## Contribuir

### Reportar Issues

- Usa el [issue tracker](https://github.com/TzzJokerzzT/neovim-config/issues)
- Incluye informacion del sistema (`nvim --version`)
- Adjunta `:checkhealth` si es problema de configuracion

### Sugerir Mejoras

- **Fork** el repositorio
- **Crea** una branch: `feature/nueva-funcionalidad`
- **Commit** tus cambios
- **Push** y crea un **Pull Request**

## Licencia

Este proyecto esta bajo la Licencia Apache 2.0. Ver [LICENSE](LICENSE) para mas detalles.

---

<div align="center">

**Hecho con amor por [TzzJokerzzT](https://github.com/TzzJokerzzT)**

_Una configuracion moderna de NeoVim para desarrolladores que buscan productividad y elegancia_

[![GitHub](https://img.shields.io/badge/GitHub-TzzJokerzzT-181717?logo=github)](https://github.com/TzzJokerzzT)
[![Neovim](https://img.shields.io/badge/Neovim-0.10+-57A143?logo=neovim)](https://neovim.io)
[![LazyVim](https://img.shields.io/badge/LazyVim-Framework-6366f1)](https://lazyvim.org)

</div>
