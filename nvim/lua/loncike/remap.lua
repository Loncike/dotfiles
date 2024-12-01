vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "l", "j")
vim.keymap.set("n", "é", "l")
vim.keymap.set("v", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "l", "j")
vim.keymap.set("v", "é", "l")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "L", ":m '>+1<CR>gv=gv")

vim.keymap.set("n","K", "<C-d>zz")
vim.keymap.set("n","L", "<C-u>zz")
vim.keymap.set("n","n", "nzzzv")
vim.keymap.set("n","N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")  

--vim.keymap.set("n", "<leader>y", "\"+y")
--vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
