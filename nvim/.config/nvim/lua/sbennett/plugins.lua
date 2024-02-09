local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = ":MasonUpdate",
      },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-vsnip' },
      { 'hrsh7th/vim-vsnip' },
      { "rafamadriz/friendly-snippets" },
      { "jose-elias-alvarez/null-ls.nvim" },
      { "folke/neodev.nvim" }
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  { "navarasu/onedark.nvim" },
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "windwp/nvim-autopairs",  config = true },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup({
        filetypes = { "html", "xml", "elixir", "heex" }
      })
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir"
    }
  },
  { "tpope/vim-projectionist" },
  { "numToStr/Comment.nvim",  config = true },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  { "moll/vim-bbye" },
  { "Shatur/neovim-session-manager" },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "f-person/git-blame.nvim" },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { 'zbirenbaum/copilot.lua' }
  },
  { "lewis6991/gitsigns.nvim", config = true },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'nvim-treesitter/nvim-treesitter-refactor',
  },
  {
    'almo7aya/openingh.nvim'
  },
  {
    'alexghergh/nvim-tmux-navigation'
  }
})
