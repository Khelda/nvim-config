" Set leader to bang
let mapleader = "!"

" Buffer navigation (in BarBar)
nnoremap <silent> bn                    :BufferNext<CR>
nnoremap <silent> bv                    :BufferPrevious<CR>
nnoremap <silent> bd                    :BufferClose<CR>
nnoremap <silent> mbn                   :BufferMoveNext<CR>
nnoremap <silent> mbv                   :BufferMovePrevious<CR>

" CAPSLOCK equivalents (mostly for comfort)
nnoremap <silent> BN                    :BufferNext<CR>
nnoremap <silent> BV                    :BufferPrevious<CR>
nnoremap <silent> BD                    :BufferClose<CR>
nnoremap <silent> MBN                   :BufferMoveNext<CR>
nnoremap <silent> MBV                   :BufferMovePrevious<CR>

" Tabs keybinds
nnoremap <silent> ty                    :tabnext<CR>
nnoremap <silent> tr                    :tabprev<CR>
nnoremap <silent> tn                    :tabnew<CR>

" stfu keybinds
nnoremap <silent> n                     <CR>
nnoremap <silent> <leader>q             :lua require"notify".dismiss()<CR>

" Text deletion keybinds
nnoremap <silent> da                    :1,$d<CR>

" LSP and code helping keybinds
nnoremap <silent> <leader>cD            :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> <leader>cd            :lua vim.lsp.buf.definition()<CR>
nnoremap <silent> µ                     :lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>ci            :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> ?                     :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>mv            :lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>c<left>       :lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> <leader>c<right>      :lua vim.lsp.buf.outgoing_calls()<CR>
nnoremap <silent> <leader>cf            :lua vim.lsp.buf.format()<CR>

" More... Specific keybinds
nnoremap <silent> <leader>yp            :!yapf -i %<CR>
nnoremap <silent> <leader>op            :ColorPickOklch<CR>

" Trouble related keybinds
nnoremap <silent> <leader>!             :Trouble proj_errs toggle<CR>
nnoremap <silent> <leader>?             :lua require "tiny-code-action".code_action()<CR>

" Vista views and folds handling
nnoremap <silent> <leader>tt            :Vista<CR>

" Nvim filetree
nnoremap <silent> <leader>fr            :NvimTreeRefresh<CR>
nnoremap <silent> <leader>ft            :NvimTreeToggle<CR>

nnoremap <silent> <leader>td            :Ags TODO<CR>

" Http helpers
nnoremap <silent> <leader>hw            :Http<CR>

" Git keybinds
nnoremap <silent> <leader>go            :GitConflictChooseOurs<CR>
nnoremap <silent> <leader>gt            :GitConflictChooseTheirs<CR>
nnoremap <silent> <leader>gn            :GitConflictChooseNone<CR>
nnoremap <silent> <leader>gb            :GitConflictChooseBoth<CR>

" Snippets keybinds
inoremap hj <cmd>lua require 'luasnip'.jump(1)<CR>
inoremap hg <cmd>lua require 'luasnip'.jump(-1)<CR>

" Moving between opened buffers
nnoremap <leader><left> <C-W><C-H>
nnoremap <leader><right> <C-W><C-L>
nnoremap <leader><up> <C-W><C-K>
nnoremap <leader><down> <C-W><C-J>

" Little hack to escape insertion mode
inoremap jk <ESC>
tnoremap jk <C-\><C-n>

let g:_lnr_next_state=1
" Line numbering utilities
nnoremap <silent> <leader>la :call SetLineNumbering(0)<CR>
nnoremap <silent> <leader>lr :call SetLineNumbering(1)<CR>
nnoremap <silent> <leader>lt :call SetLineNumbering(g:_lnr_next_state)<CR>

" Utility line numbering function
function SetLineNumbering(state)
    if a:state == 0
        set nornu
        let g:_lnr_next_state=1
        echo 'Absolute line numbering'
    else
        set rnu
        let g:_lnr_next_state=0
        echo 'Relative line numbering'
    endif
endfunction
