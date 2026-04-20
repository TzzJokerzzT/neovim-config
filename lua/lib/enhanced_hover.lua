-- Enhanced LSP Hover
-- Expands TypeScript type aliases and interfaces that normally
-- only show "(alias) interface Foo / import Foo" without the body.
-- When an unexpanded type is detected, it fetches the type definition
-- source and appends it to the hover window.
local M = {}

--- Floating window config styled to match the active colorscheme.
--- Uses NormalFloat / FloatBorder / FloatTitle highlight groups.
local FLOAT_OPTS = {
  border = "rounded",
  max_width = 80,
  max_height = 30,
  title = " 󰌵 Hover ",
  title_pos = "center",
}

-- LSP clients that provide meaningful TypeScript/JavaScript hover
local TS_CLIENTS = { "vtsls", "ts_ls", "tsserver", "vue_ls" }

--- Find the TypeScript LSP client attached to the buffer
---@param bufnr integer
---@return vim.lsp.Client?
local function get_ts_client(bufnr)
  for _, name in ipairs(TS_CLIENTS) do
    local clients = vim.lsp.get_clients({ bufnr = bufnr, name = name })
    if #clients > 0 then
      return clients[1]
    end
  end
  return nil
end

--- Extract the text value from hover contents
---@param contents any
---@return string
local function extract_value(contents)
  if type(contents) == "string" then
    return contents
  end
  if type(contents) == "table" then
    return contents.value or ""
  end
  return ""
end

--- Read definition source lines and trim to the complete block
---@param uri string
---@param range table
---@return string[]?
local function read_definition(uri, range)
  local ok, def_bufnr = pcall(vim.uri_to_bufnr, uri)
  if not ok then
    return nil
  end

  vim.fn.bufload(def_bufnr)

  local start_line = range.start.line
  local total = vim.api.nvim_buf_line_count(def_bufnr)
  local end_line = math.min(start_line + 60, total)
  local lines = vim.api.nvim_buf_get_lines(def_bufnr, start_line, end_line, false)

  -- Trim to the complete definition using brace matching
  local trimmed = {}
  local brace_count = 0
  local found_open = false

  for _, line in ipairs(lines) do
    table.insert(trimmed, line)
    for _ in line:gmatch("{") do
      brace_count = brace_count + 1
      found_open = true
    end
    for _ in line:gmatch("}") do
      brace_count = brace_count - 1
    end
    if found_open and brace_count <= 0 then
      break
    end
  end

  return #trimmed > 0 and trimmed or nil
end

--- Check if hover content shows an unexpanded type alias or interface
---@param value string
---@return boolean
local function needs_expansion(value)
  local is_alias = value:match("%(alias%)") ~= nil
  local is_bare_interface = value:match("interface%s+%w+") ~= nil
  local is_bare_type = value:match("type%s+%w+") ~= nil
  local has_body = value:match("{") ~= nil

  return (is_alias or is_bare_interface or is_bare_type) and not has_body
end

--- Enhanced hover that expands TypeScript type aliases and interfaces.
--- Uses vtsls directly instead of buf_request_all to avoid responses
--- from unrelated clients (copilot, tailwindcss, biome).
--- Falls back to standard hover for non-TypeScript files.
function M.hover()
  local bufnr = vim.api.nvim_get_current_buf()
  local client = get_ts_client(bufnr)

  -- No TypeScript client attached, use standard hover
  if not client then
    vim.lsp.buf.hover(FLOAT_OPTS)
    return
  end

  local params = vim.lsp.util.make_position_params(0, client.offset_encoding or "utf-16")

  client:request("textDocument/hover", params, function(err, result)
    if err or not result or not result.contents then
      -- vtsls returned nothing, fall back to standard hover
      vim.lsp.buf.hover(FLOAT_OPTS)
      return
    end

    local value = extract_value(result.contents)
    local ctx = {
      method = "textDocument/hover",
      client_id = client.id,
      bufnr = bufnr,
      params = params,
    }

    -- If the hover already has the full body, show it as-is
    if not needs_expansion(value) then
      vim.lsp.handlers["textDocument/hover"](nil, result, ctx, FLOAT_OPTS)
      return
    end

    -- Fetch the definition source to expand the hover content
    client:request("textDocument/definition", params, function(td_err, td_result)
      if not td_err and td_result and not vim.tbl_isempty(td_result) then
        -- Handle both Location and Location[] responses
        local def = vim.islist(td_result) and td_result[1] or td_result
        local uri = def.uri or def.targetUri
        local range = def.range or def.targetRange

        if uri and range then
          local trimmed = read_definition(uri, range)
          if trimmed then
            local source = vim.fn.fnamemodify(vim.uri_to_fname(uri), ":~:.")
            local expanded = value
              .. "\n\n---\n> *"
              .. source
              .. "*\n```typescript\n"
              .. table.concat(trimmed, "\n")
              .. "\n```"
            result.contents = { kind = "markdown", value = expanded }
          end
        end
      end

      vim.lsp.handlers["textDocument/hover"](nil, result, ctx, FLOAT_OPTS)
    end)
  end)
end

return M
