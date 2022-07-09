require("nvim-treesitter.configs").setup {
  -- Makes sure all treesitter parsers are installed
  ensure_installed = "all",

  -- phpdoc parser fails to install --> we do not install it...
  ignore_install = { "phpdoc" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
