" nvim/init.vim
" Author: John O'Shea <john.m.oshea@gmail.com>
" Source: <https://github.com/johnoshea/dotfiles>

set runtimepath+=~/.config/nvim/plugged/firenvim

" let g:python3_host_prog = '/Users/johno/.pyenv/versions/py3nvim/bin/python3'
let g:loaded_python_provider = 0

" Leader keys --- {{{
let g:mapleader="\<Space>"
let g:maplocalleader=','
" Leader keys end }}}
" Plugins --- {{{
call plug#begin('~/.config/nvim/plugged')

" Completion --- {{{
" YouCompleteMe --- {{{
function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status ==# 'installed' || a:info.force
        !./install.py
    endif
endfunction

Plug 'https://github.com/Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_add_preview_to_completeopt = 'popup'
let g:ycm_confirm_extra_conf = 0
nnoremap <silent> <buffer> <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <silent> <buffer> <leader>yg :YcmCompleter GoTo<CR>
nnoremap <silent> <buffer> <leader>yr :YcmCompleter GoToReferences<CR>
nnoremap <silent> <buffer> <leader>yd :YcmCompleter GetDoc<CR>
" YouCompleteMe end }}}
" Completion end }}}
" Snippets --- {{{
" Plugin: ultisnips --- {{{
Plug 'https://github.com/SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories= ['UltiSnips', 'my_snippets']
let g:UltiSnipsSnippetsDir= '~/.vim/my_snippets/' " TODO change this
let g:UltiSnipsListSnippets = '<c-g>l'
let g:ultisnips_python_quoting_style = 'sphinx'
let g:UltiSnipsExpandTrigger='<c-g><c-g>'
let g:UltiSnipsJumpForwardTrigger='<c-g>n'
let g:UltiSnipsJumpBackwardTrigger='<c-g>p'
" ultisnips end }}}
" Ultisnips snippets are now stored in honza/vim-snippets
Plug 'https://github.com/honza/vim-snippets'
" }}}
" Colorschemes --- {{{
" gruvbox --- {{{
Plug 'https://github.com/gruvbox-community/gruvbox'
let g:gruvbox_italic=1
let g:gruvbox_invert_signs=1
let g:gruvbox_invert_indent_guides=1
let g:gruvbox_contrast_dark='hard'
" gruvbox end }}}
" srcery-vim --- {{{
Plug 'https://github.com/srcery-colors/srcery-vim'
let g:srcery_italic = 1
" Srcery end  --- }}}
" For light terminal sessions
Plug 'https://github.com/NLKNguyen/papercolor-theme'
" Colorschemes end }}}
" Navigation/filesystem --- {{{
" FZF --- {{{
Plug '/usr/local/opt/fzf' | Plug 'https://github.com/junegunn/fzf.vim', { 'do': { -> fzf#install() } }
let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --exclude .git --ignore-file ~/.gitignore'
nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <Leader><CR> :Buffers<CR>
nnoremap <silent> <Leader>` :Marks<CR>
nnoremap <silent> <Leader>hi :History<CR>
nnoremap <silent> <Leader>mp :Maps<CR>
nnoremap <silent> <Leader>sn :Snippets<CR>
nnoremap <silent> <Leader>cm :Commands<CR>
nnoremap <silent> <Leader>r :Rg<CR>
nnoremap <silent> <Leader>gg :GGrep<CR>
nnoremap <silent> <Leader>gf :GFiles<CR>
nnoremap <silent> <Leader>C :Commits<CR>
nnoremap <silent> <Leader>tg :Tags<CR>
" Insert mode completion
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
" cd to Notes dir (useful for Notational Velocity/Nebulous Notes)
nnoremap <leader>n :lcd ~/Documents/3\ Current/Notes<cr>:Files<cr>

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
\ call fzf#vim#grep(
\   'git grep --line-number '.shellescape(<q-args>), 0,
\   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Augmenting Rg command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Rg  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Rg! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Git files command with preview window
command! -bang -nargs=? -complete=dir GFiles
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" FZF end }}}
" Plugin: vim-sneak --- {{{
Plug 'https://github.com/justinmk/vim-sneak'
nmap f <Plug>SneakForward
xmap f <Plug>VSneakForward
nmap F <Plug>SneakBackward
xmap F <Plug>VSneakBackward
let g:sneak#streak = 1
" vim-sneak end }}}
" Plugin: vim-obsession --- {{{
Plug 'https://github.com/tpope/vim-obsession'
nnoremap <leader>o :Obsession<cr>
nnoremap <leader>O :Obsession!<cr>
" vim-obsession end }}}
" vim-eunuch
" :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
Plug 'https://github.com/tpope/vim-eunuch'
" Matching
Plug 'https://github.com/andymass/vim-matchup/'
" DidYouMean - avoid opening up new empty files if multiple completions
Plug 'https://github.com/EinfachToll/DidYouMean'
" Create directories and files at the same time
Plug 'https://github.com/vim-scripts/easydir.vim'
Plug 'https://github.com/justinmk/vim-dirvish'
" Plugin: remote-viewer --- {{{
" Allows 'Dirvish ssh://user@hostname/path'
Plug 'https://github.com/bounceme/remote-viewer'
nnoremap <leader>ss :Dirvish ssh://
" remote-viewer end }}}
" Shows git status in Dirvish windows
Plug 'https://github.com/kristijanhusak/vim-dirvish-git'
" Navigation/filesystem end }}}
" Editing --- {{{
" vim-mundo --- {{{
Plug 'https://github.com/simnalamburt/vim-mundo', {'on': 'MundoToggle'}
nnoremap <leader>u :MundoToggle<CR>
" vim-mundo end }}}
" vim-easy-align --- {{{
" <number> or '*' for count, followed by character to align on
Plug 'https://github.com/junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" vim-easy-align end }}}
" Editorconfig --- {{{
Plug 'https://github.com/editorconfig/editorconfig-vim'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" Editorconfig end }}}
" vim-sandwich --- {{{
Plug 'https://github.com/machakann/vim-sandwich'
runtime macros/sandwich/keymap/surround.vim
" vim-sandwich end }}}

Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'https://github.com/tpope/vim-abolish'
Plug 'https://github.com/glacambre/firenvim', { 'do': { _ -> firenvim#install(0, 'export PATH=\"$PATH\"') } }
Plug 'https://github.com/andymass/vim-visput'
" Editing end }}}
" Code editing --- {{{
" ale --- {{{
Plug 'https://github.com/dense-analysis/ale'
" Specific to file types and are here for reference
let g:ale_linters = {
			\	'css'            : ['csslint'],
            \   'dockerfile'     : ['hadolint'],
            \   'go'             : ['gopls'],
			\	'html'           : ['htmlhint', 'tidy'],
			\	'javascript'     : ['eslint'],
			\	'json'           : ['jsonlint'],
			\	'markdown'       : ['mdl'],
			\	'python'         : ['pylint', 'flake8', 'mypy'],
			\	'scss'           : ['sasslint'],
			\	'sh'             : ['shellcheck', 'shell'],
            \   'tf'             : ['tflint'],
			\	'vim'            : ['vint'],
			\	'yaml'           : ['yamllint'],
			\ }
let g:ale_lint_on_text_changed = 'never'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_format = '%linter%> %code: %%s'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['prettier','eslint']
\}
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--max-line-length=88'  " match 'black' formatter
let g:ale_python_mypy_options = '--follow-imports=silent'
" ale end }}}
" vim-prettier --- {{{
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" use <leader>f to autoformat code
nnoremap <leader>f :PrettierAsync<cr>
" vim-prettier end }}}
" vim-test --- {{{
Plug 'https://github.com/janko-m/vim-test'
nmap <silent> <leader>tn <esc>:w<CR>:TestNearest<CR>
nmap <silent> <leader>tf <esc>:w<CR>:TestFile<CR>
nmap <silent> <leader>ts <esc>:w<CR>:TestSuite<CR>
nmap <silent> <leader>tl <esc>:w<CR>:TestLast<CR>
let g:test#strategy = 'dispatch'
" vim-test end }}}
" tcomment --- {{{
Plug 'https://github.com/tomtom/tcomment_vim'
" Prevent tcomment from making a zillion mappings (we just want the operator).
let g:tcomment_mapleader2=''
let g:tcomment_mapleader_comment_anyway=''
let g:tcomment_textobject_inlinecomment=''
" tcomment end }}}
" Pear-tree --- {{{
Plug 'https://github.com/tmsvg/pear-tree'
" If enabled, smart pair functions timeout after 60ms:
let g:pear_tree_timeout = 60
" Pear-tree end }}}
" Code editing end }}}
" Git --- {{{
" Fugitive --- {{{
Plug 'https://github.com/tpope/vim-fugitive'
augroup fugitive
    autocmd!
    " Auto-clean fugitive buffers.
    autocmd BufReadPost fugitive://* set bufhidden=delete

    nnoremap <leader>gs :Git<CR>
    nnoremap <leader>ga :Gwrite<CR>
    nnoremap <leader>gc :Gcommit %<CR>
    nnoremap <leader>gd :Gvdiffsplit<CR>
    nnoremap <leader>gl :Gclog<CR>
    nnoremap <leader>gb :Git blame<CR>
    nnoremap <leader>gf :Git fetch<CR>
    nnoremap <leader>gps :Git push<CR>
    nnoremap <leader>gpl :Git pull<CR>
augroup END
" Fugitive end }}}

" Enable GitHub features in fugitive
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
" vim-twiggy --- {{{
Plug 'https://github.com/sodapopcan/vim-twiggy'
nnoremap <leader>tw :Twiggy<cr>
nnoremap <leader>TW :Twiggy<space>
" vim-twiggy end }}}
" committia.vim --- {{{
Plug 'https://github.com/rhysd/committia.vim'
let g:committia_open_only_vim_starting = 1
" committia.vim end }}}
" Git end }}}
" Display --- {{{
" vim-crystalline --- {{{
Plug 'https://github.com/rbong/vim-crystalline'
function! StatusLine(current, width) abort
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    let l:s .= '%#CrystallineInactive#'
  endif
  let l:s .= ' %f%h%w%m%r '
  let l:s .= ObsessionStatus() . ' '
  if a:current
    let l:s .= crystalline#right_sep('', 'Fill') . ' ⎇ %{fugitive#head()}'
  endif

  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_sep('', 'Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""}%{&ft} '
    let l:s .= crystalline#left_mode_sep('')
    if a:width > 80
        let l:s .= ' 0x%B %c:%l/%L [%{&enc} %{&ff}] '
    else
        let l:s .= ' '
    endif
  endif

  return l:s
endfunction

let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_theme = 'default'
" vim-crystalline end }}}
" vim-diminactive --- {{{
Plug 'https://github.com/blueyed/vim-diminactive'
let g:diminactive_use_syntax = 1
let g:diminactive_enable_focus = 1
" vim-diminactive end t}}}
" listtoggle --- {{{
Plug 'https://github.com/valloric/listtoggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
" listtoggle end }}}

" Better display of whitespace - adds :StripWhitespace too
Plug 'https://github.com/ntpeters/vim-better-whitespace'

" vim-numbertoggle --- {{{
Plug 'https://github.com/jeffkreeftmeijer/vim-numbertoggle'
set number relativenumber
nnoremap <silent> <leader>1 :set relativenumber!<cr>
nnoremap <silent> <leader>2 :set nonumber!<cr>:set norelativenumber!<cr>
" vim-numbertoggle end }}}

" indentLine --- {{{
Plug 'https://github.com/Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['help']
" indentline end }}}
Plug 'https://github.com/lukas-reineke/indent-blankline.nvim'

" Easier/better handling of in-file splits
Plug 'https://github.com/wellle/visual-split.vim'

Plug 'https://github.com/machakann/vim-highlightedyank'
" Display end }}}
" Tmux --- {{{
" Plugin: slimux --- {{{
Plug 'https://github.com/grusky/slimux'
nnoremap <Leader>sc :SlimuxREPLConfigure<CR>
nnoremap <Leader>se :SlimuxREPLSendLine<CR>
vnoremap <Leader>se :SlimuxREPLSendSelection<CR>
nnoremap <Leader>sp :SlimuxShellPrompt<CR>
nnoremap <Leader>sa :SlimuxShellLast<CR>
nnoremap <Leader>sk :SlimuxSendKeysPrompt<CR>
nnoremap <Leader>sl :SlimuxSendKeysLast<CR>
" slimux end }}}
" - allow window nav to work across non-vim tmux panes (needs tmux config too)
Plug 'https://github.com/christoomey/vim-tmux-navigator'
" " vim-tmux-focus-events
Plug 'https://github.com/tmux-plugins/vim-tmux-focus-events'
nnoremap <leader>z :call system("tmux resize-pane -Z")<CR>
" Tmux end }}}
" Filetypes/file formats --- {{{
" vimwiki --- {{{
Plug 'https://github.com/vimwiki/vimwiki'
let WIKI_BASE_DIR = '~/vimwiki'
let wiki_1 = {}
let wiki_1.path = WIKI_BASE_DIR . '/vimwiki/'
let wiki_1.path_html = WIKI_BASE_DIR . '/vimwiki_html/'
let wiki_1.nested_syntaxes = {'python': 'python', 'sh': 'sh'}
let wiki_1.ext = '.md'
let wiki_1.folding = 'syntax'
let wiki_1.syntax = 'markdown'
let wiki_1.ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}
let g:vimwiki_list = [wiki_1]
let g:vimwiki_markdown_ext_link = 1  " add .md to links, for other markdown processors
let g:vimwiki_global_ext = 0  " turn off temporary wikis
" vimwiki end }}}
" pgsql --- {{{
Plug 'https://github.com/lifepillar/pgsql.vim',                     {'for': 'sql'}
let g:sql_type_default = 'pgsql'
" pgsql end }}}
" Python --- {{{
Plug 'https://github.com/kalekundert/vim-coiled-snake',             {'for': 'python'}
Plug 'https://github.com/Vimjas/vim-python-pep8-indent',            {'for': 'python'}
" Python  end }}}
" Django --- {{{
Plug 'https://github.com/vim-scripts/django.vim',                   {'for': 'django'}
Plug 'https://github.com/tweekmonster/django-plus.vim',             {'for': 'django'}
" Django end }}}
" Javascript --- {{{
Plug 'https://github.com/pangloss/vim-javascript',                  {'for': 'javascript'}
Plug 'https://github.com/othree/javascript-libraries-syntax.vim',   {'for': 'javascript'}
" Javascript end }}}
" Markdown --- {{{
Plug 'https://github.com/godlygeek/tabular'
Plug 'https://github.com/plasticboy/vim-markdown'
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
" let g:vim_markdown_fenced_languages = ['csharp=cs']
" Plugin: vim-table-mode --- {{{
Plug 'https://github.com/dhruvasagar/vim-table-mode'
let g:table_mode_corner='|'
" vim-table-mode end }}}
" Markdown end }}}
" Add CSS3 syntax highlighting
Plug 'https://github.com/hail2u/vim-css3-syntax',                   {'for': ['css', 'scss']}
" CSS OmniComplete
Plug 'https://github.com/othree/csscomplete.vim',                   {'for': ['css', 'scss']}
" Better JSON
Plug 'https://github.com/tpope/vim-jdaddy',                         {'for': ['javascript', 'json']}
" CSV support
Plug 'https://github.com/chrisbra/csv.vim',                         {'for': ['csv', 'tsv', 'psv']}
" HTML
Plug 'https://github.com/mattn/emmet-vim',                          {'for': 'html'}
" Terraform --- {{{
Plug 'https://github.com/juliosueiras/vim-terraform-completion',    {'for': 'terraform'}
Plug 'https://github.com/hashivim/vim-terraform',                   {'for': 'terraform'}
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1
" Terraform end }}}
" Tmux.conf syntax
Plug 'https://github.com/tmux-plugins/vim-tmux',                    {'for': 'tmux'}
" Nginx
Plug 'https://github.com/chr4/nginx.vim',                           {'for': 'nginx'}
" TOML
Plug 'https://github.com/cespare/vim-toml',                         {'for': 'toml'}
" Jinja2
Plug 'https://github.com/Glench/Vim-Jinja2-Syntax',                 {'for': 'jinja2'}
" Filetypes/file formats end }}}
" Text objects --- {{{
" Use 'ia'/'aa' for arguments,
" or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
Plug 'https://github.com/wellle/targets.vim'
" Add af/if for functions, ac/ic for classes, ]m, ]M, [m, [M for moving
Plug 'https://github.com/jeetsukumaran/vim-pythonsense'
" Add [-, [+, [=, ]-, ]+, ]= "move by indent" maps
Plug 'https://github.com/jeetsukumaran/vim-indentwise'
" Add al/il for lines
Plug 'https://github.com/kana/vim-textobj-line'
" Needed for vim-textobj-underscore
Plug 'https://github.com/kana/vim-textobj-user'
" Add a_/i_ for underscores
Plug 'https://github.com/lucapette/vim-textobj-underscore'
" - provides 'i' indent object (e.g. 'vai')
Plug 'https://github.com/michaeljsmith/vim-indent-object'
" Text objects end }}}
" Search --- {{{
Plug 'https://github.com/markonm/traces.vim'
" vim-asterisk ---------------------------------------------------- {{{
Plug 'https://github.com/haya14busa/vim-asterisk'
Plug 'https://github.com/qxxxb/vim-searchhi'
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)<Plug>(searchhi-update)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)<Plug>(searchhi-update)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)<Plug>(searchhi-update)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)<Plug>(searchhi-update)
let g:asterisk#keeppos = 1
" vim-asterisk end }}}
" vim-agriculture ------------------------------------------------- {{{
Plug 'https://github.com/jesseleite/vim-agriculture'
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor
" vim-agriculture end }}}
" Search end }}}

call plug#end()
" Plugins end }}}
" Settings --- {{{
scriptencoding utf-8
set backupcopy=yes              " using 'auto'/'no' may cause file-watching programs to miss changes
set undolevels=10000            " Keep lots of undo
set lazyredraw                  " Set lazy redraw, to speed up macros and the like
set hidden                      " Allow movement to another buffer w/o saving the current one
set showmatch                   " Show matching bracket
set matchtime=3                 " (for only 0.3s)
set confirm                     " Get confirmation before we do anything stupid
set whichwrap+=<,>,[,],h,l      " <left> and <right> move over line endings
set matchpairs+=<:>             " Match angle-brackets as well by default
set linebreak                   " Break lines at a sensible place
set title                       " Set descriptive window/terminal title
set printoptions=paper:A4       " (even though almost all prints go to PDF anyway)
set splitright                  " When splitting vertically, split to the right
set splitbelow                  " When splitting horizontally, split below
set scrolloff=5                 " Minimum no. of lines visible above/below the cursor when scrolling
set sidescrolloff=5             " Minimum no. of columns visible to the left/right of cursor when scrolling
set nomodeline                  " Disallow modelines (for security reasons)
set autowrite                   " Write file before some commands
set wildmode=longest:full,full  " Complete the next full match
set virtualedit=all             " Allow the cursor to move to 'invalid' places
set cmdheight=2                 " Avoid 'Press Enter' messages
set fillchars=diff:⣿,vert:│     " Have different vertical splits for diffs
set switchbuf=useopen           " Jump to first open window containing buffer (if possible)
set breakindent                 " indent wrapped lines
set noshowmode                  " vim-crystalline shows this for us
set nrformats=hex               " Ignore octal/binary for incrementing/decrementing numbers
set formatoptions+=n            " Recognize numbered lists
set nojoinspaces                " only add a single space when joining lines

set spellfile=~/.vim/custom-dictionary.utf-8.add  " TODO change this

" display --- {{{
set display=lastline            " Show as much of last line as possible
set display+=msgsep             " ... don't scroll the entire screen for long messages
set display+=uhex               " ... show unprintables as hex
" display end }}}
" sessionoptions --- {{{
set sessionoptions+=winpos      " Save window positions as well
set sessionoptions+=resize      " ... save window sizes as well
" sessionoptions end }}}
" diffopt --- {{{
set diffopt=internal            " use the internal diff library
set diffopt+=filler             " show filler lines
set diffopt+=iwhiteall          " ignore whitespace
set diffopt+=closeoff           " turn off diff if only one diff window left open
set diffopt+=hiddenoff          " don't use diff mode for a buffer when it becomes hidden
set diffopt+=vertical           " show diffs vertically
set diffopt+=indent-heuristic   " use indent heuristic for diff
" diffopt end }}}
" timeouts --- {{{
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeoutlen=10
" timeouts end }}}
" mouse --- {{{
set mouse=a           " Enable the mouse for all modes
set mousemodel=popup  " Use popup menu for right mouse button
" mouse end }}}
" shada --- {{{
set shada+='1000  " Keep marks for N files
set shada+=<1000  " Keep N lines for each register
" shada end }}}
" clipboard --- {{{
set clipboard+=unnamedplus
" clipboard end }}}

" Settings end }}}
" Colors --- {{{
" " force true color on within tmux
" let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
if $ITERM_PROFILE ==# 'Light'
    colorscheme PaperColor
    set background=light
else
    colorscheme srcery
    set background=dark
endif
syntax enable
set colorcolumn=80

"  " restore screen after quitting
"  if has('terminfo')
"    let &t_Sf='\ESC[3%p1%dm'
"    let &t_Sb='\ESC[4%p1%dm'
"  else
"    let &t_Sf='\ESC[3%dm'
"    let &t_Sb='\ESC[4%dm'
"  endif
"
"  " Prevent Vim from clobbering the scrollback buffer. See
"  " http://www.shallowsky.com/linux/noaltscreen.html
"  set t_ti= t_te=
"  " don't clear background color
"  set t_ut=
" Colors end }}}
" Tabs --- {{{
" For an explanation of the 'tabs vs spaces' used below, see
" <http://www.jwz.org/doc/tabs-vs-spaces.html>
set shiftwidth=4                " # spaces for autoindent steps
set shiftround                  " Always round to a multiple of 'shiftwidth'
set tabstop=4                   " Tabs = 4 spaces, but 'expandtab' *must* be set
set softtabstop=4               " # spaces that a tab counts for
set expandtab                   " Turn all tabs to spaces on save
filetype plugin indent on
" Tabs end }}}
" Searching --- {{{
set ignorecase " Ignore case when searching
set infercase  " Make completions smarter about cases
set smartcase  " Override 'ignorecase' when needed

augroup nohighlight
    autocmd!
    autocmd VimEnter * nohls
augroup END

nnoremap ,, :nohls<CR>

" Use tab and shift-tab to move between matches while in search ('/') mode
cnoremap <expr>  <tab>    getcmdtype() =~ '[?/]' ? '<c-g>' : feedkeys('<tab>', 'int')[1]
cnoremap <expr>  <s-tab>  getcmdtype() =~ '[?/]' ? '<c-t>' : feedkeys('<s-tab>', 'int')[1]

" }}}
" Command window --- {{{
" Typos
command! -bang E e<bang>
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Wq wq<bang>
command! -bang WQ wq<bang>
command! -bang Wn wn<bang>
command! -bang WN wn<bang>
command! -bang Xa xa<bang>
command! -bang XA xa<bang>

augroup command_window
    autocmd!
    " have <Ctrl-C> leave cmdline-window
    autocmd CmdwinEnter * nnoremap <buffer> <C-c> :q\|echo ""<cr>
    autocmd CmdwinEnter * inoremap <buffer> <C-c> <esc>:q\|echo ""<cr>
    " start command line window in insert mode and no line numbers
    autocmd CmdwinEnter * startinsert
    autocmd CmdwinEnter * set nonumber
augroup END

" Command window end }}}
" Help --- {{{
" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>
" Help end }}}
" Folding --- {{{
" The following open closed folds
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO
" Folding end }}}
" File loading --- {{{
augroup vimStartup
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

augroup END

set fileformats=unix,dos,mac

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*
set wildignore+=*.pdf,*.zip,*.so                 " binaries
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX nonsense
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc,*.pyo                      " Python byte code
" File loading end }}}
" Undo --- {{{
" Trailing double slashes on directory names below cause Vim to save the
" full path to each file, but with slashes escaped - means we can have
" backup/undo files with the same names in multiple directories and keep
" them distinct
set backupdir=~/.local/share/nvim/backup//
set undodir=~/.local/share/nvim/undo//
set undofile
set noswapfile
set updatetime=500 " Write swap files after 0.5 seconds of inactivity.
" Drop an undo breakpoint so I can recover from insert-mode ctrl-w's
inoremap <c-w> <c-g>u<c-w>

"Meaningful backup name, ex: filename@2015-04-05.14:59
augroup named_backups
    autocmd!
    autocmd BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
augroup END

" Undo end }}}
" Display options --- {{{
" Use better looking listchars
set listchars=tab:»\ ,extends:›,precedes:‹,trail:·,nbsp:‗,eol:$
let &showbreak = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines

" Pop-up menu colors
highlight Pmenu guibg=yellow guifg=black
highlight PmenuSel guibg=white guifg=black

" Resize splits when the window is resized
augroup resized
    autocmd!
    au VimResized * exe "normal! \<c-w>="
augroup END

if &diff
    "I'm only interested in diff colours
    syntax off
endif

" https://github.com/khuedoan/dotfiles/blob/97d5d7bb4f00374a19beb50eaa75a83a7d570b06/.vimrc#L48
" Change cursor shape in different modes (see :help cursor-shape)
let &t_EI = "\033[2 q" " NORMAL  █
let &t_SI = "\033[5 q" " INSERT  |

" Display options end }}}
" Mappings --- {{{
" Swap the behaviour of j/k with gj/gk - i.e. j/k always move by screenlines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" <leader>cd      cd to the directory of the current buffer
nnoremap <leader>cd :lcd %:h<CR>

" Moves the character under the cursor to the end of the line.
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Quickly select text you just pasted
noremap gV `[v`]

" Move to paragraph lines, not the spaces between them
nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'

" Use <tab> to move between windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>W

" Don't select the end of line with '$' - I almost always cursor left when
" doing this
nmap $ g_

" Increment/decrement the selection as an ordered list
vnoremap + g<C-a>gv
vnoremap - g<C-x>gv

" Try [twf](https://github.com/wvanlint/twf)
function! TwfExit(path)
  function! TwfExitClosure(job_id, data, event) closure
    bd!
    try
      let out = filereadable(a:path) ? readfile(a:path) : []
    finally
      silent! call delete(a:path)
    endtry
    if !empty(out)
      execute 'edit! ' . out[0]
    endif
  endfunction
  return funcref('TwfExitClosure')
endfunction

function! Twf()
  let temp = tempname()
  call termopen('twf ' . @% . ' > ' . temp, { 'on_exit': TwfExit(temp) })
  startinsert
endfunction

nnoremap <silent> <leader>tv :call Twf()<CR>

" Try using Q as @q
nnoremap Q @q

" Try adding an 'edit register' mapping - type 'cq' followed by the register
" to edit
nnoremap <expr> cq call({r-> ":\<c-u>let @".r." = \<c-r>\<c-r>=string(getreg('".r."'))\<cr>\<c-f>\<left>" }, [nr2char(getchar())])

" Refactor remap.
" Go to local definition and replace it in local scope. Uses textobj-indent
" (for ai map).
nmap gr 1gdvaio:s/<C-R>///gc<left><left><left>
" Similar map for selections to turn an expression into a variable. No point
" of definition so just use indent from textobj-indent. Clobbers @c register.
xmap gr "cyvaio:s/<C-R>c//gc<left><left><left>

" Use gs/gS for global/selection search and replaces
nnoremap gs :%s/
xnoremap gs :s/
nnoremap gS :%S/
xnoremap gS :S/

" Get out of diff
nnoremap <silent> <c-w><c-o> :diffoff!<bar>only<cr>
nnoremap <silent> <c-w>o :diffoff!<bar>only<cr>

" Start `cgn` with the word under the cursor
nmap cg* *Ncgn

" Formatting --- {{{
" gq wrapper that:
" - tries its best at keeping the cursor in place
" - tries to handle formatter errors
function! Format(type, ...)
    normal! gggqG
    if v:shell_error > 0
        silent undo
        redraw
        echomsg 'formatprg "' . &formatprg . '" exited with status ' . v:shell_error
    endif
    call winrestview(w:gqview)
    unlet w:gqview
endfunction
nmap <silent> gq :let w:gqview = winsaveview()<CR>:set opfunc=Format<CR>g@<CR>

" Formatting end }}}
" Compiling --- {{{
nnoremap <leader>cc :w<CR>:copen 6<CR><C-w>p:make<CR>
nnoremap <leader>co :copen 6<CR>
nnoremap <leader>cl :cclose<CR>
" Compiling end }}}

" Saving --- {{{
" Save normal buffers on <CR> - use `:update` to only save when modified -
" also turn off search highlighting
nnoremap <silent><expr> <CR> empty(&buftype) ? ":nohls<CR> \| :update\<CR>" : ":nohls<CR>\<CR>"
" Saving end }}}

" Buffers --- {{{
set wildcharm=<tab>
" Buffers end }}}

" Windows --- {{{
" Tmux-like split panes navigation
noremap <C-W>\| :vsplit<CR><C-W>l
noremap <C-W>- :split<CR><C-W>j
noremap <C-W><C-W> <C-W>w
" Windows end }}}

" Lines --- {{{
" Keep the cursor in place while joining lines using 'J'
nnoremap J mzJ`z
" Join lines in insert mode
inoremap <C-j> <C-o>J
" Lines end }}}
" Mappings end }}}
" Arrow keys --- {{{
function SetArrowKeys()
    " Repurpose arrow keys to move lines
    " Arrow key remapping:
    " Up/Dn = move line up/dn
    " Left/Right = indent/unindent
    " Normal mode
    nnoremap <silent> <buffer> <Left> <<
    nnoremap <silent> <buffer> <Right> >>
    nnoremap <silent> <buffer> <Up>   :<C-u>silent move-2<CR>:silent! ==<CR>
    nnoremap <silent> <buffer> <Down> :<C-u>silent move+<CR>:silent! ==<CR>

    " Visual mode
    vnoremap <silent> <buffer> <Left> <gv
    vnoremap <silent> <buffer> <Right> >gv
    vnoremap <silent> <buffer> <Up>   :move-2<CR>gv=gv
    vnoremap <silent> <buffer> <Down> :move'>+<CR>gv=gv

    " Insert mode
    inoremap <silent> <buffer> <Left> <C-D>
    inoremap <silent> <buffer> <Right> <C-T>
endfunction

augroup arrowkeys
    autocmd!
    autocmd BufNewFile,Bufread * call SetArrowKeys()
augroup END
" Arrow keys end }}}
" Vim editing --- {{{
nnoremap <leader>v :e $MYVIMRC<cr>
nnoremap <leader>V :vsplit $MYVIMRC<cr>

augroup VimFiles
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end

" automatically source the init.vim file if I change it
" the bang (!) forces it to overwrite this command rather than stack it
augroup autosourcevimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC :source $MYVIMRC
augroup END
" Vim editing end }}}
" Autocommands --- {{{
" Makefile settings --- {{{
" Make the tab key do actual tab characters for makefiles.
augroup makefile
    autocmd!
    autocmd BufNewFile,Bufread *akefile call <SID>MakefileSettings()

    " Settings for Makefile-like things
    function! s:MakefileSettings() abort
        set noexpandtab " don't use spaces to indent
        set nosmarttab  " don't ever use spaces, not even at line beginnings
    endfunction

    autocmd QuickFixCmdPost make cwindow
augroup END
" Makefile settings end }}}

" Plugin window settings --- {{{
augroup plugins
    autocmd FileType Plugins map <buffer> q :q<cr>
augroup END
" Plugin window settings end }}}

" Autocommands end }}}