-- Lua LSP setup

require 'nix'
local nix = Nix:new()

-- Luals setup
vim.lsp.config('lua_ls', {
    cmd = nix:shell('lua-language-server', { "lua-language-server" }),
    on_init = function(client)
        workspace = {
            checkThirdParty = false,
            library = { vim.api.nvim_get_runtime_file('', true) }
        }
        -- just ensure Neovim runtime is known
    end
})

-- Enabling LSP
vim.lsp.enable("lua_ls")
