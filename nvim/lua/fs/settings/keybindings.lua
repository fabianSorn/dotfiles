local nt = require("fs.plugins.functions.neotree")
local hop = require("fs.plugins.functions.hop")
local telescope = require("telescope.builtin")

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
    -- Move many lines at once
    { trigger = { "J" }, action = "10j" },
    { trigger = { "K" }, action = "10k" },
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
    { trigger = { "<Leader>ff" }, action = telescope.find_files },
    { trigger = { "<Leader>fb" }, action = telescope.buffers },
    { trigger = { "<Leader>fs" }, action = telescope.live_grep },
    { trigger = { "<Leader>fS" }, action = telescope.current_buffer_fuzzy_find },
    { trigger = { "<Leader>ft" }, action = telescope.treesitter },
    { trigger = { "<Leader>fh" }, action = telescope.help_tags },
    { trigger = { "<Leader>fr" }, action = telescope.resume },
    { trigger = { "<Leader>fc" }, action = telescope.commands },
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
    { trigger = { "<Leader>hw" }, action = ":HopWord<CR>" },
    { trigger = { "<Leader>hc" }, action = ":HopChar1<CR>" },
    { trigger = { "<Leader>hl" }, action = ":HopLine<CR>" },
    -- hlslens
    { trigger = { "n" }, action = [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]] },
    { trigger = { "N" }, action = [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]] },
    { trigger = { "*" }, action = [[*<Cmd>lua require('hlslens').start()<CR>]] },
    { trigger = { "#" }, action = [[#<Cmd>lua require('hlslens').start()<CR>]] },
    { trigger = { "g*" }, action = [[g*<Cmd>lua require('hlslens').start()<CR>]] },
    { trigger = { "g#" }, action = [[g#<Cmd>lua require('hlslens').start()<CR>]] },
  }
}


setupLeader()
resolve(generalBindings)
resolve(pluginBindings)
