-- VimScript lsp settings

require 'nix'
local nix = Nix:new()

-- LSP config
vim.lsp.config('vimls', {
    cmd = nix:shell('vim-language-server', { 'vim-language-server', '--stdio' }),
    filetypes = { 'vim' },
    root_markers = { '.git' }
})

-- Enabling config
vim.lsp.enable('vimls')
