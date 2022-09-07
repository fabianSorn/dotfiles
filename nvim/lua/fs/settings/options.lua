local array = require("fs.utils.array")

local from80 = array.join(array.range(80, 999), ",")

vim.opt.backup = false                        -- Do not create any backup files
vim.opt.clipboard = "unnamedplus"             -- Use system clipboard by default
vim.opt.expandtab = true                      -- Replace tabs with spaces
vim.opt.mouse = "a"                           -- Support for mouse interaction
vim.opt.shiftwidth = 2                        -- Double space as tab
vim.opt.tabstop = 2                           -- Tab stop length
vim.opt.showmode = false                      -- Do not display mode when switching
vim.opt.smartcase = true                      -- Smarter capitalization
vim.opt.smartindent = true                    -- Smarter indentation
vim.opt.termguicolors = true                  -- Colors, whoop whoop
vim.opt.scrolloff = 8                         -- Nicer vertical scrolling
vim.opt.sidescrolloff = 0                     -- Nicer horizontal scrolling
vim.opt.list = true                           -- Use list characters
vim.opt.listchars = "tab:├─,space:∙"          -- Show tabs
vim.opt.undofile = true                       -- Persists undo
vim.opt.wrap = false                          -- No long line wrapping
vim.wo.colorcolumn = from80                   -- Show a column at after 100 characters for visual reference of width
vim.wo.number = true                          -- Enable absolute line numbers (at currently active line)
