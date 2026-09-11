-- Database scipt LSPs, all databases are mixed

require 'nix'
local nix = Nix:new()

-- extra imports
local util = require 'lspconfig.util'

-- GraphQL
vim.lsp.config("graphql-lsp", {
    cmd = nix:shell("graphql-language-service-cli", {
        "graphql-lsp", "server", "-m", "-stream"
    }),
    -- core LSP options
    filetypes = { "graphql", "typescriptreact", "javascriptreact" },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(util.root_pattern(
            ".graphqlrc*",
            ".graphql.config.*",
            "graphql.config.*"
        )(fname))
    end
})

-- SQL (no specific flavor)
vim.lsp.config("sqls", {
    cmd = nix:shell("sqls", { "sqls" }),
    -- core LSP options
    filetypes = { "sql", "mysql" },
    root_markers = { "config.yml" }
})

-- enabling LSPs
vim.lsp.enable("graphql-lsp")
vim.lsp.enable("sqls")
