" Refresh Running Browser
nnoremap <buffer><silent><leader>r :RRB<CR>

inoremap <C-C> <C-R>=system('~/bin/color-picker')<CR>

" Set a formatting program so we can use '=' ----- {{{
if executable('html-beautify')
    let &l:equalprg='html-beautify --type html --indent-size 2 --file -'
endif
" }}}
