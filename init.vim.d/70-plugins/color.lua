--
-- Color Picker configuration file
--

require 'oklch-color-picker'.setup {
    highlight = {
        style = "virtual_left",
        virtual_text = "■ "
    },
    -- lsp integrations
    enabled_lsps = true, -- enabling everything
    disable_builtin_lsp_colors = true
}
