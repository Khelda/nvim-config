-- Arduino language server configuration

require 'nix'
local nix = Nix:new()

-- Other imports
local util = require 'lspconfig.util'

-- Config definition
vim.lsp.config('arduino', {
    cmd = nix:shell("arduino-language-server", { "arduino-language-server" }),
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)
        on_dir(util.root_pattern('*.ino')(fname))
    end,
    -- vim defaults
    capabilities = {
        textDocument = { semanticTokens = vim.NIL },
        workspace = { semanticTokens = vim.NIL }
    }
})

-- Enabling config
