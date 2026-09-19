-- Core REPL behavior for lua

-- module declaration and constants
Jupyter = {
    term = {
        chan_id = nil,
        win_id = nil,
        buf_id = nil
    }
}

-- extra constants
local CELL_MARKER = "^# %%%%"
local MARKDOWN_MARKER = "[MARKDOWN]"
local ESC = "\27"
local OPENING = "[200~"
local ENDING = "[201~"
local NEWLINE = "\r\r"

-- Reads the file around the cursor to find out limits of the current cell.
--- @param bufnr integer
--- @return integer, integer
local function get_cell_range(bufnr)
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

-- Searches the current cell for markdown marker
--- @param bufnr integer
--- @param start integer
--- @return boolean
local function check_markdown(bufnr, start)
    local line = table.concat(
        vim.api.nvim_buf_get_lines(bufnr, start, start + 1, false),
        "\n") -- to ensure a single string
    return string.match(line, MARKDOWN_MARKER)
end

-- Builds a new buffer window for interpretation purposes
--- @param origin integer
--- @return integer|nil
local function mk_win(origin)
    local bufnr = vim.api.nvim_create_buf(true, true)
    Jupyter.term.buf_id = bufnr
    -- dimensions check
    local win = vim.api.nvim_get_current_win()
    local width = vim.api.nvim_win_get_width(win)
    -- check if there is place to split
    if vim.api.nvim_win_get_height(win) < 60 then
        vim.api.nvim_buf_delete(bufnr, { force = true })
        Jupyter.term.buf_id = nil
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
local function mk_shell()
    if Jupyter.term.chan_id ~= nil then return end
    local origin = vim.api.nvim_get_current_win()
    Jupyter.term.win_id = mk_win(origin)
    -- spawn ipython
    Jupyter.term.chan_id = vim.fn.jobstart("ipython", {
        term = true,
        on_exit = function()
            Jupyter.term.chan_id = nil
            Jupyter.term.win_id = nil
            Jupyter.term.buf_id = nil
        end
    })
    -- FIXME ensuring ipython is launched
    local init = vim.wait(5000, function()
        local lines = vim.api.nvim_buf_get_lines(Jupyter.term.buf_id, 0, -1, false)
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
local function send_line(message)
    -- failsafe check
    if Jupyter.term.chan_id == nil then mk_shell() end
    -- send the actual message to the new terminal
    local msg_str = ESC .. OPENING .. message .. ESC .. ENDING
    vim.api.nvim_chan_send(Jupyter.term.chan_id, msg_str)
    -- execute the line we just sent
    vim.wait(20) -- milis
    vim.api.nvim_chan_send(Jupyter.term.chan_id, NEWLINE)
end

-- Sends the current Jupyter cell to the REPL for interpretation
function Jupyter:send_cell()
    local bufnr = vim.api.nvim_get_current_buf()
    local start, finish = get_cell_range(bufnr)
    -- markdown check
    if check_markdown(bufnr, start) then
        vim.notify("Jupyter: Markdown cell, no execution", "error")
        return -- failsafe to avoid polluting the execution
    end
    -- execute the cell
    send_line(table.concat(
        vim.api.nvim_buf_get_lines(bufnr, start, finish + 1, false), "\n"))
end
