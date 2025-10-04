-- Vimcript LSP config

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('vimls', {
    cmd = nix:shell("nodePackages.vim-language-server", {
        "vim-language-server", "--stdio"
    })
})

-- Enabling config
vim.lsp.enable('vimls')
