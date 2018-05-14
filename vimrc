" .vimrc
" Author: John O'Shea <john.m.oshea@gmail.com>
" Source: <https://github.com/johnoshea/dotfiles>

" Leader keys ------------------------------------------------------------- {{{
let g:mapleader="\<Space>"
let g:maplocalleader=','

" }}}
" Plugins ----------------------------------------------------------------- {{{
call plug#begin('~/.vim/bundle')

" Mac-specific things ----------------------------------------------------- {{{
if has('macunix')

    " Work around issue with homebrew-install Python ---------------------- {{{
    if has('python3')
        command! -nargs=1 Py py3 <args>
        set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.6/Python
        set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.6
    else
        command! -nargs=1 Py py <args>
        set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
        set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
    endif
    " }}}

    " Version-dependent plugins ------------------------------------------- {{{
    if v:version >= 704
        " Plugin: ultisnips ----------------------------------------------- {{{
        Plug 'SirVer/ultisnips'
        let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'my_snippets']
        let g:UltiSnipsListSnippets = '<C-l>'
        let g:ultisnips_python_quoting_style = 'sphinx'
        let g:UltiSnipsExpandTrigger='<tab>'
        let g:UltiSnipsJumpForwardTrigger='<c-j>'
        let g:UltiSnipsJumpBackwardTrigger='<c-k>'
        " }}}
        " Ultisnips snippets are now stored in honza/vim-snippets
        Plug 'honza/vim-snippets'

        " Plugin: Tagbar -------------------------------------------------- {{{
        Plug 'majutsushi/tagbar'
        let g:tagbar_width = 40
        let g:tagbar_autofocus = 1
        let g:tagbar_sort = 0
        let g:tagbar_compact = 1
        let g:tagbar_expand = 0
        let g:tagbar_singleclick = 1
        let g:tagbar_usearrows = 1
        nnoremap <leader>b :TagbarToggle<CR>
        " }}}
        " - auto-create 'tags' files - to disable per-directory, create a .notags file
        Plug 'ludovicchabant/vim-gutentags'
    endif
    " }}}

    " Navigation
    " Plugin: FZF --------------------------------------------------------- {{{
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
    nnoremap <silent> <Leader><Leader> :Files<CR>
    nnoremap <silent> <Leader><Enter> :Buffers<CR>
    nnoremap <silent> <Leader>` :Marks<CR>
    nnoremap <silent> <Leader>hi :History<CR>
    nnoremap <silent> <Leader>mp :Maps<CR>
    nnoremap <silent> <Leader>sn :Snippets<CR>
    nnoremap <silent> <Leader>cm :Commands<CR>
    " Insert mode completion
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-j> <plug>(fzf-complete-file-ag)
    imap <c-x><c-l> <plug>(fzf-complete-line)
    " cd to Dropbox Notes dir (useful for Notational Velocity/Nebulous Notes)
    nnoremap <leader>dn :lcd ~/Dropbox/Notes<cr>:Files<cr>
    " }}}

    " Plugin: slimux ------------------------------------------------------ {{{
    Plug 'epeli/slimux'
    nnoremap <Leader>se :SlimuxREPLSendLine<CR>
    vnoremap <Leader>se :SlimuxREPLSendSelection<CR>
    nnoremap <Leader>sp :SlimuxShellPrompt<CR>
    nnoremap <Leader>sa :SlimuxShellLast<CR>
    nnoremap <Leader>sk :SlimuxSendKeysPrompt<CR>
    nnoremap <Leader>sl :SlimuxSendKeysLast<CR>
    " }}}

    " - allow window nav to work across non-vim tmux panes (needs tmux config too)
    Plug 'christoomey/vim-tmux-navigator'
    " vim-tmux-focus-events
    Plug 'tmux-plugins/vim-tmux-focus-events'
    nnoremap <leader>Z :call system("tmux resize-pane -Z")<CR>

    " 'Writing' plugins
    Plug 'reedes/vim-pencil', {'for': ['text', 'markdown']}
    " Adds insert-mode common typo fixes
    Plug 'reedes/vim-litecorrect', {'for': ['text', 'markdown']}
    " Use :Wordy <category> to find bad terms, clichés, etc
    Plug 'reedes/vim-wordy', {'for': ['text', 'markdown']}
    " Adds iq/iQ/aq/aQ double/single text objects, plus '(', ')' to navigate
    " by sentences
    Plug 'reedes/vim-textobj-quote', {'for': ['text', 'markdown']}
    " Adds is/as 'sentence' text objects
    Plug 'reedes/vim-textobj-sentence', {'for': ['text', 'markdown']}

    Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}

    " Use 'Marked.app' for Markdown previews
    nnoremap <leader>ma :silent !open -a Marked\ 2.app '%:p'<cr>
endif
" }}}

" Navigation/filesystem --------------------------------------------------- {{{
" - netrw enhancement
Plug 'tpope/vim-vinegar'
" Plugin: vim-sneak ------------------------------------------------------- {{{
Plug 'justinmk/vim-sneak'
nmap f <Plug>SneakForward
xmap f <Plug>VSneakForward
nmap F <Plug>SneakBackward
xmap F <Plug>VSneakBackward
let g:sneak#streak = 1
" }}}
" DidYouMean - avoid opening up new empty files if multiple completions
Plug 'EinfachToll/DidYouMean'
" Create directories and files at the same time
Plug 'vim-scripts/easydir.vim'
" Plugin: vim-startify ---------------------------------------------------- {{{
Plug 'mhinz/vim-startify'
let g:startify_session_dir = '~/.vim/session'
let g:startify_bookmarks = ['~/src/dotfiles/vimrc', '~/src/prezto/', '~/.vimrc.local']
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
" }}}
" vim-enuch
" :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
Plug 'tpope/vim-eunuch'
Plug 'andymass/vim-matchup'
" }}}

" Editing ----------------------------------------------------------------- {{{
" Plugin: undotree -------------------------------------------------------- {{{
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
let g:undotree_SetFocusWhenToggle = 1
nnoremap <leader>u :UndotreeToggle<CR>
" }}}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
" Plugin: vim-easy-align -------------------------------------------------- {{{
" <number> or '*' for count, followed by character to align on
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" Use 'cx' to start/finish changes (e.g. 'cxiw')
Plug 'tommcdo/vim-exchange'
" Use <c-a>/<c-e> to increment/decrement visual ranges of numbers
Plug 'triglav/vim-visual-increment'
" Auto-update folds only as needed
Plug 'Konfekt/FastFold'
" Smart-insert closing parentheses/quotes, etc
Plug 'Raimondi/delimitMate'
" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'ConradIrwin/vim-bracketed-paste'
" Word motions now work on CamelCase words
Plug 'chaoren/vim-wordmotion'
" Use 'gs{MOTION}' to sort lines and argument lists
Plug 'christoomey/vim-sort-motion'
" }}}

" Code editing ------------------------------------------------------------ {{{
Plug 'tomtom/tcomment_vim'
" Plugin: ale ------------------------------------------------------------- {{{
Plug 'w0rp/ale'
" Specific to file types and are here for reference
let g:ale_linters = {
			\	'css'            : ['csslint'],
			\	'html'           : ['htmlhint', 'tidy'],
			\	'javascript'     : ['eslint'],
			\	'json'           : ['jsonlint'],
			\	'markdown'       : ['mdl'],
			\	'python'         : ['flake8', 'pylint'],
			\	'scss'           : ['sasslint'],
			\	'sh'             : ['shellcheck', 'shell'],
			\	'vim'            : ['vint'],
			\	'yaml'           : ['yamllint'],
			\ }
" lint on save only, partly for speed and partly because pylint only works
" with files saved to disk
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_delay = 0
let g:ale_max_signs = 30
" " if you don't want linters to run on opening a file
" let g:ale_lint_on_enter = 0
" }}}
" Plugin: vim-autoformat -------------------------------------------------- {{{
" use <leader>f to autoformat code
Plug 'Chiel92/vim-autoformat'
nnoremap <leader>f :Autoformat<cr>
" }}}
" Plugin: vim-test -------------------------------------------------------- {{{
Plug 'janko-m/vim-test'
nmap <silent> <leader>t <esc>:w<CR>:TestNearest<CR>
nmap <silent> <leader>T <esc>:w<CR>:TestFile<CR>
nmap <silent> <leader>A <esc>:w<CR>:TestSuite<CR>
nmap <silent> <leader>, <esc>:w<CR>:TestLast<CR>
nmap <silent> <leader>. <esc>:w<CR>:TestVisit<CR>
let g:test#strategy = 'vimux'
" }}}
" Plugin: vim-dotenv ------------------------------------------------------ {{{
Plug 'tpope/vim-dotenv'
" }}}
" }}}

" Git --------------------------------------------------------------------- {{{
" Plugin: Fugitive -------------------------------------------------------- {{{
Plug 'tpope/vim-fugitive'
augroup fugitive
    autocmd!
    " Auto-clean fugitive buffers.
    autocmd BufReadPost fugitive://* set bufhidden=delete
    " Map '..' to go up a directory in fugitive tree/blob buffers.
    autocmd User fugitive
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \   nnoremap <buffer> .. :edit %:h<CR> |
        \ endif

    nnoremap <leader>gs :Gstatus<CR>
    nnoremap <leader>ga :Gwrite<CR>
    nnoremap <leader>gc :Gcommit %<CR>
    nnoremap <leader>gd :Gdiff<CR>
    nnoremap <leader>gl :Glog<CR>
    nnoremap <leader>gb :Gblame<CR>
    nnoremap <leader>gr :Gremove<CR>
    nnoremap <leader>gpl :Git pull<CR>
    nnoremap <leader>gps :Git push<CR>
augroup END
" }}}
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = [ 'git' ]
" }}}

" Display ----------------------------------------------------------------- {{{
" Plugin: lightline ------------------------------------------------------- {{{
Plug 'itchyny/lightline.vim'
let g:lightline = {
    \ 'colorscheme': 'OldHope',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'charvaluehex', 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \ },
    \ 'component': {
    \   'charvaluehex': '0x%B'
    \ },
    \ }

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
" Plugin: rainbow_parentheses --------------------------------------------- {{{
Plug 'junegunn/rainbow_parentheses.vim'
augroup rainbowparentheses
    autocmd!
    autocmd VimEnter * RainbowParentheses
    let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
    let g:rbpt_max = 24
augroup END
" }}}
" Plugin: GoldenView ------------------------------------------------------ {{{
Plug 'zhaocai/GoldenView.Vim'
let g:goldenview__enable_default_mapping = 0
" }}}
" Better display of whitespace - adds :StripWhitespace too
Plug 'ntpeters/vim-better-whitespace'
" Turn on large (>20MB) file optimizations - use :Large/:Unlarge/:Large!
Plug 'vim-scripts/LargeFile'
" }}}

" Filetypes/file formats -------------------------------------------------- {{{
" Django
Plug 'vim-scripts/django.vim', {'for': 'django'}
Plug 'tweekmonster/django-plus.vim'
" Javascript
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" Add CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss']}
" CSS OmniComplete
Plug 'othree/csscomplete.vim', {'for': ['css', 'scss']}
" Better JSON
Plug 'tpope/vim-jdaddy', {'for': ['javascript', 'json']}
" Add csv plugin back in, now that it's been removed from vim-ployglot
Plug 'chrisbra/csv.vim', {'for': ['csv', 'tsv', 'psv']}
" Python
Plug 'vim-python/python-syntax', {'for': 'python'}
Plug 'tmhedberg/simpylfold', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
" HTML
Plug 'mattn/emmet-vim', {'for': 'html'}
" Terraform
Plug 'juliosueiras/vim-terraform-completion'
" TaskPaper
Plug 'mutewinter/taskpaper.vim'
" HCL
Plug 'fatih/vim-hclfmt'
" Tmux
Plug 'tmux-plugins/vim-tmux'
" MediaWiki
Plug 'chikamichi/mediawiki.vim'
" }}}

" Colorschemes ------------------------------------------------------------ {{{
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
" }}}

" Text objects ------------------------------------------------------------ {{{
" Use 'ia'/'aa' for arguments,
" or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
Plug 'wellle/targets.vim'
" Needed for vim-textobj-underscore
Plug 'kana/vim-textobj-user'
" Add af/if for functions, ac/ic for classes, [pf/[pc, ]pf/]pc
Plug 'bps/vim-textobj-python'
" Add al/il for lines
Plug 'kana/vim-textobj-line'
" Add a_/i_ for underscores
Plug 'lucapette/vim-textobj-underscore'
" - provides 'i' indent object (e.g. 'vai')
Plug 'michaeljsmith/vim-indent-object'
" }}}

" Search ------------------------------------------------------------------ {{{
" Plugin: incsearch ------------------------------------------------------- {{{
Plug 'haya14busa/is.vim'
let g:incsearch#magic = '\v'
" }}
" Plugin: vim-ferret ------------------------------------------------------ {{{
Plug 'wincent/ferret'
" }}}

Plug 'haya14busa/vim-asterisk'
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
let g:asterisk#keeppos = 1
" }}}

" Buffers ----------------------------------------------------------------- {{{
Plug 'moll/vim-bbye'
" Plugin: vim-sayonara ---------------------------------------------------- {{{
Plug 'mhinz/vim-sayonara'
nnoremap <C-c><C-c> <ESC>:Sayonara<CR>
nnoremap <C-c><C-d> <ESC>:Sayonara<CR>
" }}}
" }}}

" Async ------------------------------------------------------------------- {{{
" Add dispatch back in, so that Fugitive can use it
Plug 'tpope/vim-dispatch'
" }}}

" Miscellaneous ----------------------------------------------------------- {{{
" Enable local vim settings files
Plug 'embear/vim-localvimrc'

" Plugin: vimwiki --------------------------------------------------------- {{{
Plug 'vimwiki/vimwiki'
let s:wiki = {}
let s:wiki.path = '~/vimwiki/'
let s:wiki.auto_tags = 1
let s:wiki.syntax = 'markdown'
let s:wiki.ext = '.mdw'
let s:wiki.nested_syntaxes = {'python': 'python', 'sql': 'sql'}
let g:vimwiki_list = [s:wiki]
" }}}
" Plugin: Notational FZF -------------------------------------------------- {{{
Plug 'https://github.com/Alok/notational-fzf-vim'
let g:nv_search_paths = ['~/Dropbox/Notes', '~/vimwiki']
let g:nv_use_short_pathnames = 1
nnoremap <c-n> <ESC>:NV<space>
" }}}

" }}}

call plug#end()
" }}}
" }}}
" }}}
" }}}
" Useful variables -------------------------------------------------------- {{{
let g:isMac = has('macunix')
let g:isUnix = has('unix') && ! has('macunix')
let g:isWindows = has('win32')

" }}}
" Basic settings ---------------------------------------------------------- {{{

" Miscellaneous settings
set encoding=utf-8                " UTF-8 everywhere
set termencoding=utf-8            " UTF-8 everywhere
scriptencoding utf-8              " UTF-8 everywhere
set t_RV= ttymouse=xterm2         " Fix a 'Vim inserts spurious 'c' when editing via ssh' problem
set clipboard=unnamedplus,unnamed,exclude:cons\|linux           " Use the system clipboard for copy/paste
set ttyfast                       " Tell Vim we're using a fast connection - smoother redraws
set backspace=indent,eol,start    " Backspace over everything in insert mode
set writebackup                   " Use a backup file just for the purposes of saving
set backupcopy=yes                " using 'auto'/'no' may cause file-watching programs to not see changes
set history=10000                 " Keep 10000 lines of command line history
set undolevels=10000              " Keep lots of undo
set ruler                         " Show the cursor position all the time
set showcmd                       " Display incomplete commands
set display=lastline,uhex         " Show unprintables as hex and show as much of last line as possible
set lazyredraw                    " Set lazy redraw, to speed up macros and the like
set sessionoptions+=winpos,resize " Save window positions and sizes as well
set hidden                        " Allow movement to another buffer w/o saving the current one
set showmatch                     " Show matching bracket
set matchtime=3                   " (for only 0.3s)
set confirm                       " Get confirmation before we do anything stupid
set whichwrap+=<,>,[,],h,l        " <left> and <right> move over line endings
set visualbell                    " Flash instead of beeping
set browsedir=current             " Open up the file-browser in the current directory
set termencoding=utf-8            " And set UTF-8 for the terminal too
set nobomb                        " Don't write a Byte Order Mark
set matchpairs+=<:>               " Match angle-brackets as well by default
set linebreak                     " Break lines at a sensible place
set noerrorbells                  " Error bells are annoying
set title                         " Set descriptive window/terminal title
set report=0                      " Report any lines changed
set printoptions=paper:A4         " (even though almost all prints go to PDF anyway)
set splitright                    " When splitting vertically, split to the right
set splitbelow                    " When splitting horizontally, split below
set scrolloff=3                   " Don't go right to the edge of the window when scrolling
set sidescroll=1                  " scroll one character at a time to reveal more text as needed
set sidescrolloff=5               " Lines visible to the left/right of cursor when scrolling
set laststatus=2                  " Always show a status line
set modeline modelines=10         " Use modelines within first 10 lines
set autowrite                     " Write file before some commands
set wildmenu                      " Enable wildmenu for completion
set wildmode=longest:full,full    " Complete the next full match
set synmaxcol=250                 " Don't syntax-colour long lines (too slow otherwise)
set virtualedit=all               " Allow the cursor to move to 'invalid' places
set complete=.,w,b,t              " Complete current buffer, other windows, other buffers and tags
set cmdheight=2                   " Avoid 'Press Enter' messages
set fillchars=diff:⣿,vert:│       " Have different vertical splits for diffs
set switchbuf=useopen             " Jump to first open window containing buffer (if possible)
set diffopt=filler,iwhite         " show filler lines and ignore whitespace
set breakindent                   " indent wrapped lines
set noshowmode                    " lightline shows this for us
set spellfile=~/.vim/custom-dictionary.utf-8.add
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Mouse
set mouse=a                     " Enable the mouse for all modes
set mousehide                   " Hide mouse while typing
set mousemodel=popup            " Use popup menu for right mouse button

set formatoptions+=c   " Auto-wrap comments
set formatoptions+=n   " Recognize numbered lists
set formatoptions+=o   " Insert comment leader after 'o' or 'O'
set formatoptions+=q   " Allow formatting of comments with 'gq'
set formatoptions+=r   " Insert comment leader after <Enter>
set formatoptions-=t   " break comment-lines at &textwidth, but not code
" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

set shortmess=aTItO
"             |||||
"             ||||+-- Message for reading file overwrites previous
"             |||+--- Truncate file at start if too long
"             ||+---- Disable intro message
"             |+----- Truncate messages in the middle if too long
"             +------ Shortcut for various status line options

set viminfo='1000,<1000,h
"           |     |     |
"           |     |     +-- Don't restore hlsearch on startup
"           |     +-------- Keep N lines for each register
"           +-------------- Keep marks for N files

set completeopt+=menuone   " use popup menu even if only one completion match
set completeopt+=noinsert  " don't insert until I make a selection
set completeopt-=preview   " don't show the preview window

" }}}
" Clipboard --------------------------------------------------------------- {{{
if g:isMac
  set clipboard^=unnamed
elseif g:isUnix
  set clipboard^=unnamedplus
elseif g:isWindows
  set clipboard^=unnamedplus
endif
" }}}
" Colors/GUI -------------------------------------------------------------- {{{

if has('gui_running')
  set background=dark
  colorscheme palenight

  set guioptions=egmt
  set lines=60
  set columns=180

  if g:isMac
    set guifont=Input\ Mono:h11
    set fuoptions=maxvert,maxhorz
  elseif g:isUnix
    set guifont=Bitstream\ Vera\ Sans\ Mono:h10
    set guioptions-=m
  elseif g:isWindows
    set guifont=Consolas:h12
    set guioptions-=m
  endif
else
  if &t_Co >= 256
    if $ITERM_PROFILE ==# 'Light'
      colorscheme PaperColor
      set background=light
    else
      colorscheme gruvbox
      set background=dark
    endif
  else
    colorscheme darkblue
  endif

  " restore screen after quitting
  if has('terminfo')
    let &t_Sf='\ESC[3%p1%dm'
    let &t_Sb='\ESC[4%p1%dm'
  else
    let &t_Sf='\ESC[3%dm'
    let &t_Sb='\ESC[4%dm'
  endif

  " don't clear background color
  set t_ut=
endif

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has('gui_running')
    syntax on
    syntax sync fromstart
endif

if exists('+colorcolumn')
    set colorcolumn=80
else
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/
endif
" }}}
" Tabs -------------------------------------------------------------------- {{{
" For an explanation of the 'tabs vs spaces' used below, see
" <http://www.jwz.org/doc/tabs-vs-spaces.html>
set shiftwidth=4                " # spaces for autoindent steps
set shiftround                  " Always round to a multiple of 'shiftwidth'
set tabstop=4                   " Tabs = 4 spaces, but 'expandtab' *must* be set
set softtabstop=4               " # spaces that a tab counts for
set expandtab                   " Turn all tabs to spaces on save
set smarttab                    " Use 'shiftwidth' spaces instead of tabs
set autoindent                  " Copy indent from current line when starting a new one
filetype plugin indent on

" }}}
" Searching --------------------------------------------------------------- {{{
set ignorecase                  " Ignore case when searching
set infercase                   " Make completions smarter about cases
set smartcase                   " Override 'ignorecase' when needed
set incsearch                   " Show search matches as you type

" Search current word without moving cursor
nnoremap<silent> <leader>k :let stay_star_view = winsaveview()<cr>:set hls!<cr>*:call winrestview(stay_star_view)<cr>

augroup nohighlight
    autocmd!
    autocmd VimEnter * nohls
augroup END

" Use tab and shift-tab to move between matches while in search ('/') mode
cnoremap <expr>  <tab>    getcmdtype() =~ '[?/]' ? '<c-g>' : feedkeys('<tab>', 'int')[1]
cnoremap <expr>  <s-tab>  getcmdtype() =~ '[?/]' ? '<c-t>' : feedkeys('<s-tab>', 'int')[1]

" }}}
" Command window ---------------------------------------------------------- {{{
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
" }}}
" Help -------------------------------------------------------------------- {{{
" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

" Disable "F1 for help"
nnoremap <F1> <nop>
" }}}
" Folding ----------------------------------------------------------------- {{{
set foldenable                  " Enable folds
set foldnestmax=1               " Only go 1 levels deep
set foldlevel=99                " By default, show them all though
                                " The following open closed folds
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldcolumn=1                " Show the foldcolumn

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
    let s:line = getline(v:foldstart)

    let s:nucolwidth = &foldcolumn + &number * &numberwidth
    let s:windowwidth = winwidth(0) - s:nucolwidth - 3
    let s:foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let s:onetab = strpart('          ', 0, &tabstop)
    let s:line = substitute(s:line, '\t', s:onetab, 'g')

    let s:line = strpart(s:line, 0, s:windowwidth - 2 -len(s:foldedlinecount))
    let s:fillcharcount = s:windowwidth - len(s:line) - len(s:foldedlinecount)
    return s:line . '…' . repeat(' ',s:fillcharcount) . s:foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}
" File loading ------------------------------------------------------------ {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
augroup restoreposition
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

" Fileformats
" For any given OS, prefer its native fileformat for new files
if g:isUnix || g:isMac
    set fileformats=unix,dos,mac
else
   set fileformats=dos,unix,mac
endif

if g:isWindows
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*\\bin\\*,*\\pkg\\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/bin/*,*/pkg/*
endif
set wildignore+=*.pdf,*.zip,*.so                 " binaries
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX nonsense
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc,*.pyo                      " Python byte code

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" }}}
" Undo -------------------------------------------------------------------- {{{
" Trailing double slashes on directory names below cause Vim to save the
" full path to each file, but with slashes escaped - means we can have
" backup/undo files with the same names in multiple directories and keep
" them distinct
if exists('+undofile')
    if g:isWindows
        if !isdirectory(expand('~/vimfiles/tmp/undo'))
            !mkdir ~/vimfiles/tmp
            !mkdir ~/vimfiles/tmp/undo
        endif
        set backupdir=~/vimfiles/tmp// " where to put backup files
        set directory=~/vimfiles/tmp// " directory to place swap files in
        set undodir=~/vimfiles/undo// " where to put undo files
    else
        if !isdirectory(expand('~/.vim/tmp/undo'))
            !mkdir -p ~/.vim/tmp/undo
        endif
        set backupdir^=~/.vim/tmp// " Backups are written to ~/.vim/tmp/ if possible
        set directory^=~/.vim/tmp// " Swapfiles are also written to ~/.vim/tmp too
        set undodir^=~/.vim/tmp/undo//,/tmp//
    endif

    set backup
    set undofile
    " Make Vim able to edit crontab files again.
    set backupskip=/tmp/*,/private/tmp/*"
    set noswapfile
    set backupskip= " There are no files that shouldn't be backed up.
    set updatetime=750 " Write swap files after 0.75 seconds of inactivity.
    " Drop an undo breakpoint so I can recover from insert-mode ctrl-w's
    inoremap <c-w> <c-g>u<c-w>
endif

" }}}
" Display options --------------------------------------------------------- {{{
" Use better looking listchars if they are supported
if has('multi_byte')
    set listchars=tab:»\ ,extends:›,precedes:‹,trail:·,nbsp:‗,eol:$
    let &showbreak = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
else
    set listchars=tab:>\ ,extends:>,precedes:<,trail:-,nbsp:%,eol:$
endif

" Pop-up menu colors
highlight Pmenu guibg=yellow guifg=black
highlight PmenuSel guibg=white guifg=black

" Toggle line numbers on, to relative line numbers, then off
function! ToggleNumbers()
    if &number
        set nonumber
        set showbreak=
    elseif &relativenumber
        set number
        set showbreak=\ \ \ \ \ \ \ \
    else
        set relativenumber
        set showbreak=\ \ \ \ \ \ \ \
    endif
endfunction

augroup numbering
    autocmd!
    autocmd FocusLost * :set nonumber
    autocmd FocusGained * :set relativenumber
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
augroup END

" Trailing whitespace - only shown when not in insert mode
augroup trailing
    autocmd!
    autocmd InsertEnter * :set listchars-=trail:⌴
    autocmd InsertLeave * :set listchars+=trail:⌴
    " Clear trailing whitespace in selected file types on save
    autocmd BufWritePre *.py,*.js,*.sh,*.html,*.css,*.scss :%s/\s\+$//e
augroup END

" Cursorline/column
" Only show cursorline in the current window and in normal mode.
" Only show colorcolumn in the current window
augroup clinecol
    autocmd!
    autocmd CursorHold * setlocal cursorline cursorcolumn
    autocmd CursorMoved,InsertEnter *
        \ if &l:cursorline | setlocal nocursorline nocursorcolumn | endif
augroup END

augroup linenumbers
    autocmd!
    autocmd WinEnter * :setlocal number
    autocmd WinLeave * :setlocal nonumber
augroup END

" Resize splits when the window is resized

augroup resized
    autocmd!
    au VimResized * exe "normal! \<c-w>="
augroup END
if &diff
    "I'm only interested in diff colours
    syntax off
endif

" }}}
" Mappings ---------------------------------------------------------------- {{{
" Swap the behaviour of j/k with gj/gk - i.e. j/k always move by screenlines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Miscellaneous
" <leader>cd      cd to the directory of the current buffer
nnoremap <leader>cd :lcd %:h<CR>

" Moves the character under the cursor to the end of the line.
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" Quickly select text you just pasted
noremap gV `[v`]

" Move to paragraph lines, not the spaces between them
nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'

" Toggles ----------------------------------------------------------------- {{{
nnoremap <leader>e :set expandtab! expandtab?<CR>
let g:line_number_mode = 0 " when on also don't mix wrapped lines and linenumbers
nnoremap <leader>1 :call ToggleNumbers()<CR>
set pastetoggle=<localleader>p

" }}}
" Compiling --------------------------------------------------------------- {{{
nnoremap <leader>cc :w<CR>:copen 6<CR><C-w>p:make<CR>
nnoremap <leader>co :copen 6<CR>
nnoremap <leader>cl :cclose<CR>

" }}}
" Buffers ----------------------------------------------------------------- {{{
inoremap <D-s> <c-o>:w<CR>
nnoremap <D-s> :w<CR>

set wildcharm=<tab>
" }}}
" Windows ----------------------------------------------------------------- {{{
" Tmux-like split panes navigation
noremap <C-W>\| :vsplit<CR><C-W>l
noremap <C-W>- :split<CR><C-W>j
noremap <C-W><C-W> <C-W>w
" }}}
" Lines ------------------------------------------------------------------- {{{
" Keep the cursor in place while joining lines using 'J'
nnoremap J mzJ`z
" }}}
" }}}
" Arrow keys -------------------------------------------------------------- {{{
" Repurpose arrow keys to move lines
" Arrow key remapping:
" Up/Dn = move line up/dn
" Left/Right = indent/unindent
" Normal mode
nnoremap <silent> <Left> <<
nnoremap <silent> <Right> >>
nnoremap <silent> <Up>   :<C-u>move-2<CR>==
nnoremap <silent> <Down> :<C-u>move+<CR>==

" Visual mode
vnoremap <silent> <Left> <gv
vnoremap <silent> <Right> >gv
vnoremap <silent> <Up>   :move-2<CR>gv=gv
vnoremap <silent> <Down> :move'>+<CR>gv=gv

" Insert mode
inoremap <silent> <Left> <C-D>
inoremap <silent> <Right> <C-T>
inoremap <silent> <Up>   <C-o>:move-2<CR>gv=gv
inoremap <silent> <Down> <C-o>:move'>+<CR>gv=gv
" }}}
" Vim editing ------------------------------------------------------------- {{{
nnoremap <leader>v :e ~/src/dotfiles/vimrc<cr>:lcd ~/src/dotfiles<cr>

augroup VimFiles
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup end

" automatically source the .vimrc file if I change it
" the bang (!) forces it to overwrite this command rather than stack it
augroup autosourcevimrc
    autocmd!
    autocmd BufWritePost .vimrc :source ~/.vimrc
    autocmd BufWritePost vimrc :source ~/.vimrc
augroup END

" }}}
" Autocommands ------------------------------------------------------------ {{{
" make Vim respect relative paths for file completion
augroup InsertBehavior
    autocmd!
    autocmd InsertEnter * let b:save_cwd = getcwd() | lcd %:p:h
    autocmd InsertLeave * execute 'cd' fnameescape(b:save_cwd)
augroup END

" Autocomplete ------------------------------------------------------------ {{{
augroup setdictionary
    autocmd!
    autocmd FileType * exe('setlocal dictionary+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')
augroup END

" }}}
" Filetype-specific actions ----------------------------------------------- {{{
" Bunch of stuff lifted from Tim Pope's vimrc
augroup FTMisc
    autocmd!
    autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
augroup END

" }}}
" Filetype-specific settings ---------------------------------------------- {{{
augroup FTOptions
    autocmd!
    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
augroup END
" }}}

" Makefile settings ------------------------------------------------------- {{{
" Make the tab key do actual tab characters for makefiles.
augroup makefile
    autocmd!
    autocmd BufNewFile,Bufread *akefile call <SID>MakefileSettings()

    " Settings for Makefile-like things
    function! s:MakefileSettings()
        set noexpandtab " don't use spaces to indent
        set nosmarttab  " don't ever use spaces, not even at line beginnings
    endfunction

    autocmd QuickFixCmdPost make cwindow
augroup END
" }}}
" }}}
" Server-local settings: mostly used to disable plugins ------------------- {{{
if filereadable('~/.vimrc.local')
    source ~/.vimrc.local
end
" }}}
