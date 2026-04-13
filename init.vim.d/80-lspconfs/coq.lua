-- COQ proof toolkit language server config

require 'nix'
local nix = Nix:new()

-- LSP configuration
vim.lsp.config("coq_lsp", {
    cmd = nix:shell("coqPackages.coq-lsp", { "coq-lsp" }),
    -- core settings
    filetypes = { "coq" },
    root_markers = { "_CoqProject", ".git" },
})

-- Enabling LSP
vim.lsp.enable("coq_lsp")
