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
            lualine_a = { 'mode' },
            lualine_b = {'branch'},
            lualine_c = {
            {
              'filename',
              file_status = true,      -- Displays file status (readonly status, modified status)
              newfile_status = false,  -- Display new file status (new file means no write after created)
              path = 4,                -- 0: Just the filename
                                       -- 1: Relative path
                                       -- 2: Absolute path
                                       -- 3: Absolute path, with tilde as the home directory
                                       -- 4: Filename and parent dir, with tilde as the home directory

              shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                                       -- for other components. (terrible name, any suggestions?)
              symbols = {
                modified = '[+]',      -- Text to show when the file is modified.
                readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]', -- Text to show for unnamed buffers.
                newfile = '[New]',     -- Text to show for newly created file before first write
              }
            }
            },
            lualine_x = {
            {
              'diagnostics',
               sources = {"nvim_lsp"},
               symbols = {
                 error = 'E',
                 warn = 'W',
                 info = 'I',
                 hint = 'H'
               }
            },
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
        tabline = { },
        winbar = { },
        inactive_winbar = { },
        extensions = {'fugitive', 'neo-tree'}
    }
  '';
}
