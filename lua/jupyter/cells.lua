-- Jupyter cells parsing module
Cells = {}

-- constants
local CELL_MARKER = "^# %%%%"
local MARKDOWN_MARKER = "MARKDOWN"

-- Checks the given cell content for markdown remnants
--- @param lines table
--- @return boolean
function Cells:check_md(lines)
    return false
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
