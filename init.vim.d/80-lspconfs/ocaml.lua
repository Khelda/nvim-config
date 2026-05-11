-- OCAML language server configuration

require 'nix'
local nix = Nix:new()

-- root_markers collections
local dune_mrks = { "dune-project", "dune-workspace" }
local opam_mrks = { "*.opam", "opam", "esy.json", "package.json" }
local git_mrks = { ".git" }

-- LSP configuration
vim.lsp.config("ocamllsp", {
    cmd = nix:shell("ocamlPackages.ocaml-lsp", { "ocamllsp" }),
    cmd_env = { OCAMLLSP_SEMANTIC_HIGHLIGHTING = "full/delta" },
    -- core options
    filetypes = { "ocaml", "menhir", "ocamlinterface", "ocamllex" },
    root_markers = vim.fn.has("nvim-0.11.3") == 1
        and { dune_mrks, opam_mrks, git_mrks }
        or vim.list_extend(vim.list_extend(dune_mrks, opam_mrks), git_mrks)
})

-- Enabling LSP
vim.lsp.enable("ocamllsp")
