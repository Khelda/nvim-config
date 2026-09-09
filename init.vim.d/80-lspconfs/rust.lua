-- Rust-analyzer launch

require 'nix'
local nix = Nix:new()

-- Auxiliaries
vim.lsp.config('rust-analyzer', {
    cmd = nix:shell("rust-analyzer", { "rust-analyzer" }),
    -- core LSP options
    filetypes = { "rust" },
    root_markers = { ".git", "Cargo.toml" },
    -- extra settings for LSP
    settings = {
        ["rust-analyzer"] = {
            lens = {
                debug = { enable = true },
                enable = true,
                implementations = { enable = true },
                references = {
                    adt = { enable = true },
                    enumVariant = { enable = true },
                    method = { enable = true },
                    trait = { enable = true }
                },
                run = { enable = true },
                updateTest = { enable = true }
            }
        }
    }
})

-- Enabling LSP
vim.lsp.enable('rust_analyzer')
