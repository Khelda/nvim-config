if v:progname == "goyo" || exists("g:startgoyo")
    runtime! goyo.vim
elseif ! exists("g:configLoaded")
    set guifont="Fira Code:h10"

    " Note: The line below loads all files in the 'init.vim.d' directory.
    runtime! init.vim.d/*.vim
    runtime! init.vim.d/*.lua
    " loading plugins
    runtime! init.vim.d/70-plugins/*.lua
    " loading language servers
    runtime! init.vim.d/80-lspconfs/*.lua
    " Finish config loading
    let g:configLoaded = 1
endif
