" AUTHOR: Alessandro Yorba, Kheldae
" This is a modified version of https://github.com/AlessandroYorba/Despacio,
" made to fit my own configuration needs.
"
" In case you may be tempted to use it in your own, this may cause some...
" Issues.

" Core info
let g:colors_name="daeser"
set background=dark

" highlight reset, just in case...
highlight clear
if exists("syntax_on")
    syntax reset
endif

" Common colors
highlight PreProc guifg=#d7875f guibg=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
highlight Function guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Identifier guifg=#fcfcdd guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight Statement guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight Constant guifg=#d78700 guibg=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
highlight Type guifg=#d2bd97 guibg=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
highlight String guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
highlight Special guifg=#daa792 guibg=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
highlight Conditional guifg=#daa792 guibg=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
highlight Operator guifg=#949494 guibg=NONE gui=NONE ctermfg=246 ctermbg=NONE cterm=NONE
highlight Title guifg=#d7875f guibg=NONE gui=NONE ctermfg=173 ctermbg=NONE cterm=NONE
highlight StorageClass guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight htmlItalic guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight htmlEndTag guifg=#dfaf87 guibg=NONE gui=NONE ctermfg=180 ctermbg=NONE cterm=NONE
highlight cssTagName guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight cssClassName guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight cssIdentifier guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE

" VIMSCRIPT
highlight link vimAutoCmdSfxList Type
highlight link vimAutoEventList Identifier
highlight link vimCmdSep Special
highlight link vimCommentTitle SpecialComment
highlight link vimFunction Function
highlight link vimUserFunc Function

" DIFF
highlight DiffAdd guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight DiffText guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight DiffChange guifg=#5f8787 guibg=NONE gui=reverse ctermfg=66 ctermbg=NONE cterm=reverse
highlight DiffDelete guifg=#af5f5f guibg=NONE gui=reverse ctermfg=131 ctermbg=NONE cterm=reverse
highlight link diffAdded DiffAdd
highlight link diffBDiffer WarningMsg
highlight link diffChanged DiffChange
highlight link diffCommon WarningMsg
highlight link diffDiffer WarningMsg
highlight link diffFile Directory
highlight link diffIdentical WarningMsg
highlight link diffIndexLine Number
highlight link diffIsA WarningMsg
highlight link diffNoEOL WarningMsg
highlight link diffOnly WarningMsg
highlight link diffRemoved DiffDelete

" SPELLING
highlight SpellBad guifg=#d75f5f guibg=NONE gui=undercurl ctermfg=167 ctermbg=NONE cterm=undercurl
highlight SpellLocal guifg=#5f875f guibg=NONE gui=undercurl ctermfg=65 ctermbg=NONE cterm=undercurl
highlight SpellCap guifg=#87afff guibg=NONE gui=undercurl ctermfg=111 ctermbg=NONE cterm=undercurl
highlight SpellRare guifg=#ff8700 guibg=NONE gui=undercurl ctermfg=208 ctermbg=NONE cterm=undercurl

