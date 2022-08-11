local nt = require("fs.plugins.functions.neotree")

-- ============================================================================
--                       General
-- ============================================================================

-- Options for all keybindings
local opts = { noremap = true, silent = true }

-- Setup Space as Leader
vim.keymap.set("n", "<SPACE>", "<Nop>")
vim.g.mapleader = " "

-- General
vim.keymap.set("n", "<Leader>h", ":noh<CR>", opts)

-- Buffer navigation
vim.keymap.set("n", "<S-l>", ":bn<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bp<CR>", opts)
vim.keymap.set("n", "<Leader>c", ":BDelete this<CR>", opts)
vim.keymap.set("n", "<Leader>C", ":BDelete! this<CR>", opts)

-- Finding stuff
vim.keymap.set("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<Leader>fs", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<Leader>ft", "<cmd>Telescope treesitter<cr>", opts)
vim.keymap.set("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", opts)

-- Window navigation
vim.keymap.set("n", "<c-h>", ":wincmd h<cr>", opts)
vim.keymap.set("n", "<c-j>", ":wincmd j<cr>", opts)
vim.keymap.set("n", "<c-k>", ":wincmd k<cr>", opts)
vim.keymap.set("n", "<c-l>", ":wincmd l<cr>", opts)

-- Move around lines
vim.keymap.set("n", "<A-j>", ":m+1<CR>", opts)
vim.keymap.set("n", "<A-k>", ":m-2<CR>", opts)
-- macOS specific bindings for alt+<letter> (because those produces some special character)
vim.keymap.set("n", "º", ":m+1<CR>", opts)
vim.keymap.set("n", "∆", ":m-2<CR>", opts)

-- Better indentation
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- ============================================================================
--                       Plugin related keybindings
-- ============================================================================

-- NeoTree
vim.keymap.set("n", "<Leader>e", nt.filesystem, opts)
vim.keymap.set("n", "<Leader>b", nt.buffers, opts)

-- ZenMode
vim.keymap.set("n", "<Leader>z", ":ZenMode<CR>", opts)

