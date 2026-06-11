-- Shell LSP checking

require 'nix'
local nix = Nix:new()

-- LSP config
vim.lsp.config("shls", {
    cmd = nix:shell("bash-language-server", { "bash-language-server", "start" }),
    -- core LSP options
    filetypes = { "bash", "sh" },
    root_markers = { ".git" },
    -- extra settings
    settings = {
        -- glob pattern to parse shell
        bashIde = { vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)" }
    }
})
