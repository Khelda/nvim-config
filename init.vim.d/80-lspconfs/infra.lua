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

-- Terraform LSP config
vim.lsp.config("terraform-ls", {
    cmd = nix:shell("terraform-ls", { "terraform-ls", "serve" }),
    -- core LSP options
    filetypes = { "terraform", "tf", "hcl" },
    root_markers = { ".terraform", ".git" },
    -- extra settings
    capabilities = {
        experimental = { showReferencesCommandId = "client.showReferences" }
    },
    -- enable codelens for Nvim
    on_attach = function(_, bufnr)
        vim.lsp.codelens.enable(true, { bufnr = bufnr })
    end
})

-- Enabling
vim.lsp.enable('nil_ls')
vim.lsp.enable('terraform-ls')
