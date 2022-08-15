local spellCheck = vim.api.nvim_create_augroup("SpellCheck", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*tex",
  command = "setlocal spell spelllang=de,en",
  group = spellCheck,
})
