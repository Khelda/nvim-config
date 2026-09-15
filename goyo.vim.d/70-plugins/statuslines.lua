-- Goyo-specific statuslines

require 'utils'
require 'colors'
local colors = colors()

-- custom theme for the bar
local bubbles_theme = {
    normal = { a = { fg = colors.black, bg = colors.sand } },
    insert = { a = { fg = colors.black, bg = colors.sand } },
    visual = { a = { fg = colors.black, bg = colors.rsand } },
    replace = { a = { fg = colors.black, bg = colors.blue } },
}

-- loading the plugin
require 'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = bubbles_theme,
        component_separators = { right = "" }
    },
    sections = {
        lualine_a = {
            {
                "mode",
                separator = { left = "", right = "" },
                right_padding = 2
            },
            {
                get_visual_multi,
                separator = { left = "", right = "" },
                right_padding = 2
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filetype" },
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
}
