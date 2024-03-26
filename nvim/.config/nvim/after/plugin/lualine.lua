require('lualine').setup {
  options = {
    theme = 'catppuccin',
    disabled_filetypes = {
      'NVimTree'
    },
  },
  extensions = { 'lazy', 'quickfix', 'nvim-tree' },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'filetype' },
    lualine_y = {},
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
