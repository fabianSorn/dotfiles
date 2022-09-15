local screen = require("fs.utils.screen")
local nt = require("neo-tree")

nt.setup({
  close_if_last_window = true,
  default_component_configs = {
    container = {
      enable_character_fade = true
    },
    indent = {
      with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
      },
    },
  window = {
    mappings = {
      ["o"] = "open",
    },
  },
  buffers = {
    group_empty_dirs = true,
  },
  filesystem = {
    hijack_netrw_behavior = "open_default",
    group_empty_dirs = true,
  },
})

