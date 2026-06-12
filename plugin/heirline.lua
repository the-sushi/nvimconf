require "pack" .add
{
  "gh:rebelot/heirline.nvim",
  "gh:nvim-tree/nvim-web-devicons",
  "gh:nvim-lua/lsp-status.nvim",
}

local util = require "util"

local hl = require "heirline" 
local cond = require "heirline.conditions"
local hlutil = require "heirline.utils"
local devicons = require "nvim-web-devicons"

-- * --------------------------------------------------------------------------

--- Gets a highlight through hierline's helper.
---@param name string
---@return vim.api.keyset.get_hl_info
local function gethl(name)
  return hlutil.get_highlight(name)
end

-- * --------------------------------------------------------------------------

--- Wrapper around hierline's `insert`.
---
local function insert(destination, ...)
  return hlutil.insert(destination, ...)
end

-- * --------------------------------------------------------------------------

local align = { provider = "%=" }
local space = { provider = " " }

-- * --------------------------------------------------------------------------

local vi_mode = 
{
  init = function(self) 
    self.mode = vim.fn.mode(1)
  end,

  static = 
  {
    -- :h mode()
    mode_names = 
    {
      n       = "Normal",
      v       = "Visual",
      V       = "Visual-Line",
      ["\22"] = "Visual-Block",
      s       = "Select",
      S       = "Select-Line",
      ["\19"] = "Select-Block",
      i       = "Insert",
      R       = "Replace",
      c       = "Cmd",
      r       = "...",
      rm      = "-more-",
      ["r?"]  = "?",
      ["!"]   = "!",
      t       = "Terminal",
    },

    mode_colors = 
    {
      n       = "dragonGreen",
      i       = "cyan",
      v       = "cyan",
      V       = "cyan",
      ["\22"] = "cyan",
      c       = "orange",
      s       = "purple",
      S       = "purple",
      ["\19"] = "purple",
      R       = "orange",
      r       = "orange",
      ["!"]   = "red",
      t       = "red",
    }
  },

  provider = function(self)
    local name = self.mode_names[self.mode]
    if not name then
      name = self.mode_names[self.mode:sub(1,1)]
    end
    if not name then
      name = "IDK! ("..self.mode..")"
    end
    return " "..name.." "
  end,

  hl = function(self)
    local m = self.mode:sub(1,1)
    return { bg = self.mode_colors[m], fg = "#111111", bold = false }
  end,

  update =
  {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd "redrawstatus"
    end)
  }
}

-- * --------------------------------------------------------------------------

local file_name_block = 
{
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end
}

-- * --------------------------------------------------------------------------

local file_icon = 
{
  init = function(self)
    local fname = self.filename
    local ext = vim.fn.fnamemodify(fname, ":e")

    self.icon, self.icon_color = devicons.get_icon_color(
      fname, 
      ext,
      { default = true })
  end,

  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,

  hl = function(self)
    return { fg = self.icon_color }
  end
}

-- * --------------------------------------------------------------------------

local file_name = 
{
  provider = function(self)
    -- Trim filename relative to current directory.
    -- :h filename-modifiers
    local fname = vim.fn.fnamemodify(self.filename, ":.")

    if fname == "" then 
      return "<idk>" 
    end

    -- If the filename occupies more than a fourth of the space, trim the 
    -- file path to its initials.
    if not cond.width_percent_below(#fname, 0.25) then
      fname = vim.fn.pathshorten(fname)
    end

    return fname
  end,

  hl = function()
    if cond.is_active() then
      return { fg = "dragonWhite" }
    else
      return { fg = "gray" }
    end
  end
}

-- * --------------------------------------------------------------------------

local file_flags = 
{
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = " [+]",
    hl = { fg = "dragonWhite" }
  },

  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = { fg = "samuraiRed" }
  }
}

-- * --------------------------------------------------------------------------

file_name_block = insert(file_name_block,
  file_icon,
  file_name,
  file_flags,
  { provider = '%<' })

-- * --------------------------------------------------------------------------

