set title

filetype plugin on
syntax on
set mouse=a

" Line information settings
set linebreak
set breakindent
set breakindentopt=shift:2
set autoread

" Line number utilities
set number
set cursorline
set cursorlineopt=number
set number numberwidth=3 " Four digits maximum

" Fold shennanigans, we don't want them by default
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99
set conceallevel=3

set completeopt-=preview

set list
set listchars=tab:⇥\ ,trail:␣,nbsp:⍽

set fillchars=eob:\ ,vert:▎,fold:,foldclose:,foldopen:,foldsep:░

" Ensure Neovim doesn't make a fuss about language spelling
autocmd VimEnter * set nospell
