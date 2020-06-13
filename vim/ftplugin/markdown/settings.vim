setlocal autoindent
setlocal expandtab
setlocal smarttab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=72

call pencil#init()
call textobj#sentence#init()
call textobj#quote#init()
call litecorrect#init()
call textobj#quote#init()
" Enable the following/remove the previous setting if curly quotes by default
" in Markdown files gets too annoying
" call textobj#quote#init({'educate': 0})

let g:lexical#thesaurus_key = '<leader>t'
let g:airline_section_x = 'P: %{PencilMode()}'
let g:pencil#wrapModeDefault = 'soft'
let g:pencil#autoformat = 1

map <silent> <leader>qc <Plug>ReplaceWithCurly
map <silent> <leader>qs <Plug>ReplaceWithStraight

" Set undo markers on punctuation
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
inoremap , ,<c-g>u

" syntax-highlight code blocks in Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Use 'Marked.app' for Markdown previews
nnoremap <leader>ma :silent !open -a Marked\ 2.app '%:p'<cr>

call SetArrowKeys()
