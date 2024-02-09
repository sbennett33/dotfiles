require("neotest").setup({
  adapters = {
    require("neotest-elixir")({
      post_process_command = function(cmd)
        return vim.tbl_flatten({ { "doppler", "run", "--" }, cmd })
      end
    })
  },
})

vim.keymap.set('n', '<leader>tn', '<cmd>lua require("neotest").run.run()<cr>', {})
vim.keymap.set('n', '<leader>tl', '<cmd>lua require("neotest").run.run_last()<cr>', {})
vim.keymap.set('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', {})
vim.keymap.set('n', '<leader>ts', '<cmd>lua require("neotest").run.run({ suite = true })<cr>', {})
vim.keymap.set('n', '<leader>tt', '<cmd>lua require("neotest").summary.toggle()<cr>', {})
vim.keymap.set('n', '<leader>to', '<cmd>lua require("neotest").output_panel.toggle()<cr>', {})
