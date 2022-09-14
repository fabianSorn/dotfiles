require("telescope").setup{
  defaults = {
    path_display = {"smart"},
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<C-p>"] = "cycle_history_prev",
        ["<C-n>"] = "cycle_history_next",
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = { }
}

require("telescope").load_extension("fzf")

