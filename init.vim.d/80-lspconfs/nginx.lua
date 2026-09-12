-- NginX LSP configuration file

require 'nix'
local nix = Nix:new()

-- LSP configuration
vim.lsp.config("nginx-language-server", {
    cmd = nix:shell("nginx-language-server", { "nginx-language-server" }),
    -- core LSP options
    filetypes = { "nginx" },
    root_markers = { "nginx.conf", ".git" }
})

-- enable LSP
vim.lsp.enable("nginx-language-server")
