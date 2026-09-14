-- Core REPL behavior for lua

-- module declaration and constants
Jupyter = { term = { chan_id = nil } }

-- extra constants
local CELL_MARKER = "^# %%%%"
local ESC = "\27"

-- Reads the file around the cursor to find out limits of the current cell.
--- @param bufnr integer
--- @return integer, integer
local function get_cell_range(bufnr)
    -- locating stuff
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1] - 1
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    -- reading file above the cursor to find the previous cell (or line 0)
    local start = 0
    for i = cursor_row, 0, -1 do
        if string.match(lines[i + 1], CELL_MARKER) then
            start = i - 1
            break
        end
    end
    -- reading file below the curso to find the next cell (or EOF)
    local finish = #lines - 1
    for i = cursor_row + 1, #lines - 1 do
        if string.match(lines[i + 1], CELL_MARKER) then
            finish = i - 1
            break
        end
    end
    -- found values
    return start, finish
end

-- opens a new terminal

-- Opens ipython and sends in the given message
--- @param message string
local function send_line(message)
    -- failsafe check
    if Jupyter.term.chan_id ~= nil then return end
    -- spawn ipython
end

-- Sends the current Jupyter cell to the REPL for interpretation
function Jupyter:send_cell()
    local bufnr = vim.api.nvim_get_current_buf()
    local start, finish = get_cell_range(bufnr)
    send_line(
        ESC .. "[200~" ..
        table.concat(
            vim.api.nvim_buf_get_lines(bufnr, start, finish + 1, false), "\n")
        .. ESC .. "[201~")
end
