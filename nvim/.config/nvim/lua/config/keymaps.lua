-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "q", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map("n", "Q", "<cmd>:qa<cr>", { desc = "Quit All" })

vim.keymap.del("n", "<leader>|")
map("n", "<leader>\\", "<C-W>v", { desc = "Split Window Right", remap = true })

map("n", "<leader>bc", ':let @*=expand("%:.")<CR>', { desc = "Copy Buffer Relative Path" })
