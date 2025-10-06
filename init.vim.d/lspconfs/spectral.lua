-- Spectral LSP config for JSON/YAML/TOML

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('spectral', {
    cmd = nix:shell("spectral-language-server", {
        "spectral-language-server", "--stdio"
    }),
    filetypes = {
        "yaml", "yml", "json", "toml",
        "gr" -- custom graph type for merise_dot
    },
    root_markers = {
        ".spectral.yaml", ".spectral.yml", ".spectral.json", ".spectral.js"
    },
    settings = {
        enable = true,
        run = 'onType',
        validateLanguages = { 'yaml', 'json', 'yml', 'toml' }
    }
})

-- Enabling LSP
vim.lsp.enable('spectral')
