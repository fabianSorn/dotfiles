local nt = require("fs.plugins.functions.neotree")
-- Setup Space as Leader
local function setupLeader()
  vim.keymap.set("n", "<SPACE>", "<Nop>")
  vim.g.mapleader = " "
end

-- Function to set keybindings from table
local function resolve(keybindingsTable)
  local opts = { noremap = true, silent = true }
  for mode, bindings in pairs(keybindingsTable) do
    for _, binding in pairs(bindings) do
      for _, trigger in pairs(binding.trigger) do
        vim.keymap.set(mode, trigger, binding.action, opts)
      end
    end
  end
end

local generalBindings = {
  n = {
    -- Remove search highlight
    { trigger = { "<Leader>h" }, action = ":noh<CR>" },
    -- Reload current buffer
    { trigger = { "<Leader>R" }, action = ":e!<CR>" },
    -- Buffer navigation
    { trigger = { "<S-l>" }, action = ":bn<CR>" },
    { trigger = { "<S-h>" }, action = ":bp<CR>" },
    -- Move between open windows
    { trigger = { "<c-h>" }, action = ":wincmd h<cr>" },
    { trigger = { "<c-j>" }, action = ":wincmd j<cr>" },
    { trigger = { "<c-k>" }, action = ":wincmd k<cr>" },
    { trigger = { "<c-l>" }, action = ":wincmd l<cr>" },
    -- Move lines around
    { trigger = { "<A-j>", "º" }, action = ":m .+1<CR>==" },
    { trigger = { "<A-k>", "∆" }, action = ":m .-2<CR>==" },
  },
  v = {
    -- Moving lines
    { trigger = { "<A-j>", "º" }, action = ":m '>+1<CR>gv=gv" },
    { trigger = { "<A-k>", "∆" }, action = ":m '<-2<CR>gv=gv" },
    -- Better indentation
    { trigger = { "<" }, action = "<gv" },
    { trigger = { ">" }, action = ">gv" },
  }
}

local pluginBindings = {
  n = {
    -- closebuffer
    { trigger = { "<Leader>c" }, action = ":BDelete this<CR>" },
    { trigger = { "<Leader>C" }, action = ":BDelete! this<CR>" },
    -- telescope (find ...)
    { trigger = { "<Leader>ff" }, action = "<cmd>Telescope find_files<cr>" },
    { trigger = { "<Leader>fb" }, action = "<cmd>Telescope buffers<cr>" },
    { trigger = { "<Leader>fs" }, action = "<cmd>Telescope live_grep<cr>" },
    { trigger = { "<Leader>ft" }, action = "<cmd>Telescope treesitter<cr>" },
    { trigger = { "<Leader>fh" }, action = "<cmd>Telescope help_tags<cr>" },
    -- neo-tree (explore ...)
    { trigger = { "<Leader>ef" }, action = nt.filesystem },
    { trigger = { "<Leader>eb" }, action = nt.buffers },
    { trigger = { "<Leader>eg" }, action = nt.git_signs },
    -- zen-mode
    { trigger = { "<Leader>z" }, action = ":ZenMode<CR>" },
    -- lightspeed
    -- { trigger = { "s" }, action = "<Plug>Lightspeed_omni_s" },
    -- { trigger = { "S" }, action = "<Plug>Lightspeed_omni_s" },
    -- hop
    { trigger = { "s", "S" }, action = ":HopWord<CR>" },
    { trigger = { "f", "F" }, action = ":HopChar1<CR>" },
    -- vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
    -- vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
    -- vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
    -- vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
  }
}

setupLeader()
resolve(generalBindings)
resolve(pluginBindings)
