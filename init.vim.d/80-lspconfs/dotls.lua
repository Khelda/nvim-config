-- Dot graph language server configuration file

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('dotls', {
    cmd = nix:shell("dot-language-server", { "dot-language-server", "--stdio" }),
})

-- Enabling
vim.lsp.enable('dotls')
