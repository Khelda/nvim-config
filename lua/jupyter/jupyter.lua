-- Core REPL behavior for lua
require 'jupyter.jutils'

-- module declaration and constants
Jupyter = {}

-- Sends the current Jupyter cell to the REPL for interpretation
function Jupyter:send_cell()
    local bufnr = vim.api.nvim_get_current_buf()
    local start, finish = Jutils:get_cell_range(bufnr)
    -- markdown check
    if Jutils:check_markdown(bufnr, start) then
        vim.notify("Jupyter: Markdown cell, no execution", "error")
        return -- failsafe to avoid polluting the execution
    end
    -- execute the cell
    Jutils:send_line(table.concat(
        vim.api.nvim_buf_get_lines(bufnr, start, finish + 1, false), "\n"))
end

-- Sends all code cells above the cursor to the REPL for interpretation
function Jupyter:run_above()
    local bufnr = vim.api.nvim_get_current_buf()
    local cells = Jutils:get_cells_above(bufnr)
    -- send cells to REPL
    for i = 0, #cells - 1 do
        local start = cells[i].start
        local finish = cells[i].finish
        print(start .. ", " .. finish)
    end
end
