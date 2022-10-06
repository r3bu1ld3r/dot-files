return require('packer').startup(function()
    use 'neovim/nvim-lspconfig' 
    use 'simrat39/rust-tools.nvim'
    
    -- Status line
    use 'feline-nvim/feline.nvim'
    
    -- Colorscheme
    use 'EdenEast/nightfox.nvim'

     -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'

    -- Folding
    use 'nvim-treesitter/nvim-treesitter'
    
    -- Floating terminal
    use 'voldikss/vim-floaterm' 
    
    -- Navigation plugins
    use "nvim-lua/plenary.nvim" 
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' } 
    
    -- Tabs
    use 'kyazdani42/nvim-web-devicons' 
    use "nanozuki/tabby.nvim"
    
    -- File manager
    use 'kyazdani42/nvim-tree.lua'
end)

