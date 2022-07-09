local colorscheme = "tokyonight"

require("fs.utils").try_cmd(
  "colorscheme " ..colorscheme,
  "Could not find colorscheme " ..colorscheme
)

