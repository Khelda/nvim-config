--
-- Code actions settings for easier refactor and LSP shennanigans
--

-- Code-actions provider
require 'tiny-code-action'.setup {
    picker = { 'buffer' },
    -- picking preview provider
    backend = 'vim',
    -- extra options
    opts = {
        auto_preview = true,
        -- window settings
        position = 'cursor',
        winborder = 'single',
        -- some keybinds
        keymaps = {
            preview = "K",            -- preview the consequences of a code action
            close = { "q", "<Esc>" }, -- exit the selection menu
            select = "<CR>"           -- using selected code action
        }
    }
}
