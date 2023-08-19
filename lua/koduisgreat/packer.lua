-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')
vim.keymap.set('n', '<leader>pcp', '<cmd>PackerCompile<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pci', '<cmd>PackerInstall<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pcs', '<cmd>PackerSync<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pcu', '<cmd>PackerUpdate<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>pcc', '<cmd>PackerClean<CR>', { noremap = true, silent = true })
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Language Specific  Plugins
    use({
        'ray-x/go.nvim',
        config = function()
            require('go').setup()
        end
    })
    use 'ray-x/guihua.lua' -- recommended if need floating window support
    -- Appearance plugins
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use({
        'willothy/nvim-cokeline',
        requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
        config = function()
            require('cokeline').setup()
        end
    })
    -- Developer expereince plugins
    use 'mfussenegger/nvim-dap'

    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use("tpope/vim-fugitive")
    use("tpope/vim-dadbod")
    use("tpope/vim-commentary")
    use("kristijanhusak/vim-dadbod-completion")
    use("kristijanhusak/vim-dadbod-ui")
    use({
        'ray-x/navigator.lua',
        requires = {
            { 'ray-x/guihua.lua',     run = 'cd lua/fzy && make' },
            { 'neovim/nvim-lspconfig' },
        },
    })
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
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {}
        end
    }
    use("github/copilot.vim")
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
    use { 'mhartington/formatter.nvim' }
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use 'nvim-treesitter/nvim-treesitter-context'
    -- LSP plugins
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
end)
