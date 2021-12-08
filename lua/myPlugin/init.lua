local fzf = require("fzf")

local function name()
  -- Return the name of the plugin.
  print("hello")
end

local function version()
  -- Return the version number of the plugin.
  return "1.0.0"
end

local function init()
  -- Do something to initialise the plugin here...
  print("Init ", name())
end

local function cleanup()
  -- Do something to clean up the plugin here...
  print("Cleanup ", name())
end

local function findFile(file)
  vim.g.file_to_adjust = file
end

local function testing()
  coroutine.wrap(function()
    local result = fzf.fzf({"choice 1", "choice 2"})

    if result then
      findFile(result[1]);
    end
  end)()
end

-- Export the plugin functions to the Lua state.
return {
  name = name,
  version = version,
  init = init,
  cleanup = cleanup,
  testing = testing
}
