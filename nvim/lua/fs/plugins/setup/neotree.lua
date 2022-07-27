local screen = require("fs.utils.screen")
local nt = require("neo-tree")

nt.setup({
  window = {
    position = screen.if_narrow("float", "left"),
    mappings = {
      ["o"] = "open",
    },
  },
  file_system = {
    hijack_netrw_behavior = "open_default",
  },
})

