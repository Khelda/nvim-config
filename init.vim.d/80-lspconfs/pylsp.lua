-- Pylsp configuration file

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('pylsp', {
    cmd = nix:shell("python3Packages.python-lsp-server", { "pylsp" }),
    -- core LSP options
    filetypes = { "python" },
    root_markers = { "pyproject.toml", ".git" }
})

-- Enabling config
vim.lsp.enable('pylsp')
