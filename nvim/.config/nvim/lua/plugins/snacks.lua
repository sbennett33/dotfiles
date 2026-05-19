return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
        },
        explorer = {
          hidden = true,
          win = {
            list = {
              keys = {
                ["<C-h>"] = "tmux_left",
                ["<C-j>"] = "tmux_down",
                ["<C-k>"] = "tmux_up",
                ["<C-l>"] = "focus_editor",
              },
            },
          },
          actions = {
            tmux_left = function() vim.fn.system("tmux select-pane -L") end,
            tmux_down = function() vim.fn.system("tmux select-pane -D") end,
            tmux_up = function() vim.fn.system("tmux select-pane -U") end,
            focus_editor = function() vim.cmd("wincmd l") end,
          },
        },
      },
    },
  },
}
