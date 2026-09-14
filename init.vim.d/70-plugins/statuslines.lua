--
-- Lualine config (BarBar will be defined elsewhere)
--

require 'utils'

-- Actually building the lualine
require 'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = bubbles_theme(),
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {
                'NvimTree', 'vista_kind', 'vista', 'Trouble', 'coq-goals',
                'vista_markdown', 'qf', 'trouble', 'noice'
            }
        },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                separator = { left = '', right = '' },
                right_padding = 2
            },
            {
                get_visual_multi,
                separator = { left = '', right = '' },
                right_padding = 2
            }
        },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'filetype', 'progress', 'diagnostics' },
        lualine_z = {
            { 'location',
                separator = { left = '', right = '' },
                left_padding = 2
            }
        }
    },
    inactive_sections = {
        lualine_a = {
            { 'filename',
                separator = { left = '', right = '' },
                right_padding = 2
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { 'diagnostics' },
        lualine_z = {
            { 'location',
                separator = { left = '', right = '' },
                left_padding = 2
            }
        }
    }
}
