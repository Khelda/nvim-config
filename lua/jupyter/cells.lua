-- Jupyter cells parsing module
require 'utils'
Cells = {}

-- constants
local CELL_MARKER = "^# %%%%"
local MARKDOWN_MARKER = "MARKDOWN"

-- Checks the given cell content for markdown remnants
--- @param lines table
--- @return boolean
function Cells:check_md(lines)
    -- check content for empty cell
    if #lines == 0 or #table.concat(lines, "\n") == 0 then
        return true
    end
    -- actual check
    return string.match(lines[1], MARKDOWN_MARKER) ~= nil
end

-- Fetches limits of the current cell
--- @param bufnr integer
--- @return integer, integer
function Cells:get_current(bufnr)
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    -- parse above cursor
    local start = 0
    for i = cursor_row, 0, -1 do
        if string.match(lines[i], CELL_MARKER) then
            start = i - 1
            break
        end
    end
    -- parse below cursor
    local finish = #lines - 1
    for i = cursor_row, #lines do
        if string.match(lines[i], CELL_MARKER) then
            finish = i - 1
            break
        end
    end
    -- found values
    return start, finish
end

-- Fetches the next cell in order in the given direction. Returns only the first
-- line index found in that cell.
--- @param bufnr integer
--- @param dir integer
--- @return integer
function Cells:get_next(bufnr, dir)
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    -- loop through lines
    for i = cursor_row, (function()
        if dir == 1 then
            return #lines
        else
            return 1
        end
    end)(), dir do
        if string.match(lines[i], CELL_MARKER) then
            -- found line number
            return i + dir
        end
    end
    -- failsafe value
    return 0
end

-- Fetches all cells above the cursor, regardless of cell type.
--- @param bufnr integer
--- @return table
function Cells:get_all_above(bufnr)
    local index = {}
    -- locating stuff
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    -- parse cells below
    local mark = #lines - 1
    for i = cursor_row, #lines do
        if string.match(lines[i], CELL_MARKER) then
            mark = i - 1
            break
        end
    end
    -- parsing cells until the top of the notebook
    for i = cursor_row, 1, -1 do
        if string.match(lines[i], CELL_MARKER) then
            table.insert(index, 0, { start = i - 1, finish = mark })
            mark = i - 1
        end
    end
    -- sending back the cells index
    return index
end
