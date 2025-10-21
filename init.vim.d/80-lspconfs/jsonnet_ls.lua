-- JSonnet LSP configuration file

require 'nix'
local nix = Nix:new()

-- LSP configuration
vim.lsp.config('jsonnet_ls', {
    cmd = nix:shell('jsonnet-language-server', { 'jsonnet-language-server' }),
    filetypes = { 'jsonnet', 'libsonnet' },
    root_markers = { 'jsonnetfile.json', '.git' }
})

-- enabling LSP
vim.lsp.enable('jsonnet_ls')
