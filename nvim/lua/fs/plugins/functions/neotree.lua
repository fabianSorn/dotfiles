local screen = require("fs.utils.screen")
local nt = require("neo-tree.command")

local helper = {}

function helper.toggle(source)
  local position = screen.if_narrow("float", "left")
  nt.execute({ action = "focus",
    source = source,
    position = position,
    toggle = true,
    reveal = true })
end

function helper.filesystem()
  helper.toggle("filesystem")
end

function helper.buffers()
  helper.toggle("buffers")
end

function helper.git_signs()
  helper.toggle("git_signs")
end

return helper
