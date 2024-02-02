require 'nvim-web-devicons'.setup {
    default = true
}

require("tabby").setup({
    tabline = require('tabby.tabline').use_preset('active_tab_with_wins', {
        nerdfont = true,
        lualine_theme = nil,
        tab_name = {
            name_fallback = function(tabid)
                return tabid
            end,
        },
        buf_name = {
            mode = "'unique'|'relative'|'tail'|'shorten'",
        },
    }),
})
