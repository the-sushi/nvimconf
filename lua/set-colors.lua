local setcol = function(group, col)
  vim.cmd("highlight @"..group.." guifg=#"..col)

  if group:find "%.cpp$" then
    local cgroup = group:match "(.*)%.cpp$" .. ".c"
    vim.cmd("highlight @"..cgroup.." guifg=#"..col)

    local lgroup = group:match "(.*)%.cpp$" .. ".lpp"
    vim.cmd("highlight @"..lgroup.." guifg=#"..col)
  end
end

setcol("lsp.type.class.cpp",                     "ffcb68")
setcol("lsp.type.type.cpp",                      "ffcb68")
setcol("lsp.typemod.function.classScope.cpp",    "3e83a1")
setcol("lsp.type.function.cpp",                  "3e83a1")
setcol("keyword.return.cpp",                     "14665b")
setcol("conditional.cpp",                        "14665b")
setcol("repeat.cpp",                             "14665b")
setcol("boolean.cpp",                            "52dc90")
setcol("lsp.type.macro.cpp",                     "ff0000")
setcol("namespace.cpp",                          "50b9eb")
setcol("lsp.typemod.enumMember.globalScope.cpp", "22896e")
setcol("define.cpp",                             "5c5c5c")
setcol("include.cpp",                            "5c5c5c")
setcol("lsp.type.method.cpp",                    "3e83a1")
setcol("string.cpp",                             "c3e88d")
setcol("lsp.type.variable.cpp",                  "8cdd9b")
setcol("lsp.type.property.cpp",                  "008782")
setcol("string.escape.cpp",                      "78fae6")
setcol("number.cpp",                             "ff695a")
setcol("comment.cpp",                            "666666")
setcol("lsp.typemod.function.globalScope.cpp",   "3e83a1")
setcol("keyword.cpp",                            "14665b")
setcol("lsp.type.enumMember.cpp",                "22896e")
setcol("macro_identifier_func.lpp",              "7daaac")
setcol("macro_identifier_part.lpp",              "a54d6f")
setcol("string.lpp",                             "c3e88d")

local function sethl(group, opts)
  assert(group and (opts.fg or opts.bg))
  local cmd = "highlight @"..group
  if opts.fg then
    cmd = cmd.." guifg="..opts.fg
  end
  if opts.bg then
    cmd = cmd.." guibg="..opts.bg
  end
  vim.cmd(cmd)
end


