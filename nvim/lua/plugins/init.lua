return require('packer').startup(function()

	-- Packer itself
	use 'wbthomason/packer.nvim'

	-- NVIM-Tree File Explorer
	use {
	    'kyazdani42/nvim-tree.lua',
	    requires = {
	      'kyazdani42/nvim-web-devicons', -- optional, for file icon
	    },
	}

	-- Collection of configurations for the built-in LSP client
	use {
	  "neovim/nvim-lspconfig",
	  opt = true,
	  event = "BufReadPre",
	  wants = { "nvim-lsp-installer" },
	  config = function()
	    require("config.lsp").setup()
	  end,
	  requires = {
	    "williamboman/nvim-lsp-installer",
	  },
	}
end)
