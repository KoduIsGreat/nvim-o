-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')
vim.keymap.set('n', '<leader>pcp', '<cmd>PackerCompile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pci', '<cmd>PackerInstall<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pcs', '<cmd>PackerSync<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pcu', '<cmd>PackerUpdate<CR>', { noremap = true, silent = true })
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Golang plugin
  use 'ray-x/go.vim'
  -- Appearance plugins
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use {
     'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- Fuzzy finding
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'KadoBOT/nvim-spotify',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
        local spotify = require'nvim-spotify'

        spotify.setup {
            -- default opts
            status = {
                update_interval = 10000, -- the interval (ms) to check for what's currently playing
                format = '%s %t by %a' -- spotify-tui --format argument
            }
        }
    end,
    run = 'make'
}
  use("mbbill/undotree")
  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use 'nvim-treesitter/nvim-treesitter-context'
  use("tpope/vim-fugitive")
  use("tpope/vim-dadbod")
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
    end}
  use("kristijanhusak/vim-dadbod-completion")
  use("kristijanhusak/vim-dadbod-ui")
  use 'hsalem7/nvim-k8s'
  use {
  "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      }
     end
  }
  use("github/copilot.vim")
   use({
    'willothy/nvim-cokeline',
    requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
    config = function()
      require('cokeline').setup()
    end
  })
  use 'nvim-tree/nvim-web-devicons'
  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })
  use("theprimeagen/harpoon")
  use("theprimeagen/refactoring.nvim")
  use({
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
  use("folke/zen-mode.nvim")
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
end)
