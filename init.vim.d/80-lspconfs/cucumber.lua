-- LSP configuration for Cucumber

require 'nix'
local nix = Nix:new()

-- config
vim.lsp.config('cucumber_language_server', {
    cmd = nix:shell('cucumber-language-server', {
        "cucumber-language-server", "--stdio"
    }),
    filetypes = { "cucumber" }
})

-- enabling
vim.lsp.enable('cucumber_language_server')
