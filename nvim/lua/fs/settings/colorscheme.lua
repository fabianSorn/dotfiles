local os = require("fs.utils.os")

vim.o.background = os.background()

local colorscheme = "tokyonight"

require("fs.utils.cmd").try_cmd(
  "colorscheme " ..colorscheme,
  "Could not find colorscheme " ..colorscheme
)

