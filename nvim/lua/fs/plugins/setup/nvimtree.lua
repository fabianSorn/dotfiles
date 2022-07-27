require("nvim-tree").setup { 
    open_on_setup = false,
    open_on_setup_file = false,
    view = {
      adaptive_size = true,
      side = "left",
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
}
