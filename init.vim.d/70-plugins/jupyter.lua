-- Jupyter configuration for Neovim

-- configure the plugin
require 'nvim_jupyter'.setup {}

-- pull back Filetree when entering notebook
vim.api.nvim_create_autocmd('VimEnter', {
    pattern = { "*.ipynb" },
    command = "NvimTreeClose"
})