"WINDOW UI
highlight MoreMsg guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight SpecialComment guifg=#767676 guibg=NONE gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
highlight VimCommentTitle guifg=#767676 guibg=NONE gui=reverse ctermfg=243 ctermbg=NONE cterm=reverse
highlight Underlined guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
highlight FoldColumn guifg=#87afaf guibg=NONE gui=NONE ctermfg=109 ctermbg=NONE cterm=NONE
highlight Todo guifg=#d78700 guibg=NONE gui=reverse ctermfg=172 ctermbg=NONE cterm=reverse
highlight Visual guifg=#dfaf00 guibg=NONE gui=reverse ctermfg=178 ctermbg=NONE cterm=reverse
highlight Question guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight Search guifg=#dfaf00 guibg=NONE gui=reverse ctermfg=178 ctermbg=NONE cterm=reverse
highlight MatchParen guifg=#87afaf guibg=NONE gui=reverse ctermfg=109 ctermbg=NONE cterm=reverse
highlight Error guifg=#d75f5f guibg=#121212 gui=reverse ctermfg=167 ctermbg=233 cterm=reverse
highlight ErrorMsg guifg=#d75f5f guibg=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
highlight WarningMsg guifg=#ff875f guibg=NONE gui=NONE ctermfg=209 ctermbg=NONE cterm=NONE
highlight netrwExe guifg=#5f8787 guibg=NONE gui=NONE ctermfg=66 ctermbg=NONE cterm=NONE
highlight netrwlist guifg=#daa792 guibg=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
highlight Directory guifg=#af875f guibg=NONE gui=NONE ctermfg=137 ctermbg=NONE cterm=NONE
highlight Cursor guifg=#000000 guibg=#ffffff gui=NONE ctermfg=16 ctermbg=231 cterm=NONE
highlight CursorLineNr guifg=#c6c6c6 guibg=NONE gui=reverse ctermfg=251 ctermbg=NONE cterm=reverse
highlight WildMenu guifg=#c6c6c6 guibg=NONE gui=reverse ctermfg=251 ctermbg=NONE cterm=reverse
highlight ModeMsg guifg=#dfdfdf guibg=NONE gui=NONE ctermfg=188 ctermbg=NONE cterm=NONE
highlight SignColumn guifg=#87af87 guibg=NONE gui=NONE ctermfg=108 ctermbg=NONE cterm=NONE

" COLORS
highlight Normal guifg=#ffffdf guibg=#303030 gui=NONE ctermfg=230 ctermbg=236 cterm=NONE
highlight Comment guifg=#626262 guibg=NONE gui=NONE ctermfg=241 ctermbg=NONE cterm=NONE

" WINDOW UI
highlight StatusLine guifg=#eeeeee guibg=#0f2228 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
highlight StatusLineNC guifg=#767676 guibg=#0f2228 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
highlight StatusLineTerm guifg=#eeeeee guibg=#0f2228 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
highlight StatusLineTermNC guifg=#767676 guibg=#0f2228 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
highlight Pmenu guifg=#767676 guibg=#3a3a3a gui=NONE ctermfg=243 ctermbg=237 cterm=NONE
highlight PmenuSel guifg=#eeeeee guibg=#3a3a3a gui=NONE ctermfg=255 ctermbg=237 cterm=NONE
highlight PmenuSbar guifg=#3a3a3a guibg=#3a3a3a gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
highlight PmenuThumb guifg=#3a3a3a guibg=#3a3a3a gui=NONE ctermfg=237 ctermbg=237 cterm=NONE
highlight TabLine guifg=#767676 guibg=#0f2228 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
highlight TabLineSel guifg=#eeeeee guibg=#0f2228 gui=NONE ctermfg=255 ctermbg=235 cterm=NONE
highlight TabLineFill guifg=NONE guibg=#0f2228 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
highlight CursorLineNR guifg=#9e9e9e guibg=#0f2228 gui=NONE ctermfg=247 ctermbg=235 cterm=NONE
highlight CursorLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
highlight CursorColumn guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
highlight ColorColumn guifg=NONE guibg=#3a3a3a gui=NONE ctermfg=NONE ctermbg=237 cterm=NONE
highlight Folded guifg=#767676 guibg=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
highlight VertSplit guifg=#444444 guibg=#303030 gui=NONE ctermfg=238 ctermbg=236 cterm=NONE
highlight LineNr guifg=#4e4e4e guibg=#0f2228 gui=NONE ctermfg=239 ctermbg=235 cterm=NONE
highlight NonText guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
highlight SpecialKey guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE

"LICENSE
"Copyright (c) 2020 Alessandro Yorba
"
"Permission is hereby granted, free of charge, to any person obtaining a copy
"of this software and associated documentation files (the "Software"), to deal
"in the Software without restriction, including without limitation the rights
"to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"copies of the Software, and to permit persons to whom the Software is
"furnished to do so, subject to the following conditions:
"
"The above copyright notice and this permission notice shall be included in
"all copies or substantial portions of the Software.
"
"THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
"THE SOFTWARE.
