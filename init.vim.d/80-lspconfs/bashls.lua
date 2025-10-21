-- LSP configuration fro both bash and the Z shell.

require 'nix'
local nix = Nix:new()

-- Configure LSP
vim.lsp.config('bashls', {
    cmd = nix:shell('bash-language-server', { 'bash-language-server', 'start' }),
    filetypes = { 'sh', 'zsh' }
})

-- Enabling LSP
vim.lsp.enable('bashls')
