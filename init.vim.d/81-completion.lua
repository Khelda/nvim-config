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
        accept = { auto_brackets = { enabled = false } },
        -- appearance tweaks
        menu = { draw = {
            components = {
                kind_icon = {
                    -- Define custom text for the completion engine
                    text = function(ctx)
                        -- find mini icons
                        if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                            local mini_icon, _ = require 'mini.icons'
                                .get_icon(ctx.item.data.type, ctx.label)
                            if mini_icon then return mini_icon .. ctx.icon_gap end
                        end

                        -- find lsp glyphs
                        local icon = require 'lspkind'
                            .symbolic(ctx.kind, { mode = 'symbol' })
                        return icon .. ctx.icon_gap
                    end,

                    -- define how one completion text would be highlighted
                    highlight = function(ctx)
                        if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                            local mini_icon, mini_hl = require 'mini.icons'
                                .get_icon(ctx.item.data.type, ctx.label)
                            if mini_icon then return mini_hl end
                        end
                        return ctx.kind_hl
                    end
                },

                -- define what kind of completion line this is
                kind = {
                    highlight = function(ctx)
                        if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                            local mini_icon, mini_hl = require 'mini.icons'
                                .get_icon(ctx.item.data.type, ctx.label)
                            if mini_icon then return mini_hl end
                        end
                        return ctx.kind_hl
                    end
                }
            }
        } }
    },

    -- tweaking keymap to ensure acceptance at the right time
    keymap = {
        -- no default keymap on that one
        preset = 'none',
        -- new keybinds to ensure old behavior from coq.nvim
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' }
    }
}
