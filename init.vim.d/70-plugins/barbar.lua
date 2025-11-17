--
-- BarBar lua configuration, so it can be tinkered with a bit more. However,
-- this may require duplicating the colorscheme dictionary.
--

-- BarBar configuration
require 'barbar'.setup {
    auto_hide = true,
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
