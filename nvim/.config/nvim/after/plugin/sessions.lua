local config = require('session_manager.config')

require('session_manager').setup({
  autoload_mode = config.AutoloadMode.CurrentDir, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
})

vim.keymap.set("n", "<leader>s", ":SessionManager load_session<cr>")
