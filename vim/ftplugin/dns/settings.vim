autocmd BufWritePre,FileWritePre /etc/* |
        \ exe "normal msHmt" |
        \ exe "gl/^\\s*\\d\\+\\s*;\\s*Serial$/normal ^\<C-A>" |
        \ exe "normal g`tztg`s" |
        \ endif
