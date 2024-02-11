local lsp = require('lsp-zero')
local ih = require('lsp-inlayhints')
local luasnip = require('luasnip')
ih.setup()

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'gopls',
    },
    handlers = {
        lsp.default_setup,
    },
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Configure gopls
lsp.configure('gopls', {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            allowImplicitNetworkAccess = true,
            staticcheck = true,
            gofumpt = true,
            hints = {
                assignVariableTypes = true,
                parameterNames = true,
                compositeLiteralFields = true,
                functionTypeParameters = true,
                parameterTypes = true,
            },
            verboseOutput = true,
        },
    },
})

local cmp = require('cmp')
cmp.setup({
    completion = {
        autocomplete = {
            cmp.TriggerEvent.TextChanged,
            cmp.TriggerEvent.InsertEnter,
        },
        completeopt = "menu,menuone,noselect",
        -- keyword_length = 0,
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<A-Space>'] = cmp.mapping.complete({
            config = {
                sources = {
                    { name = "copilot" },
                }
            }
        }),
        ['<C-e>'] = cmp.mapping.close(),
    }),

    sources = cmp.config.sources({
        { name = 'copilot',  group_index = 1, },
        { name = 'nvim_lsp', group_index = 2, },
        { name = 'path',     group_index = 3, },
        { name = 'calc',     group_index = 3, },
        { name = 'buffer',   group_index = 3, },
        { name = 'vsnip',    group_index = 3, },
    }),

    experimental = {
        ghost_text = true
    }
})

lsp.set_preferences({
    suggest_lsp_server = true,
    single_file_support = true,
    set_lsp_keymaps = false,
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
    require("lsp-inlayhints").on_attach(client, bufnr)
    local opts = { buffer = bufnr, remap = true }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>q', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>ws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end)

vim.g.rustaceanvim = {
    server = {
        capabilities = lsp.get_capabilities(),
        on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, remap = true }
            lsp.on_attach(client, bufnr)
            vim.keymap.set('n', '<leader>ca', function() vim.cmd.RustLsp('codeAction') end, opts)
            vim.keymap.set('n', '<leader>cc', function() vim.cmd.RustLsp('openCargo') end, opts)
            vim.keymap.set('n', '<leader>pm', function() vim.cmd.RustLsp('parentModule') end, opts)
            vim.keymap.set('n', '<leader>em', function() vim.cmd.RustLsp('expandMacro') end, opts)
            vim.keymap.set('n', '<leader>ru', function() vim.cmd.RustLsp('runnables') end, opts)
            vim.keymap.set('n', '<leader>ws', function() vim.cmd.RustLsp('workspaceSymbol') end, opts)
        end,
    },
}

lsp.setup()
