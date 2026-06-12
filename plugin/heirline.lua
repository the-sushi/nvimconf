require "pack" .add "gh:rebelot/heirline.nvim"

local hl = require "heirline" 

local cond = require "heirline.conditions"
local util = require "heirline.utils"

---@class ViMode : StatusLine
--- String indicating the current vim mode.
---@field mode string
local vi_mode = 
{
  ---@param self ViMode
  init = function(self) 
    self.mode = vim.fn.mode(1)
  end,

  static = 
  {
    mode_names = 
    {
      n         = "Normal",
      no        = "Normal?",
      nov       = "Normal?",
      ["no\22"] = "Normal?",

      niI = "NormalI",
      niR = "NormalR",
      niV = "NormalV",

      nt  = "Terminal",
      ntT = "Terminal",

      v  = "Visual",
      vs = "Visual?",
      V  = "Visual-Line",
      Vs = "Visual-Line?",
      


    }
  }
}

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

  hl.setup
  {
    opts = 
    {
      colors = colors
    }
  }
end)

