-- PHP language server utilities

require 'nix'
local nix = Nix:new()

-- LSP configuration
vim.lsp.config("phpactor", {
    cmd = nix:shell("phpactor", { "phpactor", "language-server" }),
    filetypes = { "php" },
    root_markers = { ".git", "composer.json", ".phpactor.json", ".phpactor.yml" },
    workspace_required = true
})

-- Enabling LSP
vim.lsp.enable("phpactor")
