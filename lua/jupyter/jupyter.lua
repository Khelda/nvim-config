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
    -- TODO
end
