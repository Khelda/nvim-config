-- Nixd configuration file

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('nixd', {
    cmd = nix:shell("nixd", { "nixd" })
})

-- Enabling
vim.lsp.enable('nixd')
