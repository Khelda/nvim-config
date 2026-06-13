-- Ansible schemas LSP configuration

require 'nix'
local nix = Nix:new()

-- LSP config
vim.lsp.config("ansiblels", {
    cmd = nix:shell("ansible-language-server", {
        "ansible-language-server", "--stdio"
    }),
    -- core LSP options
    filetypes = { "yaml.ansible" },
    root_markers = { "ansible.cfg", ".ansible.lint" },
    -- binary settings
    settings = {
        ansible = {
            ansible = { path = nix:path("ansible", "/bin") },
            validation = {
                enabled = true,
                lint = {
                    enabled = true,
                    path = nix:path("ansible-lint", "/bin")
                }
            }
        }
    }
})

-- activate LSP
vim.lsp.enable("ansiblels")
