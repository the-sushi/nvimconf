--- 
--- Custom 'plugin' for enosi's lpp preprocessor.
---

-- Add the various extensions for lpp.
vim.filetype.add
{
  extension =
  {
    lpp = "lpp",
    lh = "lpp",
    li = "lpp",
    llua = "lpp",
    loggen = "lpp",
  }
}

vim.lsp.config["lppls"] = 
{
  cmd = { "/home/sushi/src/enosi/lppls/_build/lppls" },
  filetypes = { "lpp" }
}
