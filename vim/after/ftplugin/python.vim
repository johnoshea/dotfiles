" Use black to format python code
setlocal formatprg=black\ --quiet\ -\ 2>\ /dev/null

" Autoformat before saving
if executable('black')
    augroup black
        autocmd!
        autocmd BufWritePre *.py :normal GQ
    augroup END
endif

