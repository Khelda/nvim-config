-- Shell LSP checking

require 'nix'
local nix = Nix:new()

-- Bash LSP config
vim.lsp.config("bashls", {
    cmd = nix:shell("bash-language-server", { "bash-language-server", "start" }),
    -- core LSP options
    filetypes = { "bash", "sh" },
    root_markers = { ".git" },
    -- extra settings
    settings = {
        -- glob pattern to parse shell
        bashIde = { vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)" }
    }
})

-- ZSH LSP config
vim.lsp.config("zshcs", {
    cmd = nix:shell("zshcs", { "zshcs" }),
    -- core LSP options
    filetypes = { "zsh" },
    root_markers = { ".git" },
    -- extra options
    settings = {
        zshcs = {
            experimental = {
                definition = true,
                diagnostics = true,
                hover = true,
                symbols = true
            }
        }
    }
})

-- Enabling LSPs
vim.lsp.enable("bashls")
vim.lsp.enable("zshcs")
