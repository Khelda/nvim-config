-- Repl communication submodule
Repl = {
    buf_id = nil,
    chan_id = nil,
    win_id = nil
}

-- constants
local MIN_HEIGHT = 60
local MIN_WIDTH = 200
local TIMEOUT = 5000
local ESC = "\27"
local OPENING = "[200~"
local ENDING = "[201~"
local NEWLINE = "\r\r"

-- Builds a new buffer window for ipython
--- @param origin integer
--- @return integer|nil
local function mk_win(origin)
    local bufnr = vim.api.nvim_create_buf(false, true)
    Repl.buf_id = bufnr
    -- dimensions check
    local win = vim.api.nvim_get_current_win()
    local width = vim.api.nvim_win_get_width(win)
    -- split checks
    if vim.api.nvim_win_get_height(win) < MIN_HEIGHT then
        vim.api.nvim_buf_delete(bufnr, { force = true })
        Repl.buf_id = nil
        return nil
    end
    -- build the actual window
    return vim.api.nvim_open_win(bufnr, true, {
        win = origin,
        split = (function()
            if width < MIN_WIDTH then
                return "below"
            else
                return "right"
            end
        end)()
    })
end

-- builds a new shell for ipython
local function mk_shell()
    if Repl.chan_id ~= nil then return end
    -- build shell window
    local origin = vim.api.nvim_get_current_win()
    Repl.win_id = mk_win(origin)
    -- spawn ipython in there
    Repl.chan_id = vim.fn.jobstart("ipython", {
        term = true,
        on_exit = function()
            Repl.buf_id = nil
            Repl.chan_id = nil
            Repl.win_id = nil
        end
    })
    -- ensuring python is launched
    local init = vim.wait(TIMEOUT, function()
        local lines = vim.api.nvim_buf_get_lines(Repl.buf_id, 0, -1, false)
        return #lines > 0 and lines[1] ~= ""
    end)
    if not init then
        vim.notify("Couldn't launch ipython", vim.log.levels.ERROR)
    end
    -- fallback to regular window
    vim.api.nvim_set_current_win(origin)
end

-- Sends the given line of code into its Repl.
--- @param line string
function Repl:send_line(line)
    if Repl.chan_id == nil then mk_shell() end
    -- send the actual message
    local msg_str = ESC .. OPENING .. line .. ESC .. ENDING
    vim.api.nvim_chan_send(Repl.chan_id, msg_str)
    -- execute the line we just sent
    vim.wait(20)
    vim.api.nvim_chan_send(Repl.chan_id, NEWLINE)
end

-- Closes the opened window, shell buffer and channel.
-- Returns 0 if everything went as planned.
--- @return integer
function Repl:close_shell()
    if Repl.chan_id == nil then return -1 end
    -- TODO close for existing shell
    vim.api.nvim_win_close(Repl.win_id, true)
    Repl.buf_id = nil
    Repl.chan_id = nil
    Repl.win_id = nil
    return 0
end
