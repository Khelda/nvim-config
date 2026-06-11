" Shortcut to call Haskell REPL on current file
command GHCi bot split | term ghci %

" Quicker shell access
command Shell terminal

" Shortcut to call Jupyter console
command -nargs=1 I call JupyterConsole(<f-args>)

" Access to jupyter REPL modules
function JupyterConsole(kernel)
    let jupyCommand = 'jupyter console --kernel '.a:kernel
    bot split
    execute "term" l:jupyCommand
endfunction

" LSP integration
command LFormat     lua vim.lsp.buf.formatting()
command LActions    lua vim.lsp.buf.code_action()
command LPrefetch   lua nixsh_prefetch()

" Coq LSP
command CoqPanel    lua require('coq-lsp').panels()

let g:_laf_next_state=1
" Toggle formatting upon exiting Insert mode
command LAutoFormatEnable   call SetLAutoFormat(1)
command LAutoFormatDisable  call SetLAutoFormat(0)
command LAutoFormatToggle   call SetLAutoFormat(g:_laf_next_state)

" AutoFormatting function, this will just call lsp formatter
function SetLAutoFormat(state)
    if a:state == 0
        autocmd! laf
        let g:_laf_next_state=1
        echo 'Disabled auto-formatter.'
    else
        augroup laf
            autocmd InsertLeave * lua vim.lsp.buf.format()
        augroup END
        let g:_laf_next_state=0
        echo 'Enabled auto-formatter.'
    endif
endfunction

" STFU command
command W w
command QA qa
