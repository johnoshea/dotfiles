setlocal autoindent
setlocal expandtab
setlocal smarttab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
setlocal foldmethod=marker
setlocal foldmarker={,}
setlocal iskeyword+=-
setlocal iskeyword+=%

" Use <leader>S to sort properties.  Turns this:
"
"     p {
"         width: 200px;
"         height: 100px;
"         background: red;
"         ...
"     }
"
" into this:

"     p {
"         background: red;
"         height: 100px;
"         width: 200px;
"         ...
"     }
nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
