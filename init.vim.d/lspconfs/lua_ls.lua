-- Lua LSP config file

require 'nix'
local nix = Nix:new()

-- Config definition
vim.lsp.config('lua_ls', {
    cmd = nix:shell("lua-language-server", { "lua-language-server" }),
    -- Normally, no need to check for filetypes
    on_init = function(client)
        workspace = {
            checkThirdParty = false,
            library = {
                vim.api.nvim_get_runtime_file("", true)
                -- vim runtime awareness, no need for more right now
            }
        }
    end
})

-- Enabling the configuration
vim.lsp.enable("lua_ls")
