setlocal omnifunc=xmlcomplete#CompleteTags
setlocal autoindent
setlocal expandtab
setlocal smarttab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
let &l:equalprg='xmllint --format --recover -'
