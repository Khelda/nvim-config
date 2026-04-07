--
-- Blink.cmp configuration for completion purposes and snippets
--

-- intermediate requirements
local webicons = require 'nvim-web-devicons'
local lkind = require 'lspkind'

-- completion config
require 'blink.cmp'.setup {
    -- implementor choice
    fuzzy = { implementation = "lua" },
    sources = { default = { 'lsp', 'path', "snippets", 'buffer' } },

    -- completion behavior
    completion = {
        keyword = { range = 'prefix' },
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = true, auto_insert = false } },
        -- auto documentation popup
        documentation = {
            -- core settings
            auto_show = true,
            auto_show_delay_ms = 500,
            -- display
            window = { border = "single" }
        },
        -- menu auto-popup settings
        menu = {
            -- core settings
            auto_show = true,
            auto_show_delay_ms = 200,
            -- display
            border = "single",
            draw = { components = {
                kind_icon = {
                    text = function(ctx)
                        local icon = ctx.kind_icon
                        if vim.tbl_contains({ "Path" }, ctx.source_name) then
                            local dev_icon, _ = webicons.get_icon(ctx.label)
                            if dev_icon then
                                icon = dev_icon
                            end
                        else
                            icon = lkind.symbol_map[ctx.kind] or ""
                        end
                        -- result icon
                        return icon .. ctx.icon_gap
                    end,

                    -- Highlight locks for comfort
                    highlight = function(ctx)
                        local hl = ctx.kind_hl
                        if vim.tbl_contains({ "Path" }, ctx.source_name) then
                            local dev_icon, dev_hl = webicons.get_icon(ctx.label)
                            if dev_icon then
                                hl = dev_hl
                            end
                        end
                        -- result highlight
                        return hl
                    end
                }
            } }
        },
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
        ['<Left>'] = { 'cancel', 'fallback' },
        ['<Back>'] = { 'cancel', 'fallback' }
    },
}
