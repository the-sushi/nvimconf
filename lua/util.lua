local m = {}

--- Helpers related to buffers.
m.buf = {}

--- Returns the name of the current buffer or the one with `id` if provided.
--- 
--- (generally, this is the name of some file open in the buffer, but not 
--- always).
---
---@param id number?
m.buf.getName = function(id)
  return vim.api.nvim_buf_get_name(id or 0)
end

--- Returns the size of the file currently open in the buffer `id` or current 
--- if `id` is nil.
---
---@param id number?
---@return number
m.buf.getFileSize = function(id)
  return vim.fn.getfsize(m.buf.getName(id))
end

--- Returns the last modification time of the file currently open in buffer 
--- `id` or the current buffer if `id` is nil.
---
---@param id number?
---@return number
m.buf.getFileModTime = function(id)
  return vim.fn.getftime(m.buf.getName(id))
end

--- Returns the number of lines in buffer `id`.
---
---@param id number?
---@return number
m.buf.getLineCount = function(id)
  return vim.api.nvim_buf_line_count(id or 0)
end

m.buf.setIndentationOpts = function()
  vim.bo.tabstop = 2
  vim.bo.shiftwidth = 2
  vim.bo.expandtab = true
end

--- Helpers related to windows.
m.win = {}

--- Gets the cursor position of window `id`.
---
--- Remember: cursor position in neovim is 0 indexed for columns but 1 indexed
--- for rows.
---
---@param id number?
---@return { col: number, row: number }
m.win.getCursorPos = function(id)
  local p = vim.api.nvim_win_get_cursor(id or 0)
  return { row = p[1], col = p[2] }
end

--- Gets the cursor line of window `id`.
---
---@param id number?
---@return number
m.win.getCursorLine = function(id)
  return m.win.getCursorPos(id).row
end

--- Gets the cursor line of window `id`.
---
--- Remember: these are 0 indexed, unlike lines.
---
---@param id number?
---@return number
m.win.getCursorColumn = function(id)
  return m.win.getCursorPos(id).col
end


return m


