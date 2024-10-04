{
  ...
}:
{
  plugins.lualine = {
    enable = true;
  };

  extraConfigLuaPost = ''
    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            section_separators = {'<U+E0B0>', '<U+E0B2>' },
            component_separators = {'<U+E0B1>', '<U+E0B3>' },
            disabled_filetypes = {
              statusline = { 'dashboard', 'neo-tree', 'Trouble'},
            },
            ignore_focus = { 'dashboard', 'neo-tree', 'Trouble' },
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch'},
            lualine_c = {'filename'},
            lualine_x = {
            { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = '<U+F188> ', warn = '<U+F071> ', info = '<U+F0EB> ', hint = '<U+F0EB> '} },
            'encoding',
            'filetype'
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {'fugitive'}
    }
  '';
}
