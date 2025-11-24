"
" Vim syntax file
" Language : Scilab
" File type: *.sci
"

if exists("b:current_syntax")
    finish
endif

" Reserved language keywords
syn keyword scilabStatement         abort clear clearglobal end exit global mode
syn keyword scilabStatement         return predef quit resume
syn keyword scilabFunction          function endfunction funptr
syn keyword scilabPredicate         null iserror isglobal
syn keyword scilabKeyword           typename
syn keyword scilabDebug             debug pause where whereami whereis who whos
syn keyword scilabRepeat            for while break
syn keyword scilabConditional       if then else elseif
syn keyword scilabMultiplex         select case

" Constants definition
syn match scilabConstant            "\(%\)[0-9A-Za-z?!#$]\+"
syn match scilabBoolean              "\(%\)[FTft]\>"

" Reserved language constants
syn match scilabDelimiter           "[][;,()]"
syn match scilabComparison          "[=~]="
syn match scilabComparison          "[<>]=\="
syn match scilabComparison          "<>"
syn match scilabLogical             "[&|~]"
syn match scilabAssignment          "="
syn match scilabArithmetic          "[+-]"
syn match scilabArithmetic          "\.\=[*/\\]\.\="
syn match scilabArithmetic          "\.\=^"
syn match scilabRange               ":"
syn match scilabMlistAccess         "\."

" Line shennanigans
syn match scilabLineContinuation    "\.\{2,}"
syn match scilabTransposition       "[])a-zA-Z0-9?!_#$.]'"lc=1

" Comments and tools
syn match scilabComment             "//.*$"

" Numbers
syn match scilabNumber              "[0-9]\+\(\.[0-9]*\)\=\([DEde][+-]\=[0-9]\+\)\="
syn match scilabNumber              "\.[0-9]\+\([DEde][+-]\=[0-9]\+\)\="

" Strings
syn region scilabString             start=+'+ skip=+''+ end=+'+ oneline
syn region scilabString             start=+"+ end=+"+ oneline

" Identifiers
syn match scilabIdentifier          "\<[A-Za-z?!_#$][A-Za-z0-9?!_#$]*\>"
syn match scilabOverload            "%[A-Za-z0-9?!_#$]\+_[A-Za-z0-9?_#$]\+"

" Define default highlighting
hi link scilabStatement Statement
hi link scilabFuncion Keyword
hi link scilabPredicate Keyword
hi link scilabKeyword Keyword
hi link scilabDebug Debug
hi link scilabRepeat Repeat
hi link scilabConditional Conditional
hi link scilabMultiplex Conditional

hi link scilabConstant Constant
hi link scilabBoolean Boolean

hi link scilabDelimiter Delimiter
hi link scilabMlistAccess Delimiter
hi link scilabComparison Operator
hi link scilabLogical Operator
hi link scilabAssignment Operator
hi link scilabArithmetic Operator
hi link scilabRange Operator
hi link scilabLineContinuation Underlined
hi link scilabTransposition Operator

hi link scilabComment Comment

hi link scilabNumber Number
hi link scilabString String
hi link scilabIdentifier Identifier
hi link scilabOverload Special

" Ensuring this is loaded
let b:current_syntax = "scilab"
