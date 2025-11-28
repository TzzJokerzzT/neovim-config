-- Pomodoro Timer for Lualine
local M = {}

-- Timer states
local STATES = {
  IDLE = "idle",
  WORK = "work",
  STANDBY = "standby",
  BREAK = "break",
}

-- Timer configuration
local config = {
  work_time = 25 * 60, -- 25 minutes in seconds (customizable)
  standby_time = 3 * 60, -- 3 minutes standby
  break_time = 10 * 60, -- 10 minutes break
}

-- Timer state
local timer_state = {
  current_state = STATES.IDLE,
  remaining_time = 0,
  total_time = 0,
  timer = nil,
  session_count = 0,
}

-- Icons for different states
local icons = {
  [STATES.IDLE] = "🍅",
  [STATES.WORK] = "⏰",
  [STATES.STANDBY] = "⏸️",
  [STATES.BREAK] = "☕",
}

-- Parse time string to seconds (supports h, min, s, m)
-- Examples: "25min", "1h", "30m", "90s", "1h30m", "25"
local function parse_time_to_seconds(time_str)
  if not time_str or time_str == "" then
    return nil
  end

  -- If it's just a number, treat as minutes
  local just_number = tonumber(time_str)
  if just_number then
    -- Allow any positive number for flexibility
    return just_number > 0 and just_number * 60 or nil
  end

  local total_seconds = 0

  -- Extract hours
  local hours = time_str:match("(%d+)h")
  if hours then
    total_seconds = total_seconds + (tonumber(hours) * 3600)
  end

  -- Extract minutes (both 'min' and 'm' formats)
  local minutes = time_str:match("(%d+)min") or time_str:match("(%d+)m")
  if minutes then
    total_seconds = total_seconds + (tonumber(minutes) * 60)
  end

  -- Extract seconds
  local seconds = time_str:match("(%d+)s")
  if seconds then
    total_seconds = total_seconds + tonumber(seconds)
  end

  -- Allow any positive duration, no minimum limit
  return total_seconds > 0 and total_seconds or nil
end

-- Format time as MM:SS or HH:MM:SS for longer durations
local function format_time(seconds)
  local hours = math.floor(seconds / 3600)
  local minutes = math.floor((seconds % 3600) / 60)
  local secs = seconds % 60

  if hours > 0 then
    return string.format("%02d:%02d:%02d", hours, minutes, secs)
  else
    return string.format("%02d:%02d", minutes, secs)
  end
end

-- Format time duration for display
local function format_duration(seconds)
  local hours = math.floor(seconds / 3600)
  local minutes = math.floor((seconds % 3600) / 60)
  local secs = seconds % 60

  local parts = {}
  if hours > 0 then
    table.insert(parts, hours .. "h")
  end
  if minutes > 0 then
    table.insert(parts, minutes .. "min")
  end
  if secs > 0 and hours == 0 then -- Only show seconds if less than an hour
    table.insert(parts, secs .. "s")
  end

  return table.concat(parts, " ")
end

-- Show friendly notifications
local function notify(message, level, title)
  vim.notify(message, level or vim.log.levels.INFO, {
    title = title or "🍅 Pomodoro Timer",
    timeout = 5000,
  })
end

-- Stop current timer
local function stop_timer()
  if timer_state.timer then
    -- Use pcall to prevent errors when stopping/closing timer
    pcall(function()
      timer_state.timer:stop()
    end)
    pcall(function()
      timer_state.timer:close()
    end)
    timer_state.timer = nil
  end
end

-- Start timer with callback
local function start_timer(duration, on_complete)
  stop_timer()
  
  -- Ensure duration is valid (allow any positive duration)
  if not duration or duration <= 0 then
    notify("❌ Duración de timer inválida. Debe ser mayor a 0 segundos.", vim.log.levels.ERROR)
    return false
  end

  timer_state.remaining_time = duration
  timer_state.total_time = duration

  timer_state.timer = vim.loop.new_timer()
  
  -- Start timer with error handling
  local success = timer_state.timer:start(
    0,  -- Initial delay
    1000,  -- Repeat every 1 second
    vim.schedule_wrap(function()
      if timer_state.remaining_time > 0 then
        timer_state.remaining_time = timer_state.remaining_time - 1
      end

      if timer_state.remaining_time <= 0 then
        stop_timer()
        if on_complete then
          -- Use pcall to prevent errors from breaking the timer system
          local ok, err = pcall(on_complete)
          if not ok then
            vim.notify("Error en callback del timer: " .. (err or "unknown"), vim.log.levels.ERROR)
          end
        end
      end
    end)
  )
  
  if not success then
    notify("❌ Error iniciando el timer", vim.log.levels.ERROR)
    return false
  end
  
  return true
