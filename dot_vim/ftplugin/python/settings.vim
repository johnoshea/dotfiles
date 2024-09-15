"    For highlight builtin functions and objects:
"let python_highlight_builtins=1
"
"    For highlight builtin objects:
"let python_highlight_builtin_objs=1
"
"    For highlight builtin funtions:
"let python_highlight_builtin_funcs=1
"
"    For highlight standard exceptions:
"let python_highlight_exceptions=1
"
"    For highlight string formatting:
"let python_highlight_string_formatting=1
"
"    For highlight str.format syntax:
"let python_highlight_string_format=1
"
"    For highlight string.Template syntax:
"let python_highlight_string_templates=1
"
"    For highlight indentation errors:
"let python_highlight_indent_errors=1
"
"    For highlight trailing spaces:
"let python_highlight_space_errors=1
"
"    For highlight doc-tests:
"let python_highlight_doctests=1

"    If you want all Python highlightings above:
let g:python_highlight_all=1
"
"    For fast machines:
let g:python_slow_sync=1
"
"    For "print" builtin as function:
let g:python_print_as_function=1

setlocal omnifunc=jedi#completions
setlocal autoindent expandtab smarttab shiftwidth=4 softtabstop=4
set foldmethod=indent

" Taken from romainl's dotfiles
let g:pyindent_open_paren   = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_continue     = '&sw'

" Add/remove pdb breakpoints
nnoremap <silent> <f7> Oimport pdb<CR>pdb.set_trace()<ESC>
nnoremap <silent> <leader><f7> :g/\s*import pdb\s*/d<CR>:g/\s*pdb.set_trace()\s*/d<CR>

" Add/remove pytest breakpoints
nnoremap <silent> <f8> O# pylint: disable=no-member<CR><BS><BS>pytest.set_trace()<ESC>
nnoremap <silent> <leader><f8> /\s*pytest.set_trace()\s*/<CR>k2dd<ESC>

" Add pylint/mypy "disable warning" directives
nnoremap <silent> <f9> <esc>A  # pylint: disable=
nnoremap <silent> <leader><f9> <esc>O# pylint: disable=
nnoremap <silent> <f10> <esc>A  # type: ignore<esc>

" Add/remove pep8-disabling for a single line
nnoremap <localleader>q A  # noqa<ESC>
nnoremap <localleader>Q :s/  # noqa//<CR><ESC>

nnoremap <silent> <buffer> <leader>yg :YcmCompleter GoTo<CR>
nnoremap <silent> <buffer> <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <buffer> <leader>yd :YcmCompleter GetDoc<CR>
