local map = vim.api.nvim_set_keymap

-- fast scrolling
map('n', 'K', '10k', {})
map('v', 'K', '10k', {})
map('n', 'J', '10j', {})
map('v', 'J', '10j', {})

-- map U to redo
map('n', 'U', '<c-r>', {})
map('n', '<c-r>', '<NOP>', {})

-- stay in normal mode after inserting a new line
map('n', 'o', 'o <BS><Esc>', {})
map('n', 'O', 'O <BS><Esc>', {})

-- FloaTerm configuration
map('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ", {})
map('n', "t", ":FloatermToggle myfloat<CR>", {})
map('t', "<Esc>", "<C-\\><C-n>:q<CR>", {})

-- Tabby keys
map("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
map("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
map("n", "<leader>to", ":tabonly<CR>", { noremap = true })
map("n", "<leader>tn", ":tabn<CR>", { noremap = true })
map("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- map("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- map("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
