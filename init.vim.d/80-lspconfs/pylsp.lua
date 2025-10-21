-- Pylsp configuration file

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('pylsp', {
    cmd = nix:shell("python3Packages.python-lsp-server", { "pylsp" })
})

-- Enabling config
vim.lsp.enable('pylsp')
