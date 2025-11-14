-- Lua LSP setup

require 'nix'
local nix = Nix:new()

-- Luals setup
vim.lsp.config('lua_ls', {
    cmd = nix:shell('lua-language-server', { "lua-language-server" }),
    root_markers = { '.git' }, -- no need for luarocks as of now
    settings = {
        Lua = {
            runtime = 'LuaJIT',
            -- adding default libraries
            workspace = {
                checkThirdParty = false,
                -- Just ensuring the LSP knows what Neovim is
                library = { vim.env.VIMRUNTIME }
            }
        }
    }
})

-- Enabling LSP
vim.lsp.enable("lua_ls")
