-- Setup Space as Leader
vim.keymap.set("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "

-- Normal mode 
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<Leader>r", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<Leader>f", ":NvimTreeFindFile<CR>")

