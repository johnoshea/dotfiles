set autoindent
set formatoptions=tcq2l
set textwidth=78 shiftwidth=2
set softtabstop=2 tabstop=8
set expandtab
set foldmethod=syntax
" vim-jdaddy's autoformat works better than the "Autoformat" plugin
nnoremap <silent> <leader>f :exe jdaddy#reformat('jdaddy#outer_pos', v:count1)<CR>
