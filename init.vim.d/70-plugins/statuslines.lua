--
-- Lualine config (BarBar will be defined elsewhere)
--

require 'utils'
require 'colors'
local colors = colors()

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.sand },
        b = { fg = colors.white, bg = colors.darker },
        c = { fg = colors.black, bg = colors.black },
    },

    insert = {
        a = { fg = colors.black, bg = colors.sand },
        c = { fg = "NONE", bg = colors.black }
    },

    visual = { a = { fg = colors.black, bg = colors.rsand } },
    replace = {
        -- Warning sign
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.darker },
        c = { fg = colors.black, bg = colors.black },
    },
    terminal = { a = { fg = colors.white, bg = colors.sand } },

    inactive = {
        a = { fg = colors.black, bg = colors.grey },
        b = { fg = colors.black, bg = "NONE" },
        c = { fg = colors.black, bg = "NONE" },
    }
}


-- Actually building the lualine
require 'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = bubbles_theme,
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
