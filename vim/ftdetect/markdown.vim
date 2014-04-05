autocmd BufNewFile,BufRead,BufWrite *.markdown,*.md,*.mdown,*.mkd,*.mkdn
    \ if &ft =~# '^\%(conf\|modula2\)$' |
    \   set ft=markdown |
    \ else |
    \   setf markdown |
    \ endif
