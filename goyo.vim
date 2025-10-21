" The Vim-Goyo config.

if ! exists("g:configLoaded")
    " Note: The line below loads all files in the "goyo.vim.d" directory.
    runtime! goyo.vim.d/*.vim
    runtime! goyo.vim.d/*.lua

    " Loading plugins
    runtime! goyo.vim.d/70-plugins/*.lua

    " Loading LSPs
    runtime! goyo.vim.d/80-lspconfs/*.lua

    " Finish loading config
    let g:configLoaded = 1
endif
