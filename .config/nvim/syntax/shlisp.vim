" Vim syntax file
" Shlisp for the Shbobo Shnth

if exists("b:current_syntax")
    finish
endif

syn match shlispNumber '\d\+'
syn match shlispNumber '[+-]\d\+'

syn match shlispharg '[a-h]'

syn match shlispComment ';.*$' 

" Keywords
syn keyword shlispButts wind corp bar minor major

syn keyword shlispNuts left right srate jump mul add reflect return and xor modo short

syn keyword shlispOps horn saw toggle togo swoop mount smoke dust fog haze swamp string comb zither wave water salt horse slew wheel sauce salsa square

" Regions
syn region shlispSexp start="(" end=")" fold transparent contains=shlispButts,shlispNuts,shlispOps,shlispMexp

syn region shlispSituation start="{" end="}" fold transparent contains=shlispSexp

syn region shlispMexp start="[" end="]" contains=shlispButts,shlispNuts,shlispOps

let b:current_syntax = "shlisp"

hi def link shlispButts    Todo
hi def link shlispComment     Comment
hi def link shlispOps    Statement
hi def link celHip         Type
hi def link shlispNuts      PreProc
hi def link shlisparg      Constant
hi def link shlispNumber   Constant
