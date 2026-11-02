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

-- extra LSP setup for compose
vim.lsp.config("docker-compose-langserver", {
    cmd = nix:shell("docker-compose-language-service", {
        "docker-compose-langserver", "--stdio"
    }),
    -- core LSP options
    filetypes = { "yaml.docker-compose" },
    root_markers = {
        "docker-compose.yaml", "docker-compose.yml",
        "compose.yaml", "compose.yml"
    }
})

-- Launch LSPs
vim.lsp.enable("docker-langserver")
vim.lsp.enable("docker-compose-langserver")
