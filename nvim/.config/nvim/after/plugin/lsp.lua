local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require("neodev").setup({})

lsp.setup()

require("luasnip.loaders.from_vscode").lazy_load()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'copilot' },
    { name = 'buffer' },
    { name = 'path' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }
})

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.credo,
  }
})