local file_type = 
{
  provider = function()
    return string.lower(vim.bo.filetype)
  end,

  hl = { fg = gethl "Type" .fg }
}

-- * --------------------------------------------------------------------------

local file_encoding = 
{
  provider = function()
    local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc
    -- Only show something if the encoding is not utf-8 (as it should NEVER 
    -- NOT BE!!!).
    return enc ~= 'utf-8' and enc
  end
}

-- * --------------------------------------------------------------------------

local file_format = 
{
  provider = function()
    local fmt = vim.bo.fileformat
    -- Similarly only show if the format is not 'unix'.
    return fmt ~= "unix" and fmt
  end
}

-- * --------------------------------------------------------------------------

local file_size = 
{
  provider = function()
    -- Like neovim would ever be able to display a file in the gigabyte 
    -- range.
    local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
    local fsize = util.buf.getFileSize()
    fsize = (fsize < 0 and 0) or 0
    if fsize < 1024 then
      return fsize..suffix[1]
    end
    local i = math.floor((math.log(fsize) / math.log(1024)))
    return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
  end
}

-- * --------------------------------------------------------------------------

local file_last_modified = 
{
  provider = function()
    local ftime = util.buf.getFileModTime()
    local time = (ftime > 0) and os.date("%c", ftime)
    if cond.width_percent_below(#time, 0.25) then
      return time
    end
  end
}

-- * --------------------------------------------------------------------------

local file_info_block = 
{
  file_type,
  -- file_size,
  -- space,
  -- file_last_modified,
}

-- * --------------------------------------------------------------------------

local ruler = 
{
  -- %l - current line number
  -- %L - number of lines in the buffer
  -- %c - column number
  provider = "%7(%l/%3L%):%2c"
}

-- * --------------------------------------------------------------------------

local scroll_bar =
{
  static = 
  {
    sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  provider = function(self)
    local curr_line = util.win.getCursorLine()
    local lines = util.buf.getLineCount()
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = { fg = "cyan", bg = "dragonBlack2" },
}

-- * --------------------------------------------------------------------------

local lsp = 
{
  condition = cond.lsp_attached,

  update = { "LspAttach", "LspDetach" },

  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_clients{ bufnr = 0 }) do
      table.insert(names, server.name)
    end
    return "["..table.concat(names, " ").."]"
  end,

  hl = { fg = "gray" }
}

-- * --------------------------------------------------------------------------

local term_name = 
{
  provider = function()
    local tname = util.buf.getName():gsub(".*:", "")
    return tname
  end,
  hl = { fg = "dragonWhite" }
}

-- * --------------------------------------------------------------------------

local normal_status_line = 
{
  hl = { bg = "dragonBlack0" },

  { condition = cond.is_active, vi_mode },
  space, file_name_block, space, 
  align,
  lsp, space, file_info_block, space, ruler, space, scroll_bar
}

-- * --------------------------------------------------------------------------

local terminal_status_line = 
{
  condition = function()
    return cond.buffer_matches({buftype = { "terminal" }})
  end,

  hl = { bg = "dragonBlack0" },

  {
    condition = cond.is_active,
    vi_mode,
  },

  file_type,
  space,
  term_name,
  align,
}

-- * --------------------------------------------------------------------------

local status_lines = 
{
  hl = function()
    if cond.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,

  fallthrough = false,

  terminal_status_line, 
  normal_status_line
}

-- * --------------------------------------------------------------------------

-- Since kanagawa is alphabetically after heirline, we have to perform actual
-- setup after we've loaded (to load kanagawa's colors).
--
-- TODO(sushi) it would be nice to be able to do something like this but 
--             between plugins, would require keeping more structured info 
--             about plugins though and this is much simpler for now.
require "after" ("plugin", function()
  -- Crazy how this plugin was made by the same guy who made the color scheme
  -- I use and they provide a way to get its colors for this plugin :).
  local colors = require "kanagawa.colors" .setup()

  hl.load_colors(colors.palette)

  hl.setup
  {
    statusline = status_lines,
  }
end)

