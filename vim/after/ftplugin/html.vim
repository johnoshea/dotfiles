setlocal indentkeys-=*<Return>
setlocal ai et sta sw=2 sts=2
setlocal iskeyword+=~

let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

if executable('html-beautify')
    let &l:equalprg='html-beautify --type html --indent-size 2 --file -'
endif

" Syntastic config
let g:syntastic_html_tidy_ignore_errors = [ '<html> proprietary attribute "class"', '<a> proprietary attribute "controls"' ]
