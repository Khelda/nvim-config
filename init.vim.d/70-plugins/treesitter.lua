-- TreeSitter settings and setup

require 'nix'
local nix = Nix:new()

-- General config
require 'nvim-treesitter.config'.setup {
    ensure_installed = {
        "c", "dot", "lua", "vim", "vimdoc", "query", "comment",
        "python", "markdown", "markdown_inline", "rust"
    },

    highlight = {
        enable = true,
        disable = {
            "c", "cpp", "pandoc", "rust",
            "markdown", "markdown_inline", "java"
        }
    }
}

-- registering languages
vim.treesitter.language.register('c', 'c.doxygen')
vim.treesitter.language.register('cpp', 'cpp.doxygen')
vim.treesitter.language.register('cuda', 'cuda.doxygen')

-- TreeSitter Context
require 'treesitter-context'.setup {
    enable = true,
    mode = 'cursor',
    max_lines = 10
}
