return {
  -- Spotify controls via playerctl (MPRIS)
  -- Requires: playerctl (sudo pacman -S playerctl)
  {
    "nvim-lua/plenary.nvim",
    config = function()
      local spotify = {}
      local win = nil
      local buf = nil
      local refresh_timer = nil
      local anim_timer = nil
      local eq_frame = 0

      -- Run playerctl command (target Spotify only)
      spotify.run = function(cmd)
        local result = vim.fn.system("playerctl -p spotify " .. cmd .. " 2>/dev/null")
        if vim.v.shell_error ~= 0 then
          return nil
        end
        return result:gsub("%s+$", "")
      end

      -- Basic controls
      spotify.play = function()
        spotify.run("play")
      end

      spotify.pause = function()
        spotify.run("pause")
      end

      spotify.toggle = function()
        spotify.run("play-pause")
      end

      spotify.next = function()
        spotify.run("next")
        vim.defer_fn(function()
          spotify.refresh_info()
        end, 400)
      end

      spotify.back = function()
        spotify.run("previous")
        vim.defer_fn(function()
          spotify.refresh_info()
        end, 400)
      end

      -- Get track metadata
      spotify.get_metadata = function(key)
        return spotify.run("metadata " .. key) or ""
      end

      spotify.get_status = function()
        return spotify.run("status") or "Stopped"
      end

      -- Equalizer animation frames
      local eq_frames = {
        -- Each frame is 7 bars with different heights
        -- Characters: ▁▂▃▄▅▆▇█ (low to high)
        { "▁", "▃", "▅", "▇", "▅", "▃", "▁" },
        { "▂", "▄", "▆", "█", "▆", "▄", "▂" },
        { "▃", "▅", "▇", "█", "▇", "▅", "▃" },
        { "▄", "▆", "█", "▇", "█", "▆", "▄" },
        { "▅", "▇", "█", "▅", "█", "▇", "▅" },
        { "▆", "█", "▅", "▃", "▅", "█", "▆" },
        { "▇", "▅", "▃", "▂", "▃", "▅", "▇" },
        { "█", "▆", "▄", "▁", "▄", "▆", "█" },
        { "▇", "▅", "▃", "▂", "▃", "▅", "▇" },
        { "▆", "▄", "▂", "▁", "▂", "▄", "▆" },
        { "▅", "▃", "▁", "▁", "▁", "▃", "▅" },
        { "▄", "▂", "▁", "▃", "▁", "▂", "▄" },
      }

      local eq_paused = { "▁", "▁", "▁", "▁", "▁", "▁", "▁" }

      -- Get current equalizer frame
      spotify.get_equalizer = function(is_playing)
        if not is_playing then
          return "     " .. table.concat(eq_paused, " ")
        end
        local frame = eq_frames[(eq_frame % #eq_frames) + 1]
        return "     " .. table.concat(frame, " ")
      end

      -- Build the floating window content
      spotify.build_content = function()
        local status = spotify.get_status()
        local is_playing = (status == "Playing")
        local artist = spotify.get_metadata("artist")
        local title = spotify.get_metadata("title")
        local album = spotify.get_metadata("album")

        -- Status display
        local status_icon = is_playing and "▶" or "⏸"
        local status_text = is_playing and "Now Playing" or "Paused"

        -- Truncate long strings
        local max_len = 34
        if #title > max_len then
          title = title:sub(1, max_len - 3) .. "..."
        end
        if #artist > max_len then
          artist = artist:sub(1, max_len - 3) .. "..."
        end
        if #album > max_len then
          album = album:sub(1, max_len - 3) .. "..."
        end

        -- If nothing is loaded
        if title == "" and artist == "" then
          title = "No track loaded"
          artist = "Open Spotify to begin"
        end

        local eq = spotify.get_equalizer(is_playing)

        local lines = {
          "",
          "   ♫  " .. status_icon .. "  " .. status_text,
          "",
          eq,
          "",
          "     ───────────────────────────",
          "",
          "     " .. title,
          "     " .. artist,
          "     " .. album,
          "",
          "     ───────────────────────────",
          "",
          "     ⏮  ⏭  ⏯      ◀ q",
          "",
        }
        return lines
      end

      -- Refresh the window content
      spotify.refresh_info = function()
        if buf and vim.api.nvim_buf_is_valid(buf) then
          local lines = spotify.build_content()
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
        end
      end

      -- Animation tick
      spotify.animation_tick = function()
        local status = spotify.get_status()
        if status == "Playing" then
          eq_frame = eq_frame + 1
          spotify.refresh_info()
        end
      end

      -- Start animation timer
      spotify.start_animation = function()
        if anim_timer then
          anim_timer:stop()
        end
        anim_timer = vim.loop.new_timer()
        -- Update equalizer every 150ms for smooth animation
        anim_timer:start(
          150,
          150,
          vim.schedule_wrap(function()
            if win and vim.api.nvim_win_is_valid(win) then
              spotify.animation_tick()
            else
              if anim_timer then
                anim_timer:stop()
                anim_timer = nil
              end
            end
          end)
        )
      end

      -- Stop animation timer
      spotify.stop_animation = function()
        if anim_timer then
          anim_timer:stop()
          anim_timer = nil
        end
      end

      -- Toggle the floating window
      spotify.toggle_window = function()
        -- If window exists, close it
        if win and vim.api.nvim_win_is_valid(win) then
          spotify.close_window()
          return
        end

        -- Create buffer
        buf = vim.api.nvim_create_buf(false, true)
        vim.bo[buf].bufhidden = "wipe"
        vim.bo[buf].filetype = "spotify"

        -- Build initial content
        local lines = spotify.build_content()
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

        -- Window config
        local width = 44
        local height = 16
        local ui = vim.api.nvim_list_uis()[1]
        local opts = {
          relative = "editor",
          width = width,
          height = height,
          style = "minimal",
          border = "rounded",
          row = math.floor((ui.height - height) / 2),
          col = math.floor((ui.width - width) / 2),
          title = "  ♫ Spotify  ",
          title_pos = "center",
        }

        -- Create window
        win = vim.api.nvim_open_win(buf, true, opts)
        vim.wo[win].winhl = "Normal:Normal"
        vim.wo[win].cursorline = false

        -- Buffer keymaps
        local bmap = function(keys, fn)
          vim.keymap.set("n", keys, fn, { buffer = buf, noremap = true, silent = true })
        end

        bmap("q", function()
          spotify.close_window()
        end)
        bmap("<Esc>", function()
          spotify.close_window()
        end)
        bmap(" ", function()
          spotify.toggle()
          vim.defer_fn(function()
            spotify.refresh_info()
          end, 100)
        end)
        bmap("n", function()
          spotify.next()
        end)
        bmap("b", function()
          spotify.back()
        end)
        bmap(".", function()
          spotify.next()
        end)
        bmap(",", function()
          spotify.back()
        end)

        -- Start animation
        spotify.start_animation()
      end

      -- Close the floating window
      spotify.close_window = function()
        spotify.stop_animation()
        if refresh_timer then
          refresh_timer:stop()
          refresh_timer = nil
        end
        if win and vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_close(win, true)
          win = nil
        end
        buf = nil
      end

      -- Commands
      vim.api.nvim_create_user_command("Spotify", spotify.toggle_window, { desc = "Toggle Spotify player" })
      vim.api.nvim_create_user_command("SpotifyPlay", spotify.play, {})
      vim.api.nvim_create_user_command("SpotifyPause", spotify.pause, {})
      vim.api.nvim_create_user_command("SpotifyToggle", spotify.toggle, {})
      vim.api.nvim_create_user_command("SpotifyNext", spotify.next, {})
      vim.api.nvim_create_user_command("SpotifyBack", spotify.back, {})

      -- Global keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true, desc = "Spotify" }

      map("n", "<leader>zs", spotify.toggle_window, vim.tbl_extend("force", opts, { desc = "Spotify Player" }))
      map("n", "<leader>zp", spotify.toggle, vim.tbl_extend("force", opts, { desc = "Spotify Play/Pause" }))
      map("n", "<leader>zn", spotify.next, vim.tbl_extend("force", opts, { desc = "Spotify Next" }))
      map("n", "<leader>zb", spotify.back, vim.tbl_extend("force", opts, { desc = "Spotify Back" }))

      _G.spotify = spotify
    end,
  },
}
