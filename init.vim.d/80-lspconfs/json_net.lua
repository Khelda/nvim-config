-- JSonnet LSP configuration file (and it's older brother)

require 'nix'
local nix = Nix:new()

-- JSonnet LSP configuration
vim.lsp.config('jsonnet_ls', {
    cmd = nix:shell('jsonnet-language-server', { 'jsonnet-language-server' }),
    -- core LSP options
    filetypes = { 'jsonnet', 'libsonnet' },
    root_markers = { 'jsonnetfile.json', '.git' }
})

-- JSON and JSONC language server
vim.lsp.config("json_ls", {
    cmd = nix:shell("nodePackages.vscode-langservers-extracted", {
        "vscode-json-language-server", "--stdio"
    }),
    -- core LSP options
    filetypes = { "json", "jsonc" },
    root_markers = { ".git" },
    -- extra options
    init_options = { provideFormatter = true }
})

-- enabling LSP
vim.lsp.enable('jsonnet_ls')
vim.lsp.enable("json_ls")
