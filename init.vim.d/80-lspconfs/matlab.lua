-- Matlab LSP configuration

require 'nix'
local nix = Nix:new()

-- LSP configuration
vim.lsp.config("matlab_ls", {
    -- core settings
    cmd = nix:shell("matlab-language-server", {
        'matlab-language-server', '--stdio'
    }),
    filetypes = { "matlab" },
    -- root markers
    root_markers = { '.git', '.matlabls' },
    -- extra settings
    settings = { MATLAB = {} }
})

-- Enable LSP
vim.lsp.enable("matlab_ls")
