require("nvim-tree").setup({
  update_focused_file = {
    enable = true
  }
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { silent = true })
