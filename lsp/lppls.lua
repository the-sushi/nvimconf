return 
{
  root_markers = 
  {
    "compile_commands_lpp.json",
    ".envrc"
  },
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
