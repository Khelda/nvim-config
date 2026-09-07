-- Just LSP configuration

require 'nix'
local nix = Nix:new()

-- configure LSP
vim.lsp.config("just-lsp", {
    cmd = nix:shell("just-lsp", { "just-lsp" }),
    filetypes = { "just" },
    root_markers = { ".git" }
})
