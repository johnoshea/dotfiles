" Set a formatting program so we can use '=' ----- {{{
if executable('html-beautify')
    let &l:equalprg='html-beautify --type html --indent-size 2 --file -'
endif
" }}}

" Syntastic config ------ {{{
let g:syntastic_html_tidy_ignore_errors = [ '<html> proprietary attribute "class"', '<a> proprietary attribute "controls"' ]
" }}}
