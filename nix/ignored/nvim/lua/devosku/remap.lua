vim.g.mapleader = " "

-- paste over text without replacing paste "buffer" or whatever it is called
vim.keymap.set("x", "<leader>p", [["_dP]])

-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- switch buffers fast
vim.keymap.set("n", "<C-right>", ":bn<CR>")
vim.keymap.set("n", "<C-left>", ":bp<CR>")
