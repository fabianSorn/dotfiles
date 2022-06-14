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
      event = "BufReadPre",
      wants = { "nvim-lsp-installer" },
      config = function()
	require("lsp.config").setup()
      end,
      requires = {
	"williamboman/nvim-lsp-installer",
      },
    }

    -- Buffer Line
    use {
	"akinsho/bufferline.nvim", 
	tag = "v2.*", 
	requires = "kyazdani42/nvim-web-devicons"
    }

    -- Telescope file finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = { 
	  {
	      "nvim-lua/plenary.nvim", 
	      "BurntSushi/ripgrep"
	  } 
      }
    }

    -- Native implementation of fzf for better performance
    use {
	"nvim-telescope/telescope-fzf-native.nvim", 
	run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" 
    }
end)
