vim.treesitter.start(nil, 'lpp')

vim.bo.formatoptions = "tcqjr2/"
vim.bo.cindent = true

vim.keymap.set("n", "<F6>", function()
  local curpos = vim.api.nvim_win_get_cursor(0)
  local bufnr = vim.api.nvim_win_get_buf(0)

  local lppls_search = vim.lsp.get_clients
  {
    bufnr = bufnr,
    name = "lppls",
  }

  local lppls = lppls_search[1]
  if not lppls then
    print("lppls is not attached to this buffer")
    return
  end

  lppls:request("lpplsCustom/previewOutput", 
  {
    uri = "file://"..vim.api.nvim_buf_get_name(bufnr),
    pos = { line = curpos[1] - 1, column = curpos[2] },
  },
  function(err, result, ctx)
    if err then
      print(err)
    end
  end, bufnr)
end)
