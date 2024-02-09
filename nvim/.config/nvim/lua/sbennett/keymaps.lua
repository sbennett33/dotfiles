vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>\\", vim.cmd.vsplit, opts)
vim.keymap.set("n", "<leader>-", vim.cmd.split, opts)

vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")

vim.keymap.set("n", "Q", vim.cmd.qa)
vim.keymap.set("n", "q", vim.cmd.Bdelete)

vim.keymap.set("n", "<leader>n", vim.cmd.cnext)

vim.keymap.set("n", "<leader>xx", vim.cmd.TroubleToggle)

vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv^", opts)
vim.keymap.set("v", ">", ">gv^", opts)