end

-- Forward declarations
local start_work_session, start_standby, start_break

-- State transition functions
start_work_session = function()
  timer_state.current_state = STATES.WORK
  timer_state.session_count = timer_state.session_count + 1

  notify(
    string.format(
      "🚀 ¡Sesión de trabajo #%d iniciada! ¡Vamos a darle! (%s)",
      timer_state.session_count,
      format_duration(config.work_time)
    ),
    vim.log.levels.INFO
  )

  local success = start_timer(config.work_time, function()
    -- Use pcall to prevent callback errors
    local ok, err = pcall(start_standby)
    if not ok then
      notify("Error en transición a standby: " .. (err or "unknown"), vim.log.levels.ERROR)
      timer_state.current_state = STATES.IDLE
    end
  end)
  
  if not success then
    timer_state.current_state = STATES.IDLE
    timer_state.session_count = timer_state.session_count - 1
  end
end

start_standby = function()
  timer_state.current_state = STATES.STANDBY

  notify(
    string.format("⏸️ ¡Tiempo de espera! Prepárate para el descanso... (%s)", 
      format_duration(config.standby_time)), 
    vim.log.levels.WARN, 
    "🍅 Transición"
  )

  local success = start_timer(config.standby_time, function()
    -- Use pcall to prevent callback errors
    local ok, err = pcall(start_break)
    if not ok then
      notify("Error en transición a descanso: " .. (err or "unknown"), vim.log.levels.ERROR)
      timer_state.current_state = STATES.IDLE
    end
  end)
  
  if not success then
    timer_state.current_state = STATES.IDLE
  end
end

start_break = function()
  timer_state.current_state = STATES.BREAK

  notify(
    string.format("☕ ¡Hora del descanso! Relájate y recarga energías (%s)", format_duration(config.break_time)),
    vim.log.levels.INFO,
    "🍅 Descanso merecido"
  )

  local success = start_timer(config.break_time, function()
    -- Safe state transition
    timer_state.current_state = STATES.IDLE
    notify("✨ ¡Descanso terminado! ¿Listo para otra sesión productiva?", vim.log.levels.INFO, "🍅 ¡Completado!")
  end)
  
  if not success then
    timer_state.current_state = STATES.IDLE
  end
end

-- Public functions
function M.start_session(work_time, break_time, standby_time)
  if timer_state.current_state ~= STATES.IDLE then
    notify("⚠️ Ya hay una sesión en curso. Usa :PomodoroStop para detenerla.", vim.log.levels.WARN)
    return false
  end

  -- Parse work time
  if work_time then
    local parsed_work = parse_time_to_seconds(work_time)
    if parsed_work then
      config.work_time = parsed_work
    else
      notify("⚠️ Formato de tiempo de trabajo inválido. Usa: 25min, 1h, 30m, 5s, etc.", vim.log.levels.ERROR)
      return false
    end
  end

  -- Parse break time
  if break_time then
    local parsed_break = parse_time_to_seconds(break_time)
    if parsed_break then
      config.break_time = parsed_break
    else
      notify("⚠️ Formato de tiempo de descanso inválido. Usa: 10min, 15m, 5s, etc.", vim.log.levels.ERROR)
      return false
    end
  end

  -- Parse standby time
  if standby_time then
    local parsed_standby = parse_time_to_seconds(standby_time)
    if parsed_standby then
      config.standby_time = parsed_standby
    else
      notify("⚠️ Formato de tiempo de espera inválido. Usa: 3min, 2m, 30s, etc.", vim.log.levels.ERROR)
      return false
    end
  end

  -- Use pcall to prevent errors from breaking the system
  local ok, err = pcall(start_work_session)
  if not ok then
    notify("❌ Error iniciando sesión: " .. (err or "unknown"), vim.log.levels.ERROR)
    timer_state.current_state = STATES.IDLE
    return false
  end
  
  return true
end

