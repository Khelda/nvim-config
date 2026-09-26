-- Jupyter configuration for Neovim

-- configure the plugin
require 'nvim_jupyter'.setup {
    keymaps = {
        run_current_cell = "<leader>jn",
        add_cell_below = "<leader>ji"
    }
}

-- pull back Filetree when entering notebook
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = { "*.ipynb" },
    command = "NvimTreeClose"
})
