-- TypST language serverconfiguration

require 'nix'
local nix = Nix:new()

-- LSP setup
vim.lsp.config("typst", {
    cmd = nix:shell("tinymist", { "tinymist", "lsp" }),
    -- core LSP options
    filetypes = { "typst" },
    root_markers = { ".git" }
})

-- Launch LSP
vim.lsp.enable("typst")
