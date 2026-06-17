-- Kitty scrollback configuration.
-- This will also setup some shell launching shennanigans.

-- extra constants
local min_height = 60
local min_width = 200

-- scrollback call for inner shell
require 'kitty-scrollback'.setup()

-- Shell split buffer function
function _G.shell_buffer()
    -- fetch current buffer
    local bufnr = vim.api.nvim_get_current_buf()
    -- fetch window information
    local window = vim.api.nvim_get_current_win()
    local width = vim.api.nvim_win_get_width(window)
    local height = vim.api.nvim_win_get_height(window)

    -- pre-check for height
    if height < min_height then
        return -- starting window is too small
    end

    -- width check for an extra split
    if width > min_width then
        -- extra window space
        vim.api.nvim_open_win(bufnr, true, { win = 0, split = "right" })
    end
    -- building extra window with a terminal
    vim.api.nvim_open_win(bufnr, true, { win = 0, split = "below", height = 30 })
    vim.cmd("terminal")
end
