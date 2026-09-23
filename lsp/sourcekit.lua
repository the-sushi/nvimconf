return 
{
  filetypes = { "swift" },

  capabilities = require "blink.cmp" .get_lsp_capabilities
  {
    textDocument = 
    {
      completion = 
      {
        completionItem = 
        {
          snippetSupport = false
        }
      }
    }
  }
}
