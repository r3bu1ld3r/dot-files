return require('packer').startup(function()
    -- Colorscheme
    use('EdenEast/nightfox.nvim')

    use {
        'VonHeikemen/lsp-zero.nvim',
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
    
    use('lvimuser/lsp-inlayhints.nvim' )
    use('simrat39/rust-tools.nvim')
    
    -- Highlight syntax & folding
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    -- Floating terminal
    use('voldikss/vim-floaterm')

    -- Navigation plugins
    use('nvim-lua/plenary.nvim')
    use({
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })

    -- Tabs
    use('kyazdani42/nvim-web-devicons')
    use('nanozuki/tabby.nvim')

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Undo history
    use('mbbill/undotree')

    -- Copilot
    use {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        -- disable default copilot.lua configuartion for avoiding interfere with copilot-cmp
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua" },
        config = function()
            require("copilot_cmp").setup()
        end
    }

    -- ChatGPT
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

end)
