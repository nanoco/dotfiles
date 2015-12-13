hi Identifier  guifg=#66D9EF  guibg=NONE     gui=NONE
hi CursorLine  guifg=NONE     guibg=#333333  gui=NONE
hi Visual      guifg=NONE     guibg=#545050  gui=NONE
hi MatchParen  guifg=NONE     guibg=#75715E  gui=BOLD
hi Search      guifg=NONE     guibg=#545454  gui=BOLD
hi IncSearch   guifg=NONE     guibg=#75715E  gui=BOLD
hi Delimiter   guifg=#F92672  guibg=NONE     gui=NONE
hi Pmenu       guifg=#66D9EF  guibg=#4C4C4C  gui=NONE
hi PmenuSel    guifg=NONE     guibg=#4C4C4C  gui=NONE
hi PmenuSbar   guifg=NONE     guibg=#4C4C4C  gui=NONE
hi FoldColumn  guifg=#F92672 guibg=#000000
hi Folded      guifg=#F92672 guibg=#000000

" PHP
hi! link phpFunctions Function
" call s:X("StorageClass","c59f6f","","","Red","")
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python
hi! link pythonOperator Statement

" Ruby
hi! link rubySharpBang Comment
" call s:X("rubyClass","447799","","","DarkBlue","")
" call s:X("rubyIdentifier","c6b6fe","","","Cyan","")
hi! link rubyConstant Type
hi! link rubyFunction Function

" call s:X("rubyInstanceVariable","c6b6fe","","","Cyan","")
" call s:X("rubySymbol","7697d6","","","Blue","")
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
" call s:X("rubyControl","7597c6","","","Blue","")

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

" call s:X("rubyRegexpDelimiter","540063","","","Magenta","")
" call s:X("rubyRegexp","dd0093","","","DarkMagenta","")
" call s:X("rubyRegexpSpecial","a40073","","","Magenta","")

" call s:X("rubyPredefinedIdentifier","de5577","","","Red","")

" Erlang
hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" JavaScript
hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp

" CoffeeScript
hi! link coffeeRegExp javaScriptRegexpString

" Lua
hi! link luaOperator Conditional

" Vimscript
hi! link vimOper Normal

" MiniBufExpl
hi! link MBENormal Comment
hi! link MBEChanged Comment
hi! link MBEVisibleNormal Comment
hi! link MBEVisibleChanged Comment
hi! link MBEVisibleActiveNormal Type
hi! link MBEVisibleActiveChanged Type

