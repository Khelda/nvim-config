--
-- Code actions settings for easier refactor and LSP shennanigans
--

-- Code-actions provider
require 'tiny-code-action'.setup {
    picker = { 'buffer' },
    backend = 'vim',
    -- extra options
    opts = {
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
