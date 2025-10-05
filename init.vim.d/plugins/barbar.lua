--
-- BarBar lua configuration, so it can be tinkered with a bit more. However,
-- this will require duplicating the colorscheme dict.
--

-- BarBar configuration
require 'barbar'.setup {
    auto_hide = false,
    clickable = false,
    icons = { filetypes = {
        custom_colors = true,
        enabled = true
    } },
    sidebar_filetypes = {
        NvimTree = true,
        vista_kind = true,
        vista = true
    },
    -- padding options
    minimum_padding = 2,
    maximum_padding = 2
}
