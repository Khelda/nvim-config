-- Eslint LSP setup (as well as Prettier)

require 'nix'
local nix = Nix:new()

-- extra imports
local util = require 'lspconfig/util'

-- core LSP config
vim.lsp.config("ts_ls", {
    cmd = nix:shell("nodePackages.typescript-language-server", {
        "typescript-language-server", "--stdio"
    })
})

-- more advanced Eslint LSP configuration
vim.lsp.config("eslint", {
    -- launch command
    cmd = nix:shell("nodePackages.vscode-langservers-extracted", {
        "vscode-eslint-language-server", "--stdio"
    }),
    -- file and directory markers
    filetypes = {
        "javascript", "javascriptreact",
        "typescript", "typescriptreact"
    },
    root_dir = util.root_pattern(".git", ".estls"),
    -- extra settings
    settings = {
        codeAction = { showDocumentation = { enable = true } },
        format = true,
        useESlintClass = false,
        workingDirectory = { mode = "location" },
        run = "onType"
    }
})

-- LSP launch
vim.lsp.enable("eslint")
vim.lsp.enable("ts_ls")
