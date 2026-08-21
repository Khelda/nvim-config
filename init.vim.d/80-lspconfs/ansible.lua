-- Ansible schemas toolchain

require 'nix'
local nix = Nix:new()

-- bundling requirements
vim.env["PATH"] = vim.env["PATH"]
    .. ":" .. nix:path("ansible", "/bin")
    .. ":" .. nix:path("ansible-lint", "/bin")

-- LSP config
vim.lsp.config("ansible-language-server", {
    cmd = nix:shell("ansible-language-server", {
        "ansible-language-server", "--stdio"
    }),
    -- core LSP options
    filetypes = { "yaml.ansible" },
    root_markers = { ".git", "ansible.cfg", ".ansible-lint" },
    -- specific options
    settings = {
        ansible = {
            -- binaries fetching
            python = { interpreterPath = "python" },
            ansible = { path = "ansible" },
            -- env tweaks
            executionEnvironment = { enable = false },
            -- lint settings
            validation = {
                enabled = true,
                lint = { enabled = true, path = "ansible-lint" }
            }
        }
    }
})

-- TODO launch language server
vim.lsp.enable("ansible-language-server")
