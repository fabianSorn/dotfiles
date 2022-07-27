local colorscheme = "tokyonight"

vim.o.background = "light"

require("fs.utils.cmd").try_cmd(
  "colorscheme " ..colorscheme,
  "Could not find colorscheme " ..colorscheme
)

