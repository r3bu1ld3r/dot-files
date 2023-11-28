local lsp = require('lsp-zero')
local ih = require('lsp-inlayhints')
ih.setup()

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
    'lua_ls',
    'gopls',
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
    on_attach = function(client, bufnr)
        ih.on_attach(client, bufnr)
    end,
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
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmd_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
})

lsp.setup_nvim_cmp({
    mapping = cmd_mappings,
    sources = {
        { name = 'path' },
        { name = 'copilot' },
        { name = 'nvim_lsp',               keyword_length = 3 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lua',               keyword_length = 2 },
        { name = 'buffer',                 keyword_length = 2 },
        { name = 'vsnip',                  keyword_length = 2 },
        { name = 'calc' }
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


local rt = require("rust-tools")

lsp.on_attach(function(client, bufnr)
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

    if client.name == "rust_analyzer" then
        vim.keymap.set('n', '<leader>cq', rt.hover_actions.hover_actions, opts)
        vim.keymap.set('n', '<leader>ca', rt.code_action_group.code_action_group, opts)
        vim.keymap.set('n', '<leader>cc', rt.open_cargo_toml.open_cargo_toml, opts)
        vim.keymap.set('n', '<leader>pm', rt.parent_module.parent_module, {})
        vim.keymap.set('n', '<leader>em', rt.expand_macro.expand_macro, opts)
    end
end)

lsp.setup()
