-- Kitty scrollback configuration.
-- This will also setup some shell launching shennanigans.

-- extra constants
local min_height = 60
local min_width = 200
local forbidden_bufs = { "NvimTree_1" }

-- scrollback call for inner shell
require 'kitty-scrollback'.setup()
require 'utils'

-- extra check to see if we're in a filetree. Returns true if a match is found..
--- @param bufnr integer
--- @return boolean
local function check_filetree(bufnr)
    local name = split(vim.api.nvim_buf_get_name(bufnr), "/")
    -- check obtained name against the forbiddn buffers list
    for _, buf in pairs(forbidden_bufs) do
        if name[#name] == buf then
            return true
        end
    end
    return false
end

-- Shell split buffer function
function _G.shell_buffer()
    local bufnr = vim.api.nvim_get_current_buf()
    -- fetch window information
    local width = vim.api.nvim_win_get_width(0)
    local height = vim.api.nvim_win_get_height(0)
    -- TODO buffer pre-check
    if check_filetree(bufnr) or height < min_height then
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

-- Splits for configuration launcher scripts specifically
function _G.script_buffer()
    local bufnr = vim.api.nvim_get_current_buf()
    -- fetch window information
    if check_filetree(bufnr) then
        return -- aberration
    end
    -- open the new buffer
    vim.api.nvim_open_win(bufnr, true, { win = 0, split = "below", height = 10 })
    -- change buffer to new file
    local name = split(vim.api.nvim_buf_get_name(bufnr), "/")
    vim.cmd("edit " .. launcher_name(name[#name]))
end
