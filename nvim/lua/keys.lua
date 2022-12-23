local map = vim.keymap.set

-- fast scrolling
map('n', 'K', '10k')
map('v', 'K', '10k')
map('n', 'J', '10j')
map('v', 'J', '10j')

-- map U to redo
map('n', 'U', '<c-r>')
map('n', '<c-r>', '<NOP>')

-- stay in normal mode after inserting a new line
map('n', 'o', 'o <BS><Esc>')
map('n', 'O', 'O <BS><Esc>')

-- FloaTerm configuration
map('n', "<leader>ft", ":FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 fish <CR> ")
map('n', "t", ":FloatermToggle myfloat<CR>")
map('t', "<Esc>", "<C-\\><C-n>:q<CR>")

-- Tabby keys
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- map("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- map("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

-- Explore
map("n", "<leader>ex", vim.cmd.Ex)

-- Global copy/paste
map('n', "<leader>y", "\"+y")
map('n', "<leader>Y", "\"+Y")
map('v', "<leader>y", "\"+y")

map('n', "<leader>p", "\"+p")
map('n', "<leader>P", "\"+P")
map('v', "<leader>p", "\"+p")

-- Keep the middle during jump
map('n', "<C-d>", "<C-d>zz")
map('n', "<C-u>", "<C-u>zz")

-- Keep the middle during search
map('n', "n", "nzzzv")
map('n', "N", "Nzzzv")

-- disable annoying accidents
map('n', 'Q', "<nop>")
