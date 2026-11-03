-- CI LSP tools

require 'nix'
local nix = Nix:new()

-- extra tools
local cache_dir = vim.uv.os_homedir() .. '/.cache/gitlab-ci-ls/'

-- Gitlab
vim.lsp.config("gitlab-ci-ls", {
    cmd = nix:shell("gitlab-ci-ls", { "gitlab-ci-ls" }),
    -- core LSP options
    filetypes = { "yaml.gitlab" },
    root_markers = { ".git" },
    -- extra hooks
    init_options = {
        cache_path = cache_dir,
        log_path = cache_dir .. '/log/gitlab-ci-ls.log'
    }
})

-- extra LSP for all of these
vim.lsp.config("yamlls", {
    cmd = nix:shell("yaml-language-server", { "yaml-language-server", "--stdio" }),
    -- core LSP options
    filetypes = { "yaml", "yaml.gitlab" },
    root_markers = { ".git" }
})

-- enable LSPs
vim.lsp.enable("gitlab-ci-ls")
vim.lsp.enable("yamlls")
