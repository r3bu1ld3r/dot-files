local chatgpt = require('chatgpt')

chatgpt.setup {
    openai_params = {
        model = "gpt-4-turbo-preview"
    },
    openai_edit_params = {
        model = "gpt-4-turbo-preview",
    },
    popup_input = {
        submit = "<leader>s"
    }
}
vim.keymap.set('n', '<leader>cgo', chatgpt.openChat, {})
vim.keymap.set('v', '<leader>cge', chatgpt.edit_with_instructions, {})
