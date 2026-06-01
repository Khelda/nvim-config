-- Docker LSP utilities

require 'nix'
local nix = Nix:new()

-- core LSP setup
vim.lsp.config("docker-langserver", {
    cmd = nix:shell("dockerfile-language-server", {
        "docker-langserver", "--stdio"
    }),
    -- core LSP options
    filetypes = { "dockerfile" },
    root_markers = { "Dockerfile" }
})

-- extra language server tooling
vim.lsp.config("dockerlsp", {
    cmd = nix:shell("docker-language-server", {
        "docker-language-server", "start", "--stdio"
    }),
    -- core LSP options
    filetypes = { "dockerfile", "yaml.docker-compose" },
    root_markers = { "Dockerfile", "docker-compose.yaml", "docker-compose.yml" },
    -- extra LSP options
    telemetry = "off"
})

-- Launch LSPs
vim.lsp.enable("docker-langserver")
vim.lsp.enable("dockerlsp")
