-- local function wakatime_status()
--   local handle = io.popen("wakatime --today 2>/dev/null")
--   local result = handle:read("*a")
--   handle:close()
--   return result:gsub("\n", "") or "0 mins"
-- end
--
-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
--     requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
--     opts = {
--       options = {
--         theme = "iceberg_dark", -- Set the theme for lualine
--         icons_enabled = true, -- Enable icons in the statusline
--         section_separators = { left = "", right = "" },
--         component_separators = { left = "", right = "" },
--       },
--       sections = {
--         lualine_a = {
--           {
--             "mode", -- Display the current mode
--             icon = "󰞇", -- Set the icon for the mode
--           },
--         },
--         -- lualine_x = { { wakatime_status, icon = "⏱️" }, "filetype" },
--       },
--     },
--   },
-- }

local timer = vim.loop.new_timer()
local cached_time = "0m"

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

-- Actualiza cada 5 minutos (300,000 ms)
timer:start(0, 300000, vim.schedule_wrap(update_wakatime))

-- Función para lualine
local function wakatime_status()
  return cached_time
end

return {
  {
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
            icon = "", -- Set the icon for the mode
          },
        },
        lualine_x = { { wakatime_status, icon = "⏱️" }, "filetype" },
      },
    },
  },
}
