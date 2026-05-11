-- Haskell language server configuration

require 'nix'
local nix = Nix:new()
local util = require 'lspconfig/util'

-- Configure LSP
vim.lsp.config("hls", {
    cmd = nix:shell("haskell-language-server", { "haskell-language-server" }),
    -- core options
    filetypes = { "haskell", "lhaskell" },
    root_dir = util.root_pattern(
        "hie.yaml", "stack.yaml", "package.yaml",
        "cabal.project", "*.cabal"
    ),
    -- extra settings
    settings = {
        haskell = {
            formattingProvider = "ormolu",
            cabalFormattingProvider = "cabal-fmt"
        }
    }
})

-- Enabling LSP
vim.lsp.enable("hls")
