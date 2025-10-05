-- Assembly language server configuration

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('asm_lsp', {
    cmd = nix:shell("asm-lsp", { "asm-lsp" })
})

-- Enabling config
vim.lsp.enable('asm_lsp')
