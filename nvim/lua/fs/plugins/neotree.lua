require("neo-tree").setup({
  window = {
    position = "float",
    mappings = {
      ["o"] = "open",
    },
  },
  file_system = {
    hijack_netrw_behavior = "open_default",
  },
})
