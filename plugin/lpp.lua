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
  cmd = 
  { 
    "/home/sushi/src/enosi/lpp/_build/lppls",
    "--log-path=lppls.log",
    -- "--recording-path=lppls-recording",
    -- "--message-log=lppls-messages.log",
    -- "--pretty-message-log",
    -- "--child-err-log=lppls-child.log",
    -- "--child-arg=--resource-dir=/home/sushi/src/enosi/third_party/llvm/linux/lib/clang/23"
  },
  filetypes = { "lpp" }
}
