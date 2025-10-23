--
-- Blink.cmp configuration for completion purposes
--

require 'blink.cmp'.setup {
    -- implementor choice
    fuzzy = { implementation = "lua" },
    sources = { default = { 'lsp', 'path', 'buffer' } },

    -- completion behavior
    completion = {
        keyword = { range = 'prefix' },
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = true, auto_insert = false } },
        -- auto documentation popup
        documentation = { auto_show = true, auto_show_delay_ms = 500 }
    },
    -- no command completion
    cmdline = { enabled = false },

    -- tweaking keymap to ensure acceptance at the right time
    keymap = {
        -- no default keymap on that one
        preset = 'none',
        -- new keybinds to ensure old completion behavior from coq.nvim
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        -- rollbacking completion and deleting compleated text
        ['<Left>'] = { 'cancel', 'fallback' }
    }
}
