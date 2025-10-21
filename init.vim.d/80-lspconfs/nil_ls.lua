-- Nixd configuration file

require 'nix'
local nix = Nix:new()

-- Configurig nil_ls language server
vim.lsp.config('nil_ls', {
    cmd = nix:shell('nil', { 'nil' }),
    -- file discrimination
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', '.git' },
    -- extra settings
    settings = {
        nil_ls = {
            formatter = {
                command = { nix:shell('nixpkpgs-fmt', { 'nixpkgs-fmt' }) }
            }
        }
    }
})

-- Enabling
vim.lsp.enable('nil_ls')
