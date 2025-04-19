
Remap = vim.keymap.set
-- Move visual selection
Remap("v", "J", ":m '>+1<CR>gv=gv")
Remap("v", "K", ":m '<-2<CR>gv=gv")

