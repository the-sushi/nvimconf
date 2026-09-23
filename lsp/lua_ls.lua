return 
{
  settings = 
  {
    Lua = 
    {
      runtime = 
      {
        enableLuaJITExtensions = true,
      },
      diagnostics = 
      {
        disable = 
        {
          "trailing-space",
          "newfield-call"
        },
      }
    }
  },
}
