local os = require("fs.utils.os")

local colorscheme = "tokyonight"

vim.o.background = os.background()
vim.cmd("colorscheme " .. colorscheme)
