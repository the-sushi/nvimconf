local m = {}

local registree = 
{
  -- Callbacks to invoke after plugins have finished.
  plugin = {}
}

setmetatable(m,
{
  __call = function(_, stage, f)
    if not stage then
      error("after.lua was not provided a stage")
    end

    if not registree[stage] then
      error("after.lua given unrecognized stage '"..tostring(stage).."'")
    end

    table.insert(registree[stage], f)
  end
})

m.exec = function(stage)
  assert(registree[stage],
    "after.lua:exec passed unknown stage '"..tostring(stage).."'")

  vim.iter(registree[stage]):each(function(f)
    f()
  end)
end

return m