function M.stop_session()
  stop_timer()
  local prev_state = timer_state.current_state
  timer_state.current_state = STATES.IDLE
  timer_state.remaining_time = 0

  if prev_state ~= STATES.IDLE then
    notify("🛑 Sesión detenida. ¡Nos vemos pronto!", vim.log.levels.WARN, "🍅 Parada")
  end
end

function M.get_status()
  if timer_state.current_state == STATES.IDLE then
    return string.format("%s Pomodoro", icons[STATES.IDLE])
  end

  local icon = icons[timer_state.current_state]
  local time_str = format_time(timer_state.remaining_time)
  local state_name = timer_state.current_state:upper()

  return string.format("%s %s %s", icon, state_name, time_str)
end

function M.get_progress()
  if timer_state.current_state == STATES.IDLE or timer_state.total_time == 0 then
    return 0
  end

  return math.floor(((timer_state.total_time - timer_state.remaining_time) / timer_state.total_time) * 100)
end

function M.get_session_count()
  return timer_state.session_count
end

-- Create floating input window
local function create_floating_input(prompt, default_value, callback)
  -- Calculate window size and position
  local width = 50
  local height = 3
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  
  -- Create buffer
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Set buffer options
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'filetype', 'pomodoro-input')
  
  -- Create window
  local win = vim.api.nvim_open_win(buf, true, {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    border = 'rounded',
    title = ' 🍅 ' .. prompt .. ' ',
    title_pos = 'center'
  })
  
  -- Set window options
  vim.api.nvim_win_set_option(win, 'winhl', 'Normal:Normal,FloatBorder:FloatBorder')
  
  -- Add instructional text
  local lines = {
    '󰅂 Ejemplos: 25min, 1h, 30m, 90s, 1h30m',
    '󰌑 Presiona Enter para confirmar, Esc para cancelar',
    default_value or ''
  }
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  
  -- Position cursor on input line
  vim.api.nvim_win_set_cursor(win, {3, string.len(default_value or '')})
  
  -- Enter insert mode on the input line
  vim.cmd('startinsert!')
  
  -- Set up keymaps for the floating window
  local function close_and_callback(value)
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
    if callback then
      callback(value)
    end
  end
  
  -- Keymap for Enter (confirm)
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', '', {
    noremap = true,
    silent = true,
    callback = function()
      local current_line = vim.api.nvim_buf_get_lines(buf, 2, 3, false)[1]
      close_and_callback(current_line ~= '' and current_line or nil)
    end
  })
  
  -- Keymap for Escape (cancel)
  vim.api.nvim_buf_set_keymap(buf, 'i', '<Esc>', '', {
    noremap = true,
    silent = true,
    callback = function()
      close_and_callback(nil)
    end
  })
  
  -- Also handle normal mode Escape
  vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', '', {
    noremap = true,
    silent = true,
    callback = function()
      close_and_callback(nil)
    end
  })
  
  -- Restrict editing to only the input line
  vim.api.nvim_buf_set_keymap(buf, 'i', '<Up>', '<Nop>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(buf, 'i', '<Down>', '<Nop>', { noremap = true, silent = true })
  
  -- Auto-close on focus loss
  vim.api.nvim_create_autocmd({'BufLeave', 'WinLeave'}, {
    buffer = buf,
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end
  })
end

-- Interactive session start
function M.start_interactive()
  if timer_state.current_state ~= STATES.IDLE then
    notify("⚠️ Ya hay una sesión en curso. Usa :PomodoroStop para detenerla.", vim.log.levels.WARN)
    return
  end
  
  create_floating_input("Tiempo de trabajo", "25min", function(work_time)
    if not work_time then
      notify("❌ Sesión cancelada", vim.log.levels.INFO)
      return
    end
    
    create_floating_input("Tiempo de descanso", "10min", function(break_time)
      if not break_time then
        notify("❌ Sesión cancelada", vim.log.levels.INFO)
        return
      end
      
      create_floating_input("Tiempo de espera (standby)", "3min", function(standby_time)
        if not standby_time then
          notify("❌ Sesión cancelada", vim.log.levels.INFO)
          return
        end
        
        M.start_session(work_time, break_time, standby_time)
      end)
    end)
  end)
end

-- Interactive work time setup
function M.set_work_interactive()
  if timer_state.current_state ~= STATES.IDLE then
    notify("⚠️ Ya hay una sesión en curso. Usa :PomodoroStop para detenerla.", vim.log.levels.WARN)
    return
  end
  
  create_floating_input("Tiempo de trabajo", format_duration(config.work_time), function(work_time)
    if not work_time then
      notify("❌ Configuración cancelada", vim.log.levels.INFO)
      return
    end
    
    -- Solicitar el tiempo de break
    create_floating_input("Tiempo de descanso", format_duration(config.break_time), function(break_time)
      if not break_time then
        notify("❌ Configuración cancelada", vim.log.levels.INFO)
        return
      end
      
      -- Solicitar el tiempo de standby
      create_floating_input("Tiempo de espera (standby)", format_duration(config.standby_time), function(standby_time)
        if not standby_time then
          notify("❌ Configuración cancelada", vim.log.levels.INFO)
          return
        end
        
        M.start_session(work_time, break_time, standby_time)
      end)
    end)
  end)
end

-- Interactive break time setup
function M.set_break_interactive()
  if timer_state.current_state ~= STATES.IDLE then
    notify("⚠️ Ya hay una sesión en curso. Usa :PomodoroStop para detenerla.", vim.log.levels.WARN)
    return
  end
  
  -- Para consistencia, también solicitar trabajo primero y luego descanso
  create_floating_input("Tiempo de trabajo", format_duration(config.work_time), function(work_time)
    if not work_time then
      notify("❌ Configuración cancelada", vim.log.levels.INFO)
      return
    end
    
      create_floating_input("Tiempo de descanso", format_duration(config.break_time), function(break_time)
        if not break_time then
          notify("❌ Configuración cancelada", vim.log.levels.INFO)
          return
        end
        
        -- Solicitar el tiempo de standby
        create_floating_input("Tiempo de espera (standby)", format_duration(config.standby_time), function(standby_time)
          if not standby_time then
            notify("❌ Configuración cancelada", vim.log.levels.INFO)
            return
          end
          
          M.start_session(work_time, break_time, standby_time)
        end)
      end)
  end)
end

-- Interactive configuration
function M.configure_interactive()
  create_floating_input("Tiempo de trabajo por defecto", format_duration(config.work_time), function(work_time)
    if not work_time then
      notify("❌ Configuración cancelada", vim.log.levels.INFO)
      return
    end
    
    create_floating_input("Tiempo de descanso por defecto", format_duration(config.break_time), function(break_time)
      if not break_time then
        notify("❌ Configuración cancelada", vim.log.levels.INFO)
        return
      end
      
      create_floating_input("Tiempo de espera (standby)", format_duration(config.standby_time), function(standby_time)
        if standby_time then
          M.set_defaults(work_time, break_time, standby_time)
        else
          M.set_defaults(work_time, break_time, nil)
        end
      end)
    end)
  end)
end

-- Set default times
function M.set_defaults(work_time, break_time, standby_time)
  if work_time then
    local parsed_work = parse_time_to_seconds(work_time)
    if parsed_work then
      config.work_time = parsed_work
    else
      notify("⚠️ Formato de tiempo de trabajo inválido.", vim.log.levels.ERROR)
      return false
    end
  end

  if break_time then
    local parsed_break = parse_time_to_seconds(break_time)
    if parsed_break then
      config.break_time = parsed_break
    else
      notify("⚠️ Formato de tiempo de descanso inválido.", vim.log.levels.ERROR)
      return false
    end
  end

  if standby_time then
    local parsed_standby = parse_time_to_seconds(standby_time)
    if parsed_standby then
      config.standby_time = parsed_standby
    else
      notify("⚠️ Formato de tiempo de espera inválido.", vim.log.levels.ERROR)
      return false
    end
  end

  notify(
    string.format(
      "✅ Configuración actualizada:\nTrabajo: %s\nDescanso: %s\nEspera: %s",
      format_duration(config.work_time),
      format_duration(config.break_time),
      format_duration(config.standby_time)
    ),
    vim.log.levels.INFO,
    "🍅 Configuración"
  )

  return true
end

-- Setup commands
function M.setup()
  -- Command to start pomodoro with optional work and break times
  vim.api.nvim_create_user_command("PomodoroStart", function(opts)
    local args = vim.split(opts.args or "", "%s+")
    local work_time = args[1] and args[1] ~= "" and args[1] or nil
    local break_time = args[2] and args[2] ~= "" and args[2] or nil
    
    -- If no arguments provided, use interactive mode
    if not work_time and not break_time then
      M.start_interactive()
    else
      M.start_session(work_time, break_time)
    end
  end, {
    nargs = "*",
    desc = "Start Pomodoro session (interactive asks for work + break + standby times) - e.g., :PomodoroStart or :PomodoroStart 25min 10min",
  })

  -- Interactive commands
  vim.api.nvim_create_user_command("PomodoroInteractive", function()
    M.start_interactive()
  end, {
    desc = "Start Pomodoro session with interactive time input (work + break + standby)",
  })

  -- Command to set custom work time
  vim.api.nvim_create_user_command("PomodoroWork", function(opts)
    if opts.args and opts.args ~= "" then
      M.start_session(opts.args, nil)
    else
      M.set_work_interactive()
    end
  end, {
    nargs = "?",
    desc = "Start Pomodoro with custom work time (interactive mode asks for work + break + standby times) - e.g., :PomodoroWork or :PomodoroWork 45min",
  })

  -- Command to set custom break time (starts with current work time)
  vim.api.nvim_create_user_command("PomodoroBreak", function(opts)
    if opts.args and opts.args ~= "" then
      M.start_session(nil, opts.args)
    else
      M.set_break_interactive()
    end
  end, {
    nargs = "?",
    desc = "Start Pomodoro (interactive mode asks for work + break + standby times) - e.g., :PomodoroBreak or :PomodoroBreak 15min",
  })

  -- Command to stop pomodoro
  vim.api.nvim_create_user_command("PomodoroStop", function()
    M.stop_session()
  end, {
    desc = "Stop current Pomodoro session",
  })

  -- Command to show status
  vim.api.nvim_create_user_command("PomodoroStatus", function()
    local status = M.get_status()
    local progress = M.get_progress()
    local sessions = M.get_session_count()

    notify(
      string.format(
        "Estado: %s\nProgreso: %d%%\nSesiones completadas: %d\nTiempo trabajo: %s\nTiempo descanso: %s",
        status,
        progress,
        sessions,
        format_duration(config.work_time),
        format_duration(config.break_time)
      ),
      vim.log.levels.INFO,
      "🍅 Estado del Pomodoro"
    )
  end, {
    desc = "Show Pomodoro status",
  })

  -- Command to set default times
  vim.api.nvim_create_user_command("PomodoroConfig", function(opts)
    local args = vim.split(opts.args or "", "%s+")
    local work_time = args[1] and args[1] ~= "" and args[1] or nil
    local break_time = args[2] and args[2] ~= "" and args[2] or nil
    local standby_time = args[3] and args[3] ~= "" and args[3] or nil
    
    -- If no arguments provided, use interactive mode
    if not work_time and not break_time and not standby_time then
      M.configure_interactive()
    else
      M.set_defaults(work_time, break_time, standby_time)
    end
  end, {
    nargs = "*",
    desc = "Set default times (interactive if no args) - e.g., :PomodoroConfig or :PomodoroConfig 25min 10min 3min",
  })

  -- Keymaps - Updated to use interactive floating inputs
  vim.keymap.set("n", "<leader>ps", function() M.start_interactive() end, { desc = "Start Pomodoro session (interactive: work → break → standby)" })
  vim.keymap.set("n", "<leader>pS", ":PomodoroStop<CR>", { desc = "Stop Pomodoro session" })
  vim.keymap.set("n", "<leader>pi", ":PomodoroStatus<CR>", { desc = "Show Pomodoro info" })
  vim.keymap.set("n", "<leader>pw", function() M.set_work_interactive() end, { desc = "Start Pomodoro (interactive: work → break → standby)" })
  vim.keymap.set("n", "<leader>pb", function() M.set_break_interactive() end, { desc = "Start Pomodoro (interactive: work → break → standby)" })
  vim.keymap.set("n", "<leader>pc", function() M.configure_interactive() end, { desc = "Configure default Pomodoro times (interactive: work → break → standby)" })
  
  -- Additional quick start keymaps
  vim.keymap.set("n", "<leader>p1", function() M.start_session("25min", "5min") end, { desc = "Quick start: 25min work, 5min break" })
  vim.keymap.set("n", "<leader>p2", function() M.start_session("45min", "10min") end, { desc = "Quick start: 45min work, 10min break" })
  vim.keymap.set("n", "<leader>p3", function() M.start_session("90min", "20min") end, { desc = "Quick start: 90min work, 20min break" })
end

return M

