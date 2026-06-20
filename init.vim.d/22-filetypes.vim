" Filetype swaps while opening
autocmd BufEnter *.c                    set ft=c.doxygen
autocmd BufEnter *.cc                   set ft=cpp.doxygen
autocmd BufEnter *.h                    set ft=cpp.doxygen

" Packaging and bundling filetypes
autocmd BufEnter *.service.in           set ft=conf
autocmd BufEnter docker-compose.yaml    set ft=yaml.docker-compose
autocmd BufEnter docker-compose.yml     set ft=yaml.docker-compose

" UML filetype swaps at buffer opening
autocmd BufEnter *.iuml                 set ft=plantuml
autocmd BufEnter *.plantuml             set ft=plantuml

" Common config filetypes
autocmd BufEnter */git/config           set ft=gitconfig

" LaTeX utilities
autocmd BufEnter *.tex                  set ft=tex
autocmd BufEnter *.sty                  set ft=tex
autocmd BufEnter *.toc                  set ft=tex
