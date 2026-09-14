--
-- Goyo-specific statusline configuration
--

require 'utils'

-- building the statusline
require 'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = bubbles_theme(),
        disabled_filetypes = { statusline = {
            "coq-goals", "noice", "qf", "trouble", "Trouble",
            "vista", "vista_kind", "vista_markdown"
        } }
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
        lualine_y = {},
        lualine_z = {
            {
                "location",
                separator = { left = "", right = "" },
                left_padding = 2
            }
        }
    }
}
