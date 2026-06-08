" Load any previously loaded places
function! s:recentsStrategy()
    if system("which -p zoxide 2>/dev/null|| echo Missing") == 'Missing'
        return 'files'
    else
        return function('s:zoxideBookmarks')
    endif
endfunction

" Loads marked places
function! s:zoxideBookmarks()
    let bookmarks = systemlist("zoxide query -l")[0:9]
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
    \ { 'type': s:recentsStrategy(),  'header': ['    Recents'] },
    \ { 'type': 'dir',      'header': ['    Recents in '.getcwd()]  },
    \ { 'type': 'sessions', 'header': ['    Sessions']              },
    \ { 'type': 'bookmarks','header': ['    Bookmarks']             },
    \ { 'type': 'commands', 'header': ['    Commands']              },
    \]

" Filetype swaps while opening
autocmd BufEnter *.h                    set ft=c.doxygen
autocmd BufEnter *.c                    set ft=c.doxygen
autocmd BufEnter *.service.in           set ft=conf
autocmd BufEnter docker-compose.yaml    set ft=yaml.docker-compose
autocmd BufEnter docker-compose.yml     set ft=yaml.docker-compose

" UML filetype swaps at buffer opening
autocmd BufEnter *.iuml                 set ft=plantuml
autocmd BufEnter *.plantuml             set ft=plantuml
