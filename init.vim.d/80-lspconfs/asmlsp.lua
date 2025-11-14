-- Assembly language server configuration

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('asm_lsp', {
    cmd = nix:shell("asm-lsp", { "asm-lsp" }),
    -- launch information
    filetypes = { 'asm', 'vmasm', 's' },
    root_markers = { '.asm-lsp.toml', '.pic.asm' }
})

-- Enabling config
vim.lsp.enable('asm_lsp')
