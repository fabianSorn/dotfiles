local colorscheme = "tokyonight"

require("fs.utils.cmd").try_cmd(
  "colorscheme " ..colorscheme,
  "Could not find colorscheme " ..colorscheme
)

