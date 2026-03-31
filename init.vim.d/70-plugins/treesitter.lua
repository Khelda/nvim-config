--
-- TreeSitter settings and setup
--

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

-- Amber treesitter context wrapper
vim.api.nvim_create_autocmd("User", {
    pattern = "TSUpdate",
    callback = function()
        require 'nvim-treesitter.parsers'.amber = {
            install_info = {
                url = "https://github.com/amber-lang/tree-sitter-amber.git",
                files = { "src/parser.c" },
                branch = "main",
                generate_requires_npm = false,
                requires_generate_from_grammar = false
            }
        }
    end
})

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
