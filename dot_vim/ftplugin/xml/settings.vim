setlocal omnifunc=xmlcomplete#CompleteTags
setlocal autoindent expandtab smarttab shiftwidth=2 softtabstop=2 tabstop=2
let &l:equalprg='xmllint --format --recover -'
