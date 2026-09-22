-- Utility module for Jupyter REPL
Jutils = {
    term = {
        chan_id = nil,
        win_id = nil,
        buf_id = nil
    }
}

-- extra constants
local CELL_MARKER = "^# %%%%"
local MARKDOWN_MARKER = "MARKDOWN"
local ESC = "\27"
local OPENING = "[200~"
local ENDING = "[201~"
local NEWLINE = "\r\r"

-- Reads the file around the cursor to find out limits of the current cell.
--- @param bufnr integer
--- @return integer, integer
function Jutils:get_cell_range(bufnr)
    -- locating stuff
    local cursor_row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    -- cached values for parsing
    local start = 0
    local finish = #lines - 1
    -- reading file above the cursor to find the previous cell (or line 0)
    for i = cursor_row, 0, -1 do
        if string.match(lines[i + 1], CELL_MARKER) then
            start = math.max(i - 1, 0) -- failsafe to prevent a -1 starting point
            break
        end
    end
    -- reading file below the curso to find the next cell (or EOF)
    for i = cursor_row + 1, #lines - 1 do
        if string.match(lines[i + 1], CELL_MARKER) then
            finish = i - 1
            break
        end
    end
    -- found values
    return start, finish
end

-- Fetches every cell from the current buffer and returns the index table.
--- @param bufnr integer
--- @return table
function Jutils:get_cells_above(bufnr)
    local index = {}
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    -- fetch current cell
    local mark = 1
    for i = 1, #lines do
        if string.match(lines[i], CELL_MARKER) then
            if string.match(lines[i], MARKDOWN_MARKER) ~= nil then
                print(lines[i] .. "miaouh")
            else
                print(lines[i] .. "truc")
            end
        end
    end
    -- send back the built index
    return index
end

-- Searches the current cell for markdown marker.
-- Returns true if it found markdown.
--- @param bufnr integer
--- @param start integer
--- @return boolean
function Jutils:check_markdown(bufnr, start)
    local line = table.concat(
        vim.api.nvim_buf_get_lines(bufnr, start, start + 1, false),
        "\n") -- to ensure a single string
    return string.match(line, MARKDOWN_MARKER) ~= nil or #line == 0
end

-- Builds a new buffer window for interpretation purposes
--- @param origin integer
--- @return integer|nil
function Jutils:mk_win(origin)
    local bufnr = vim.api.nvim_create_buf(true, true)
    Jutils.term.buf_id = bufnr
    -- dimensions check
    local win = vim.api.nvim_get_current_win()
    local width = vim.api.nvim_win_get_width(win)
    -- check if there is place to split
    if vim.api.nvim_win_get_height(win) < 60 then
        vim.api.nvim_buf_delete(bufnr, { force = true })
        Jutils.term.buf_id = nil
        return nil
    end
    -- build the actual window
    return vim.api.nvim_open_win(bufnr, true, {
        win = origin,
        split = (function()
            if width < 200 then
                return "below"
            else
                return "right"
            end
        end)()
    })
end

-- opens a new terminal
function Jutils:mk_shell()
    if Jutils.term.chan_id ~= nil then return end
    local origin = vim.api.nvim_get_current_win()
    Jutils.term.win_id = Jutils:mk_win(origin)
    -- spawn ipython
    Jutils.term.chan_id = vim.fn.jobstart("ipython", {
        term = true,
        on_exit = function()
            Jutils.term.chan_id = nil
            Jutils.term.win_id = nil
            Jutils.term.buf_id = nil
        end
    })
    -- FIXME ensuring ipython is launched
    local init = vim.wait(5000, function()
        local lines = vim.api.nvim_buf_get_lines(Jutils.term.buf_id, 0, -1, false)
        return #lines > 0 and lines[1] ~= ""
    end)
    if not init then
        vim.notify("Couldn't launch ipython", vim.log.levels.WARN)
    end
    -- fallback to regular window
    vim.api.nvim_set_current_win(origin)
end

-- Opens ipython and sends in the given message
--- @param message string
function Jutils:send_line(message)
    -- failsafe check
    if Jutils.term.chan_id == nil then Jutils:mk_shell() end
    -- send the actual message to the new terminal
    local msg_str = ESC .. OPENING .. message .. ESC .. ENDING
    vim.api.nvim_chan_send(Jutils.term.chan_id, msg_str)
    -- execute the line we just sent
    vim.wait(20) -- milis
    vim.api.nvim_chan_send(Jutils.term.chan_id, NEWLINE)
end
