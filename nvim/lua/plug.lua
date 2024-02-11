require("lazy").setup({
    -- Colorscheme
    'EdenEast/nightfox.nvim',

    -- lsp zero
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            {
                'neovim/nvim-lspconfig',
                dependencies = {
                    { 'lvimuser/lsp-inlayhints.nvim' },
                }
            },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            {
                'hrsh7th/nvim-cmp',
                dependencies = {
                    {
                        "zbirenbaum/copilot-cmp",
                        module = "copilot_cmp",
                        config = function()
                            require("copilot_cmp").setup({
                                event = { "InsertEnter", "LspAttach" },
                                fix_pairs = true,
                            })
                        end,
                        dependencies = {
                            {
                                "zbirenbaum/copilot.lua",
                                config = function()
                                    require("copilot").setup({
                                        suggestion = { enabled = true, auto_trigger = false },
                                        panel = { enabled = false },
                                    })
                                end,
                            }
                        }
                    },
                }
            },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua',    ft = { 'lua' } },
            {
                'mrcjkb/rustaceanvim',
                version = '^4', -- Recommended
                ft = { 'rust' },

            },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    -- Highlight syntax & folding
    { 'nvim-treesitter/nvim-treesitter' },

    -- Floating terminal
    'voldikss/vim-floaterm',

    -- Navigation plugins
    'nvim-lua/plenary.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Tabs
    'kyazdani42/nvim-web-devicons',
    'nanozuki/tabby.nvim',

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },

    -- Undo history
    'mbbill/undotree',

    -- Git blame. Commands: EnableBlame/DisableBlame/ToggleBlame
    'FabijanZulj/blame.nvim',

    -- ChatGPT
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },

})
