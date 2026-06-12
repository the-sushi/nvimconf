return 
{
  cmd = { "clangd", "--header-insertion=never" },

  capabilities = require "blink.cmp" .get_lsp_capabilities(
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
  })
}
