-- Eslint LSP setup (as well as Prettier)

require 'nix'
local nix = Nix:new()

-- extra imports
local util = require 'lspconfig/util'

-- core LSP config for typescript and javascript
vim.lsp.config("ts_ls", {
    cmd = nix:shell("typescript-language-server", {
        "typescript-language-server", "--stdio"
    }),
    -- core LSP options
    filetypes = {
        "javascript", "javascriptreact",
        "typescript", "typescriptreact"
    },
    -- project pre-launch hooks
    root_dir = function(bufnr, on_dir)
        -- which files to look for
        local root_markers = { "package-lock.json", "yarn.lock" }
        -- fetch root info for Nvim
        local project_root = vim.fs.root(bufnr, root_markers)
        on_dir(project_root or vim.fn.getcwd())
    end
    -- TODO check for handlers shennanigans
    -- TODO check if extra LSP commands are necessary
})

-- more advanced Eslint LSP configuration
vim.lsp.config("eslint", {
    -- launch command
    cmd = nix:shell("vscode-langservers-extracted", {
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
