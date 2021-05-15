setlocal autoindent
setlocal expandtab
setlocal smarttab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2

" Set undo markers on punctuation
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" syntax-highlight code blocks in Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Use 'Marked.app' for Markdown previews
nnoremap <leader>ma :silent !open -a Marked\ 2.app '%:p'<cr>
