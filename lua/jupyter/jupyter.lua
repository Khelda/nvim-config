-- Core REPL behavior for lua
require 'jupyter.repl'
require 'jupyter.cells'

-- module declaration and constants
Jupyter = {}

-- Sends the current Jupyter cell to the REPL for interpretation
function Jupyter:send_cell()
    local bufnr = vim.api.nvim_get_current_buf()
    local start, finish = Cells:get_current(bufnr)
    -- check cell for markdown
    local content = vim.api.nvim_buf_get_lines(bufnr, start, finish, false)
    if Cells:check_md(content) then
        vim.notify("Found Markdown, no execution", vim.log.levels.WARN)
        return
    end
    -- send cell to REPL
    Repl:send_line(table.concat(content, "\n"))
end

-- Sends all code cells above the cursor to the REPL for interpretation
function Jupyter:run_above()
    local bufnr = vim.api.nvim_get_current_buf()
    local cells = Cells:get_above(bufnr)
    -- check cells for markdown and send
    for i = 1, #cells do
        local content = vim.api.nvim_buf_get_lines(
            bufnr,
            cells[i].start,
            cells[i].finish,
            false)
        -- execute cell
        if not Cells:check_md(content) then
            Repl:send_line(table.concat(content, "\n"))
            vim.wait(20)
        end
    end
end

-- Closes the current ipython shell and reloads it from the last position
function Jupyter:restart()
    if Repl:close_shell() ~= 0 then
        vim.notify("Couldn't close ipython shell", vim.log.levels.ERROR)
        return
    end
    -- reload all existing cells
    Jupyter:run_above()
end
