setlocal indentkeys-=*<Return>
setlocal ai et sta sw=2 sts=2
setlocal iskeyword+=~

let g:html_indent_inctags='head,html,body,p,head,table,tbody,div,script'
let g:html_indent_script1='inc'
let g:html_indent_style1='inc'

if executable('html-beautify')
    " Use short options for html-beautify as it seems to misinterpret long
    " ones
    " let &l:equalprg='html-beautify --type html --indent-size 2 --file -'
    let &l:equalprg='html-beautify --type html -s 2 -f -'
endif
