require 'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename' },
    lualine_x = {
      'encoding', 'fileformat', 'filetype', 'location',
      { 'diagnostics', sources = { 'nvim_lsp' }, symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' } }
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = { lualine_a = {}, lualine_b = {}, lualine_c = { 'filename' }, lualine_x = { 'location' },
    lualine_y = {}, lualine_z = {} }
}
