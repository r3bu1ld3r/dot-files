local chatgpt = require('chatgpt')

chatgpt.setup {
    popup_input = {
        submit = "<leader>s"
    }
}
vim.keymap.set('n', '<leader>cgo', chatgpt.openChat, {})
vim.keymap.set('v', '<leader>cge', chatgpt.edit_with_instructions, {})
