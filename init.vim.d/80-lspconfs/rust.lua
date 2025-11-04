-- Rust-analyzer launch

require 'nix'
local nix = Nix:new()

-- Auxiliaries
vim.lsp.config('rust-analyzer', {
    cmd = nix:shell("rust-analyzer", { "rust-analyzer" })
})

-- Enabling LSP
vim.lsp.enable('rust_analyzer')
