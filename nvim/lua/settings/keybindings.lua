-- Setup Space as Leader
vim.keymap.set("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "
vim.wo.number = true

-- NvimTree 
-- vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")
-- vim.keymap.set("n", "R", ":NvimTreeRefresh<CR>")

-- NeoTree 
vim.keymap.set("n", "<Leader>e", ":Neotree float toggle=true<CR>")
vim.keymap.set("n", "<Leader>b", ":Neotree float buffers toggle=true<CR>")

-- Buffer navigation
vim.keymap.set("n", "L", ":bn<CR>")
vim.keymap.set("n", "H", ":bp<CR>")
vim.keymap.set("n", "<Leader>c", ":Bdelete<CR>")
vim.keymap.set("n", "<Leader>C", ":Bdelete!<CR>")

-- Finding stuff
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>")

-- Window navigation
vim.keymap.set("n", "<c-h>", ":wincmd h<cr>")
vim.keymap.set("n", "<c-j>", ":wincmd j<cr>")
vim.keymap.set("n", "<c-k>", ":wincmd k<cr>")
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>")

-- Move around lines
vim.keymap.set("n", "<A-j>", ":m+1<CR>")
vim.keymap.set("n", "<A-k>", ":m-2<CR>")
-- macOS specific bindings for alt+<letter> (shortcut for some special characer)
vim.keymap.set("n", "º", ":m+1<CR>")
vim.keymap.set("n", "∆", ":m-2<CR>")

