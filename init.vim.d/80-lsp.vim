"
" LSP configurations launcher. Since we will need to split everything in
" multiple files, we're loading the entirety of ./lspconfs/ at once.
"

runtime! init.vim.d/lspconfs/*.lua
