return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.schedule(function()
          if vim.o.background == "light" then
            vim.cmd("colorscheme catppuccin-mocha")
          else
            vim.cmd("colorscheme catppuccin-mocha")
          end
        end)
      end,
    },
  },
}
