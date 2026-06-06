-- CSS LSP configuration file

require 'nix'
local nix = Nix:new()

-- Configure LSP
vim.lsp.config('cssls', {
    cmd = nix:shell("vscode-langservers-extracted", {
        "vscode-css-language-server", "--stdio"
    }),
    filetypes = { "css", "scss" },
    -- attach options
    init_options = { provideFormatter = true },
    root_markers = { "package.json", ".git" },
    -- launch settings
    settings = {
        css = { validate = true },
        scss = { validate = true }
    }
})

-- Enable config
vim.lsp.enable('cssls')
