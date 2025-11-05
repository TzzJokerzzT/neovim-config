-- TreeSitter token inspector for debugging highlight groups
-- Add this to your Neovim config temporarily to inspect tokens under cursor

-- Function to inspect TreeSitter capture groups under cursor
local function inspect_treesitter_captures()
  local buf = vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1 -- Convert to 0-based indexing
  
  local parser = vim.treesitter.get_parser(buf)
  if not parser then
    print("No TreeSitter parser found for this buffer")
    return
  end
  
  local tree = parser:parse()[1]
  local root = tree:root()
  
  -- Get the node under cursor
  local node = root:descendant_for_range(row, col, row, col)
  if not node then
    print("No TreeSitter node found at cursor position")
    return
  end
  
  -- Get all captures for this node
  local query = vim.treesitter.query.get(parser:lang(), "highlights")
  if not query then
    print("No highlight query found for language: " .. parser:lang())
    return
  end
  
  local captures = {}
  for id, node_match, metadata in query:iter_captures(root, buf, row, row + 1) do
    if node_match == node or node:contains(node_match) then
      local capture_name = query.captures[id]
      table.insert(captures, capture_name)
    end
  end
  
  -- Print results
  print("TreeSitter node: " .. node:type())
  print("Node text: '" .. vim.treesitter.get_node_text(node, buf) .. "'")
  print("Captures: " .. table.concat(captures, ", "))
  
  -- Show current highlight group
  local synstack = vim.fn.synstack(row + 1, col + 1)
  if #synstack > 0 then
    local synid = synstack[#synstack]
    local synname = vim.fn.synIDattr(synid, "name")
    local translated = vim.fn.synIDattr(vim.fn.synIDtrans(synid), "name")
    print("Current highlight: " .. synname .. " -> " .. translated)
  end
end

-- Command to run the inspector
vim.api.nvim_create_user_command('TSInspect', inspect_treesitter_captures, {
  desc = 'Inspect TreeSitter captures under cursor'
})

print("Added :TSInspect command - place cursor on JSX attribute and run :TSInspect")