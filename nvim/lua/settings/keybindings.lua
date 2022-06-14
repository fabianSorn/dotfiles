-- Setup Space as Leader
vim.keymap.set("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.wo.number = true

-- Normal mode 
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<Leader>r", ":NvimTreeRefresh<CR>")
vim.keymap.set("n", "<Leader>f", ":NvimTreeFindFile<CR>")
vim.keymap.set("n", "L", ":bn<CR>")
vim.keymap.set("n", "H", ":bp<CR>")
vim.keymap.set("n", "<SPACE>c", "<C-U>bprevious <bar> bdelete #<CR>")
vim.keymap.set("n", "<SPACE>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<SPACE>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<SPACE>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<SPACE>fh", "<cmd>Telescope help_tags<cr>")

