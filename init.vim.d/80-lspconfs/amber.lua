-- Amber language server configuration

local util = require 'lspconfig/util'

-- LSP settings
vim.lsp.config("amber-lsp", {
    cmd = { "amber-lsp" },
    filetypes = { "amber" },
    root_dir = util.root_pattern(".git", ".abls")
})

-- enabling LSP
vim.lsp.enable("amber-lsp")
