" Vim syntax file
" Language: Monte
" Maintainer: Corbin Simpson <cds@corbinsimpson.com>
" <http://github.com/MostAwesomeDude>
" Latest Revision: Feb 2014

if exists("b:current_syntax")
    finish
endif

syn match monteComment '#.*$'

" Keywords
syn keyword monteKeyword as def else escape exit extends guards implements in
syn keyword monteKeyword method pass var via
syn keyword monteNew fn interface object to
syn keyword monteConditional catch if finally for match switch try when while
syn keyword monteControl break continue return

" Literal bools
syn keyword monteBool true false

" Literal ints
syn match monteInt '\d\+'

" Literal strings
syn region monteStr start='"' end='"'
syn region monteStr start='\'' end='\''

" Quasiliteral strings
syn region monteStr start='`' end='`' contains=monteHole

" Quasiliteral holes
syn match monteHole '\$\w\+' contained
syn match monteHole '\${[^}]\+}' contained
syn match monteHole '@\w\+' contained
syn match monteHole '@{[^}]\+}' contained

" Universal scope
syn keyword monteUniversal any bool char float int void

let b:current_syntax = "monte"

hi def link monteComment Comment
hi def link monteKeyword Keyword
hi def link monteNew Keyword
hi def link monteConditional Conditional
hi def link monteControl Conditional
hi def link monteBool Boolean
hi def link monteInt Number
hi def link monteStr String
hi def link monteHole Identifier
hi def link monteUniversal Type
