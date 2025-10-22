-- Texlab LSP for LaTeX

require 'nix'
local nix = Nix:new()

-- Configure LSP
vim.lsp.config('texlab', {
    cmd = nix:shell('texlab', { 'texlab' }),
    filetypes = { 'tex', 'plaintex', 'bib' }
})

-- Enabling LSP
vim.lsp.enable('texlab')
