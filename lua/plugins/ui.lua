-- Lazy load wakatime and pomodoro
local timer = nil
local cached_time = "0m"
local pomodoro = nil
local pomodoro_loaded = false

local function update_wakatime()
  local handle = io.popen("wakatime --today 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result ~= "" then
      cached_time = result:gsub("\n", ""):gsub("hours?", "h"):gsub("minutes?", "m")
    end
  end
end

-- Función para lualine - lazy init wakatime
local function wakatime_status()
  if not timer then
    timer = vim.loop.new_timer()
    timer:start(0, 300000, vim.schedule_wrap(update_wakatime))
  end
  return cached_time
end

-- Lazy load pomodoro only when needed
local function ensure_pomodoro_loaded()
  if not pomodoro_loaded then
    pomodoro = require("lib.pomodoro")
    pomodoro.setup()
    pomodoro_loaded = true
  end
end

-- Función para mostrar el estado del Pomodoro en lualine
local function pomodoro_status()
  ensure_pomodoro_loaded()
  return pomodoro.get_status()
end

vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#bbc443", bold = true })

return {
  {
      -- Dashboard
    "folke/snacks.nvim",
    opts = {

      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = [[
⣿⣿⣿⣿⣿⣿⣿⣿⡈⠀⢥⣄⣀⠈⠉⠛⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⢀⠙⣿⣿⣷⣶⣌⡐⠌⠻⢿⣿⣿⣿⣿⣿⣿⣿⢿⠿⠿⣿⣿⡿⠛⠛⠋⠉⢀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠁⠘⣿⢿⣿⣿⣿⣦⣌⠀⠨⠙⠩⣭⣵⣶⣶⣿⣿⣷⣶⠖⢂⣠⡴⠞⠛⣉⣉⣁⣀⣀⣀⡉⠩⠭⢁⣀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠘⣧⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⠟⢁⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣍⡉⠀⠺⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠘⣷⡘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠢⠙⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢁⣴⣶⣾⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⢦⣤⡄⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⡟⢠⣿⣿⣿⣿⠀⠉⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣀⠀⠉⣻⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠘⢿⣿⣿⣿⣿⣿⣿⠇⢾⠁⣸⣿⣿⣿⣿⡀⢦⡈⠓⠊⠉⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢛⣫⣴⡿⠋⢀⣶⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠙⢿⣿⣿⣿⣿⠀⣦⣀⠀⠹⣿⡍⢨⣥⣼⠿⠂⠉⠂⠀⠈⣿⣏⠻⣿⣿⣿⣿⣿⣶⣾⣿⠟⠋⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠗⠀⠀⠉⠻⢿⣿⡀⠸⡍⠳⡄⣿⠃⣿⣿⡇⡆⠀⠀⠀⢀⠀⠘⠻⠦⠄⠈⢉⡉⠛⠋⠉⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠉⣀⣤⠶⣀⣭⠀⠀⠀⠀⢩⣀⢹⡄⠀⢸⡈⣿⣿⣧⠀⠀⠀⣠⣿⣇⢠⣵⣶⣶⠾⠋⠀⢠⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠉⢀⣤⠶⢛⣩⡴⠟⠋⠻⠃⠀⠀⢀⣈⡙⠀⠻⠗⢸⣧⠈⢿⣿⣷⣤⣘⣛⣛⣭⣼⣿⣿⡏⠀⠀⣼⠂⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠟⠋⢀⣴⠞⣋⣴⠞⢋⡁⠰⠾⠃⢀⣠⣶⣿⣿⣿⣿⣷⣄⠀⠘⣿⡇⢸⣿⣿⣀⡈⠙⠿⣿⣿⡏⣹⣧⣄⡠⠀⣀⠀⠙⢛⠛⣿⣿⠿⠟⠋⠉⣀⣀⣤⣤⣤⢀
⣿⣿⣿⣿⣿⡿⠃⢠⡾⢋⣴⠞⢋⣤⠀⠻⠏⣀⣴⣾⣿⣿⣿⠿⠛⣉⡁⣈⡙⠂⢰⣌⠻⠀⠙⢿⣿⣿⣿⣷⣶⣬⣽⠿⠛⠋⠀⠘⠛⠛⢁⣠⣾⠟⠁⠀⣤⣾⣿⣿⣿⣿⣿⣿⣸
⣿⣿⣿⣿⠟⠀⣴⠏⣴⠟⡁⢰⣿⡿⠀⣠⣾⣿⣿⣿⣿⠏⢠⣶⣿⣿⡇⣿⡇⢠⣤⠉⢁⣤⣾⣤⡀⠉⠙⠛⠉⠉⠁⣀⣤⣴⣿⣶⣴⣶⣿⠟⠁⣠⡾⣸⣿⣿⣿⣿⣿⣿⣿⠋⣹
⣿⣿⣿⠏⠀⣼⢋⡼⠁⠸⣷⠈⠋⢀⣾⣿⣿⣿⡿⢻⣟⠐⠀⣿⣿⣿⡇⣿⡇⠈⡡⠂⠀⠚⣉⣉⠀⡄⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⣠⣾⣿⠇⣿⣿⣿⣿⣿⣿⣿⠃⢠⣿
⣿⣿⡟⠀⣼⢃⡾⢁⡦⠀⠛⠁⢀⣿⣿⣿⣿⣿⣷⣿⣿⣇⣀⠸⣿⣿⡇⣿⣿⠀⠀⠀⢲⣿⣿⠹⣇⠀⢿⣿⣿⣿⣿⣿⣿⣿⡿⢛⠅⣠⣾⣿⡿⢋⣴⣬⣭⣭⣛⣛⠟⡁⣠⣿⣿
⣿⣿⢃⢰⡏⠘⠃⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⢻⣿⡇⣿⣿⡆⠀⠀⠀⢿⣿⡇⢿⡄⠘⣿⣿⣿⣿⣿⡿⠋⠀⣠⣾⣿⠟⣩⣶⣿⣿⣿⣿⠟⢋⠀⣨⣶⣿⣿⣿
⣿⠟⠘⠈⠀⢄⠀⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣇⠈⣿⣷⠸⣿⣧⠀⠀⠀⠸⣿⣿⠸⣷⠀⠸⣿⣿⡿⠋⢀⣤⣾⡿⢛⣵⣾⣿⣿⣿⠿⠋⠅⣊⣴⣾⣿⣿⣿⣿⣿
⠋⢀⣾⣆⡛⠀⠼⠿⠀⠀⠀⣈⠛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠆⢹⣿⣇⢹⣿⡆⠀⠀⠀⢿⣿⡆⣿⠀⢀⠉⠋⢀⣴⣿⠟⣫⣴⣿⣿⣿⡿⠋⠁⣀⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠋⢉⣿⣏⠠⠉⠆⠀⠀⠈⠛⠿⠷⣶⠆⣠⣌⡉⢉⡤⢀⣤⡀⢠⠀⢻⣿⣆⢿⣿⡀⠀⠀⠸⣿⣷⠁⢠⠟⠀⣴⡿⢛⣥⣾⣿⣿⡿⠛⠁⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣄⣀⡉⠉⠉⠁⠀⠐⠾⠀⣶⣦⣤⣄⣀⡚⠛⠛⠃⠸⡇⠧⠆⠇⢀⣠⡀⢻⣿⡌⢿⣷⡈⠀⠀⣿⡇⢰⠘⡀⡇⢋⣴⣿⣿⡿⠛⠁⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣷⣦⣐⠀⠀⣿⣿⣿⣿⣿⣿⣧⡀⠲⣦⣌⣉⣁⣴⣿⣿⣿⡄⠹⣿⡌⠿⠧⠀⠄⠈⢀⠀⡇⠁⠹⡌⠻⠛⠁⣀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⣿⣿⡿⠟⢛⡛⠛⠿⠦⠀⢉⠛⠿⠿⠿⣿⣿⡿⠆⠘⠋⣰⣿⣿⡇⢀⠀⠀⠘⡄⢄⣉⣄⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠀⠐⠛⠁⢤⣾⣿⣿⡌⢿⣆⠐⠌⠻⠶⠶⠞⠛⠉⣤⣶⢂⠀⢿⡿⣿⣧⠀⠀⠂⠢⡈⠀⠙⠃⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣷⡶⡀⠀⢀⣹⣿⣿⣿⣌⢿⠀⢠⣤⣤⣤⣤⣬⡓⢌⣁⠈⢀⠘⢿⣿⠛⠀⠀⠀⢠⣶⣤⣤⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡏⠄⣠⣦⠘⢿⣿⣿⠿⠟⠀⠀⣼⣿⣿⣿⣿⣿⣿⣷⡈⠁⢈⣀⠀⠀⠂⠈⢰⣄⠠⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠐⢠⣏⠁⠀⠀⠉⡀⠄⢀⣠⣼⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣀⣀⡀⢄⠀⠀⠀⠙⢦⠀⢈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡀⡀⠁⠀⠀⠀⢀⠲⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡁⠀⠀⠀⠀⠀⠀⠑⡜⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀A history it's just about to begins⠀   ⠀⠀⠀ ⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   The Legend of Zelda⠀🗡️⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀   ⠀⠀⠀⠀
]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
        {
            icon = "  ",
            key = "f",
            desc = "Find File                                 ",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          {
            icon = "  ",
            key = "n",
            desc = "New File                                  ",
            action = ":ene | startinsert",
          },
          {
            icon = "  ",
            key = "g",
            desc = "Find Text                                 ",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            icon = "  ",
            key = "r",
            desc = "Recent Files                              ",
            action = ":lua Snacks.dashboard.pick('oldfiles')",
          },
          {
            icon = "  ",
            key = "c",
            desc = "Config                                    ",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          {
            icon = "  ",
            key = "s",
            desc = "Restore Session                           ",
            section = "session",
          },
          {
            icon = "  ",
            key = "x",
            desc = "Lazy Extras                               ",
            action = ":LazyExtras",
          },
          {
            icon = "󰒲  ",
            key = "l",
            desc = "Lazy                                      ",
            action = ":Lazy",
          },
          {
            icon = "  ",
            key = "q",
            desc = "Quit                                      ",
            action = ":qa",
          },
        },
        },
      },
    },
  },

  {
    -- Lualine
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
    requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
    opts = {
      options = {
        theme = "iceberg_dark", -- Set the theme for lualine
        icons_enabled = true, -- Enable icons in the statusline
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode", -- Display the current mode
            icon = "󰞇", -- Set the icon for the mode
          },
        },
        lualine_x = {
          function()
            return require("triforce.lualine").level()
          end,
          function()
            return require("triforce.lualine").streak()
          end,
          function()
            return require("triforce.lualine").session_time()
          end,
          function()
            return require("triforce.lualine").achievements()
          end,
          {
            pomodoro_status,
            icon = "",
            color = function()
              -- Ensure pomodoro is loaded before accessing it
              ensure_pomodoro_loaded()
              local status = pomodoro.get_status()
              if status:find("WORK") then
                return { fg = "#ff6b6b" } -- Red for work time
              elseif status:find("BREAK") then
                return { fg = "#51cf66" } -- Green for break time
              elseif status:find("STANDBY") then
                return { fg = "#ffd43b" } -- Yellow for standby
              else
                return { fg = "#74c0fc" } -- Blue for idle
              end
            end,
          },
          { wakatime_status, icon = "⏱️" },
          "filetype",
        },
      },
    },
  },

  {
    -- Noice
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline", -- Use the cmdline view for the command-line
        },
        presets = {
          bottom_search = true, -- Enable bottom search view
          command_palette = true, -- Enable command palette view
          lsp_doc_border = true, -- Enable LSP documentation border
        },
        -- Uncomment the following lines to customize the cmdline popup view
        -- views = {
        --   cmdline_popup = {
        --     filter_options = {},
        --     win_options = {
        --       winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        --     },
        --   },
        -- },
      })
    end,
  },

  {
    -- Incline
    "b0o/incline.nvim",
    event = "BufReadPre", -- Load this plugin before reading a buffer
    priority = 1200, -- Set the priority for loading this plugin
    config = function()
      require("incline").setup({
        window = {
          margin = { vertical = 0, horizontal = 1 },
          winhighlight = {
            -- Eliminar el fondo de la ventana
            Normal = "", -- Fondo normal
            NormalNC = "", -- Fondo normal para ventanas no actuales
          },
        }, -- Set the window margin
        hide = {
          cursorline = true, -- Hide the incline window when the cursorline is active
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename -- Indicate if the file is modified
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
          return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
        end,
      })
    end,
  },

  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy", -- Load after UI is ready
    opts = {
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears and particles will look a lot less blocky.
      legacy_computing_symbols_support = false,

      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = true,

      transparent_bg_fallback_color = "#303030",

      cursor_color = "#303030",
    },
  },

  --Triforce
  {
    "gisketch/triforce.nvim",
    event = "VeryLazy", -- Load after startup
    dependencies = {
      "nvzone/volt",
    },
    config = function()
      require("triforce").setup({
        enabled = true, -- Enable/disable the entire plugin
        gamification_enabled = true, -- Enable XP, levels, achievements

        -- Notification settings
        notifications = {
          enabled = true, -- Master toggle for all notifications
          level_up = true, -- Show level up notifications
          achievements = true, -- Show achievement unlock notifications
        },

        -- Keymap configuration
        keymap = {
          show_profile = "<leader>tp", -- Set to nil to disable default keymap
        },

        -- Auto-save interval (in seconds)
        auto_save_interval = 300, -- Save stats every 5 minutes

        -- -- Add custom language support
        custom_languages = {
          javascript = { icon = "✨", name = "Javascript" },
          typescript = { icon = "🔷", name = "Typescript" },
          -- Add more languages...
        },

        -- Customize level progression (optional)
        level_progression = {
          tier_1 = { min_level = 1, max_level = 10, xp_per_level = 300 }, -- Levels 1-10
          tier_2 = { min_level = 11, max_level = 20, xp_per_level = 500 }, -- Levels 11-20
          tier_3 = { min_level = 21, max_level = math.huge, xp_per_level = 1000 }, -- Levels 21+
        },

        -- Customize XP rewards (optional)
        xp_rewards = {
          char = 1, -- XP per character typed
          line = 1, -- XP per new line
          save = 50, -- XP per file save
        },
      })
    end,
  },
}
