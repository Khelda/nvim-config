-- Marksman knowledge base

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('marksman', {
    cmd = nix:shell("marksman", { "marksman", "server" }),
    filetypes = { "markdown", "markdown.mdx", "pandoc" }
})

-- Enabling
vim.lsp.enable('marksman')
