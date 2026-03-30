--
-- Blink.cmp configuration for completion purposes and snippets
--

-- utility function
local function icon_info(ctx)
    local is_unknown_type = vim.tbl_contains({
        "link", "socket", "fifo", "char", "block", "unknown"
    }, ctx.item.data.type)
    local mini_icon, mini_hl = require 'mini.ixons'.get(
        is_unknown_type and "os" or ctx.item.data.type,
        is_unknown_type and "" or ctx.label
    )
    return mini_icon, mini_hl
end

-- completion config
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
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        -- menu auto-popup settings
        menu = {
            auto_show = true,
            auto_show_delay_ms = 200,
            -- display tweaks
            draw = { components = { kind_icon = {
                text = function(ctx)
                    if ctx.source_name ~= "Path" then
                        return require 'lspkind'.symbol_map[ctx.kind]
                            or { "" .. ctx.icon_gap }
                    end
                    local mini_icon, _ = icon_info(ctx)
                    -- writup
                    return (mini_icon or ctx.kind_icon) .. ctx.icon_gap
                end,

                highlight = function(ctx)
                    if ctx.source_name ~= "Path" then return ctx.kind_hl end
                    -- fetch correct icon info
                    local mini_icon, mini_hl = icon_info(ctx)
                    -- writup
                    return mini_icon ~= nil and mini_hl or ctx.kind_hl
                end
            } } }
        }
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
        ['<Esc>'] = { 'cancel', 'fallback' } -- old behavior
    }
}
