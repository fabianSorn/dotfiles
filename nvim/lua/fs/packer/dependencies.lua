return require("packer").startup(function()

    -- Packer itself
    use "wbthomason/packer.nvim"

    -- Neo-Tree File Explorer
    use {
      "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
          "nvim-lua/plenary.nvim",
          "kyazdani42/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        }
    }

    -- Colorscheme
    use {
      "folke/tokyonight.nvim"
    }

    -- Collection of configurations for the built-in LSP client
    use {
      "neovim/nvim-lspconfig",
      event = "BufReadPre",
      wants = { "nvim-lsp-installer" },
      requires = {
        "williamboman/nvim-lsp-installer",
      },
    }

    -- which key
    use {
      "folke/which-key.nvim",
    }

    -- Buffer Line
    use {
      "akinsho/bufferline.nvim", 
      tag = "v2.*", 
      requires = "kyazdani42/nvim-web-devicons"
    }

    -- Closing buffers and keeping the window layout intact, otherwise closing
    -- buffers kinda sucks
    use "kazhala/close-buffers.nvim"

    -- Telescope file finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = { 
        "nvim-lua/plenary.nvim", 
        "BurntSushi/ripgrep"
      }
    }

    -- Native implementation of fzf for better performance
    use {
      "nvim-telescope/telescope-fzf-native.nvim", 
      run = "make" 
    }

    -- Tree sitter interface
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate"
    }

    -- More focused writing with centered reduced layout
    use "folke/zen-mode.nvim"

    -- Automatic opening and closing brackets
    use "windwp/nvim-autopairs"

    -- completion plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    -- use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions

    -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- fast as fuck navigation
    -- use "ggandor/lightspeed.nvim"

    -- Alternative to lightspeed
    use {
      "phaazon/hop.nvim",
      branch = "v2", -- optional but strongly recommended
    }

    -- Scollbar on the right side
    use("petertriho/nvim-scrollbar")

    -- Automatically installing language servers
    use "williamboman/mason.nvim"

    -- Terminal window in neovim
    use "akinsho/toggleterm.nvim"

    -- Nicer text search
    use "kevinhwang91/nvim-hlslens"

end)
