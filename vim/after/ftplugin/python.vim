" Use black to format python code
setlocal formatprg=black\ --quiet\ -\ 2>\ /dev/null

" Autoformat before saving
if executable('black')
    augroup black
        autocmd!
        autocmd BufWritePre *.py :normal GQ
    augroup END
endif

" Use indent level as fold markers
setlocal foldmethod=indent
" Only fold up to method level
setlocal foldnestmax=2
" Don't  fold docstrings
setlocal foldignore=\"\"\"
