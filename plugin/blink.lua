require "pack" .add 
{
  "gh:saghen/blink.lib",
  "gh:saghen/blink.cmp",
  "gh:mikavilpas/blink-ripgrep.nvim",
}

-- Build blink's native stuff (freezes neovim until its done).
require "blink.cmp" .build():pwait()

-- Setup blink.
require "blink-cmp" .setup
{
  sources = 
  {
    default = { "lsp", "path", "buffer" },

    providers = 
    {
      ripgrep = 
      {
        name = "blink-ripgrep",
        module = "blink-ripgrep",
      }
    }
  },

  fuzzy = 
  {
    implementation = "prefer_rust_with_warning",
    sorts = 
    {
      "exact",
      "score",
      "sort_text",
    }
  },

  keymap = 
  {
    preset = "default",

    ['<S-CR>'] = { 'accept' },
    ['<Up>'] = false,
    ['<Down>'] = false,
    ['<S-Up>'] = { 'select_prev', 'fallback' },
    ['<S-Down>'] = { 'select_next', 'fallback' },
  },

  signature = 
  {
    enabled = true,

    trigger = 
    {
      show_on_insert = true,
    },

    window = 
    { 
      show_documentation = true,
    }
  },

  completion = 
  {
    accept = 
    {
      auto_brackets = { enabled = false }
    },

    documentation = 
    {
      auto_show = true,
      auto_show_delay_ms = 100,
    },

    menu = 
    {
      draw = 
      {
        treesitter = { 'lsp' }
      }
    }
  }
}
