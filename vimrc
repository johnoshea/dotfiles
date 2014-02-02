" .vimrc
" Author: John O'Shea <john.m.oshea@gmail.com>
" Source: <https://github.com/johnoshea/dotfiles>

" Server-local settings: mostly used to disable plugins
if filereadable('~/.vimrc.local')
    source ~/.vimrc.local
end

" For use as:
"    $ vim -u bundles.vim +BundleInstall +q
source ~/Code/dotfiles/bundles.vim
"TODO work out if I need a Mac-only local bundles setup

" }}}
" Basic settings ---------------------------------------------------------- {{{

" Miscellaneous settings
set t_RV= ttymouse=xterm2       " Fix a 'Vim inserts spurious 'c' when editing via ssh' problem
set ttyfast                     " Tell Vim we're using a fast connection - smoother redraws
set backspace=indent,eol,start  " Backspace over everything in insert mode
set writebackup                 " Use a backup file just for the purposes of saving
set history=5000                " Keep 5000 lines of command line history
set undolevels=10000            " Keep lots of undo
set ruler                       " Show the cursor position all the time
set showcmd                     " Display incomplete commands
set display=lastline,uhex       " Show unprintables as hex and show as much of last line as possible
set lazyredraw                  " Set lazy redraw, to speed up macros and the like
set sessionoptions+=winpos      " Save window positions as well
set hidden                      " Allow movement to another buffer w/o saving the current one
set clipboard=unnamed           " Use the system clipboard for copy/paste
set showmatch                   " Show matching bracket
set matchtime=3                 " (for only 0.3s)
set confirm                     " Get confirmation before we do anything stupid
set whichwrap+=<,>,[,]          " <left> and <right> move over line endings
set visualbell                  " Flash instead of beeping
set browsedir=current           " Open up the file-browser in the current directory
set encoding=utf-8              " UTF-8 please, this is the 21st century
set tenc=utf-8                  " And set UTF-8 for the terminal too
set matchpairs+=<:>             " Match angle-brackets as well by default
set linebreak                   " Break lines at a sensible place
set noerrorbells                " Error bells are annoying
set title                       " Set descriptive window/terminal title
set report=0                    " Report any lines changed
set printoptions=paper:A4       " (even though almost all prints go to PDF anyway)
set splitright                  " When splitting vertically, split to the right
set splitbelow                  " When splitting horizontally, split below
set scrolloff=3                 " Don't go right to the edge of the window when scrolling
set sidescrolloff=5             " Lines visible to the left/right of cursor when scrolling
set tabpagemax=128              " Maximum number of tabs open
set laststatus=2                " Always show a status line
set modeline modelines=10       " Use modelines within first 10 lines
set autowrite                   " Write file before some commands
set wildmenu                    " Enable wildmenu for completion
set wildmode=full               " Complete the next full match
set synmaxcol=2048              " Don't syntax-colour long lines (too slow otherwise)
set virtualedit=all             " Allow the cursor to move to 'invalid' places
set complete=.,w,b,t            " Complete current buffer, other windows, other buffers and tags
set cmdheight=2                 " Avoid 'Press Enter' messages
set fillchars=diff:⣿,vert:│     " Have different vertical splits for diffs
set switchbuf=useopen           " Jump to first open window containing buffer (if possible)
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

set formatoptions+=croqn
"                  |||||
"                  ||||+-- Recognize numbered lists
"                  |||+--- Allow formatting of comments with 'gq'
"                  ||+---- Insert comment leader after 'o' or 'O'
"                  |+----- Insert comment leader after <Enter>
"                  +------ Auto-wrap comments
" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
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

set completeopt=longest,menu,menuone,preview
"               |       |    |       + show extra information
"               |       |    +-- Show popup even with one match
"               |       +------- Use popup menu with completions
"               +--------------- Insert longest completion match


" }}}
" Keystrokes -------------------------------------------------------------- {{{
let mapleader=","
let maplocalleader="\\"

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

runtime macros/matchit.vim

" Swap the behaviour of j/k with gj/gk - i.e. j/k always move by screenlines
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" Miscellaneous
" w!!             Sudo-write a file
cnoremap w!! %!sudo tee > /dev/null %
" <leader>cd      cd to the directory of the current buffer
nnoremap <leader>cd :lcd %:h<CR>
" cd to Dropbox Notes dir (useful for Notational Velocity/Nebulous Notes)
nnoremap <leader>dn :lcd ~/Dropbox/Notes<cr>:CtrlP<cr>
" Calling applications
nnoremap <leader>ma :silent !open -a Marked.app '%:p'<cr>
" Disable "F1 for help"
nnoremap <F1> <nop>
" Open help in a vertical split instead of the default horizontal split
" http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev h <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'h')<cr>
cabbrev help <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vert h' : 'help')<cr>

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

" }}}
" Searching --------------------------------------------------------------- {{{
set ignorecase                  " Ignore case when searching
set smartcase                   " Override 'ignorecase' when needed
set incsearch                   " Show search matches as you type
set hlsearch                    " Highlight search results

" Open a Quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Ack integration
if executable('ag')
    let g:agprg = 'ag --nogroup --nocolor --column --smart-case'
    nnoremap <leader>a :Ag!<space>
    nnoremap <leader>A :Ag! <C-R><C-W><CR>

    " Ag for the last search.
    nnoremap <silent> <leader>/ :execute "Ag! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>
else
    if executable('ack')
        let g:ackprg="ack -H --nocolor --nogroup --column"
        nnoremap <leader>a :Ack<space>

        " Ack for the last search.
        nnoremap <silent> <leader>/ :execute "Ack! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>
    endif
endif

" Multi-line searching
" *	Multiline search (for whole words) forward
vnoremap <silent> * :<C-U>
                        \let old_reg=getreg('"')<bar>
                        \let old_regmode=getregtype('"')<cr>
                        \gvy/<C-R><C-R>=substitute(
                        \escape(@", '\\/.*$^~[]'), '\n', '\\n', 'g')<cr><cr>
                        \:call setreg('"', old_reg, old_regmode)<cr>
" #     Multiline search (for whole words) backward
vnoremap <silent> # :<C-U>
                        \let old_reg=getreg('"')<bar>
                        \let old_regmode=getregtype('"')<cr>
                        \gvy?<C-R><C-R>=substitute(
                        \escape(@", '\\/.*$^~[]'), '\n', '\\n', 'g')<cr><cr>
                        \:call setreg('"', old_reg, old_regmode)<cr>
" *     Multiline search forward
vnoremap <silent> g* :<C-U>
                        \let old_reg=getreg('"')<bar>
                        \let old_regmode=getregtype('"')<cr>
                        \gvy/<C-R><C-R>=substitute(
                        \escape(@", '\\/.*$^~[]'), '\_s\+', '\\_s\\+', 'g')<cr><cr>
                        \:call setreg('"', old_reg, old_regmode)<cr>
" #     Multiline search backward
vnoremap <silent> # :<C-U>
                        \let old_reg=getreg('"')<bar>
                        \let old_regmode=getregtype('"')<cr>
                        \gvy?<C-R><C-R>=substitute(
                        \escape(@", '\\/.*$^~[]'), '\_s\+', '\\_s\\+', 'g')<cr><cr>
                        \:call setreg('"', old_reg, old_regmode)<cr>

" }}}
" Folding ----------------------------------------------------------------- {{{
set foldenable                  " Enable folds
set foldmethod=marker           " Try using manual folds for a while
set foldnestmax=4               " Only go 4 levels deep
set foldlevel=4                 " By default, show them all though
                                " The following open closed folds
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
" Colors ------------------------------------------------------------------ {{{

source ~/.vim_colors
" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
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
" File loading ------------------------------------------------------------ {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Fileformats
" For any given OS, prefer its native fileformat for new files
if has("unix")
    set fileformats=unix,dos,mac
elseif has("win16") || has("win32") || has("win64") || has("win95")
    set fileformats=dos,unix,mac
elseif has("mac")
    set fileformats=mac,unix,dos
endif

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX nonsense
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" }}}
" Undo -------------------------------------------------------------------- {{{
" Trailing double slashes on directory names below cause Vim to save the
" full path to each file, but with slashes escaped - means we can have
" backup/undo files with the same names in multiple directories and keep
" them distinct
if exists('+undofile')
    if !isdirectory(expand("~/.vim/tmp/undo"))
        !mkdir -p ~/.vim/tmp/undo
    endif
    set backupdir^=~/.vim/tmp// " Backups are written to ~/.vim/tmp/ if possible
    set directory^=~/.vim/tmp// " Swapfiles are also written to ~/.vim/tmp too
    set undodir^=~/.vim/tmp/undo//,/tmp//
    set backup
    set undofile
    " Make Vim able to edit crontab files again.
    set backupskip=/tmp/*,/private/tmp/*"
    set noswapfile
    set backupskip= " There are no files that shouldn't be backed up.
    set updatetime=5000 " Write swap files after 5 seconds of inactivity.
    " Drop an undo breakpoint so I can recover from insert-mode ctrl-w's
    inoremap <c-w> <c-g>u<c-w>
endif

" }}}
" Searching --------------------------------------------------------------- {{{
autocmd VimEnter * nohls

" turn off highlighted results (set nohlsearch)
" just pressing n or N will turn the highlight back again
nnoremap <localleader>n :nohls<cr>

" Centre screen around searches
nnoremap n nzz
nnoremap n nzz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" But don't move on *
nnoremap * *<c-o>

" Find other occurrences of a word under the cursor
function! ChooseOccurrences()
    if len(expand('<cword>')) == 0
        return
    endif
    normal! [I
    let nr=input("Which one: ")
    if len(nr) == 0
        return
    endif
    execute "normal! ".nr."[\t"
endfunction
command! -nargs=0 ChooseOccurrences call ChooseOccurrences()

nnoremap <leader>ch :ChooseOccurrences<cr>

" }}}
" Display options --------------------------------------------------------- {{{
" Listchars
" Use better looking listchars if they are supported
if has("multi_byte")
    set listchars=tab:»\ ,extends:›,precedes:‹,trail:·,nbsp:‗,eol:$
    let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
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
    autocmd FocusLost * :set nonumber
    autocmd FocusGained * :set relativenumber
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber
augroup END

" Trailing whitespace - only shown when not in insert mode
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END

" Cursorline/column
" Only show cursorline in the current window and in normal mode.
" Only show colorcolumn in the current window
augroup clinecol
    au!
    autocmd CursorHold * setlocal cursorline cursorcolumn
    autocmd CursorMoved,InsertEnter *
        \ if &l:cursorline | setlocal nocursorline nocursorcolumn | endif
augroup END

augroup linenumbers
    autocmd WinEnter * :setlocal number
    autocmd WinLeave * :setlocal nonumber
augroup END

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" }}}
" Mappings ---------------------------------------------------------------- {{{
" Toggles ----------------------------------------------------------------- {{{
nnoremap <leader>sp :setlocal spell!<CR>
nnoremap <leader>w :setlocal wrap!<CR>
nnoremap <leader>l :setlocal list!<CR>
nnoremap <leader>e :set expandtab! expandtab?<CR>
let line_number_mode = 0 " when on also don't mix wrapped lines and linenumbers
nnoremap <leader>1 :call ToggleNumbers()<CR>
set pastetoggle=<localleader>p

" }}}
" Plugins ----------------------------------------------------------------- {{{
nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>z :ZoomWin<CR>
nnoremap <leader>ss :SessionSave<space>
nnoremap <leader>os :SessionOpen<space>
nnoremap <leader>T :CtrlPBufTag<CR>
nnoremap <leader>t :CtrlPTag<CR>
nnoremap ; :CtrlPBuffer<cr>
vnoremap <silent> <Enter> :EasyAlign<Enter>

" }}}
" Compiling --------------------------------------------------------------- {{{
nnoremap <leader>cc :w<CR>:copen 6<CR><C-w>p:make<CR>
nnoremap <leader>co :copen 6<CR>
nnoremap <leader>cl :cclose<CR>
nnoremap <leader>cf :cfirst<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprev<CR>

" }}}
" Buffers ----------------------------------------------------------------- {{{
nnoremap <D-Right> :bnext<CR>
nnoremap <D-Left> :bprev<CR>
inoremap <D-Right> <ESC>:bnext<CR>
inoremap <D-Left> <ESC>:bprev<CR>
nnoremap <C-c> <ESC>:bw<CR>
nnoremap <C-c><C-c> <ESC>:bw!<CR>
inoremap <C-c> <ESC>:bw<CR>
inoremap <C-c><C-c> <ESC>:bw!<CR>
inoremap <D-s> <ESC>:w<CR>i
nnoremap <D-s> :w<CR>

nnoremap gb :ls<CR>:b<Space>

set wildcharm=<C-z>
nnoremap <leader>f :b <C-z>

" }}}
" Windows ----------------------------------------------------------------- {{{
" Tmux-like split panes navigation
noremap <C-W>\| :vsplit<CR><C-W>l
noremap <C-W>- :split<CR><C-W>j
noremap <C-W><C-W> <C-W>w

" }}}
" Lines ------------------------------------------------------------------- {{{
inoremap <C-k> <Esc>O
" Keep the cursor in place while joining lines using 'J'
nnoremap J mzJ`z
" <ctrl>j         Join lines in insert mode
inoremap <C-j> <C-o>J

" }}}
" }}}
" Filetypes --------------------------------------------------------------- {{{
" CSS --------------------------------------------------------------------- {{{
augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less

    au Filetype less,css setlocal foldmethod=marker
    au Filetype less,css setlocal foldmarker={,}
    au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
    au Filetype less,css setlocal iskeyword+=-

    " Use <leader>S to sort properties.  Turns this:
    "
    "     p {
    "         width: 200px;
    "         height: 100px;
    "         background: red;
    "
    "         ...
    "     }
    "
    " into this:

    "     p {
    "         background: red;
    "         height: 100px;
    "         width: 200px;
    "
    "         ...
    "     }
    au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>

    " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
    " positioned inside of them AND the following code doesn't get unfolded.
    au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" }}}
" Django ------------------------------------------------------------------ {{{
augroup ft_django
    au!

    au BufNewFile,BufRead urls.py           setlocal nowrap
    au BufNewFile,BufRead urls.py           normal! zR
    au BufNewFile,BufRead dashboard.py      normal! zR
    au BufNewFile,BufRead local_settings.py normal! zR

    au BufNewFile,BufRead admin.py     setlocal filetype=python.django
    au BufNewFile,BufRead urls.py      setlocal filetype=python.django
    au BufNewFile,BufRead models.py    setlocal filetype=python.django
    au BufNewFile,BufRead views.py     setlocal filetype=python.django
    au BufNewFile,BufRead settings.py  setlocal filetype=python.django
    au BufNewFile,BufRead forms.py     setlocal filetype=python.django
    au BufNewFile,BufRead common_settings.py  setlocal filetype=python.django
augroup END

" }}}
" Text -------------------------------------------------------------------- {{{
augroup Text
    autocmd FileType text setlocal textwidth=78
    autocmd FileType text setlocal dictionary=/usr/share/dict/words
    autocmd FileType text setlocal spelllang=en_gb
    autocmd FileType text setlocal spell
    autocmd FileType text setlocal spellsuggest=10
augroup END

" }}}
" Fugitive ---------------------------------------------------------------- {{{
" Auto-clean fugitive buffers.
autocmd BufReadPost fugitive://* set bufhidden=delete

" }}}
" Zsh --------------------------------------------------------------------- {{{
" Correctly syntax highlight our various zsh-related files
autocmd BufEnter */oh-my-zsh/* setfiletype zsh
" }}}
" Json -------------------------------------------------------------------- {{{
nnoremap <leader>j !!python -mjson.tool<cr>
nnoremap <leader>J :%!python -mjson.tool<cr>
vnoremap <leader>j :!python -mjson.tool<cr>
" }}}
" }}}
" Arrow keys -------------------------------------------------------------- {{{
" Repurpose arrow keys to move lines
" Inspired by http://jeetworks.com/node/89
function! s:MoveLineUp()
    call <SID>MoveLineOrVisualUp(".", "")
endfunction

function! s:MoveLineDown()
    call <SID>MoveLineOrVisualDown(".", "")
endfunction

function! s:MoveVisualUp()
    call <SID>MoveLineOrVisualUp("'<", "'<,'>")
    normal gv
endfunction

function! s:MoveVisualDown()
    call <SID>MoveLineOrVisualDown("'>", "'<,'>")
    normal gv
endfunction

function! s:MoveLineOrVisualUp(line_getter, range)
    let l_num = line(a:line_getter)
    if l_num - v:count1 - 1 < 0
        let move_arg = "0"
    else
        let move_arg = a:line_getter." -".(v:count1 + 1)
    endif
    call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! s:MoveLineOrVisualDown(line_getter, range)
    let l_num = line(a:line_getter)
    if l_num + v:count1 > line("$")
        let move_arg = "$"
    else
        let move_arg = a:line_getter." +".v:count1
    endif
    call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
endfunction

function! s:MoveLineOrVisualUpOrDown(move_arg)
    let col_num = virtcol(".")
    execute "silent! ".a:move_arg
    execute "normal! ".col_num."|"
endfunction

" Arrow key remapping:
" Up/Dn = move line up/dn
" Left/Right = indent/unindent
function! SetArrowKeysAsTextShifters()
    " Normal mode
    nnoremap <silent> <Left> <<
    nnoremap <silent> <Right> >>
    nnoremap <silent> <Up> <Esc>:call <SID>MoveLineUp()<CR>
    nnoremap <silent> <Down> <Esc>:call <SID>MoveLineDown()<CR>

    " Visual mode
    vnoremap <silent> <Left> <gv
    vnoremap <silent> <Right> >gv
    vnoremap <silent> <Up> <Esc>:call <SID>MoveVisualUp()<CR>
    vnoremap <silent> <Down> <Esc>:call <SID>MoveVisualDown()<CR>

    " Insert mode
    inoremap <silent> <Left> <C-D>
    inoremap <silent> <Right> <C-T>
    inoremap <silent> <Up> <C-O>:call <SID>MoveLineUp()<CR>
    inoremap <silent> <Down> <C-O>:call <SID>MoveLineDown()<CR>
endfunction

call SetArrowKeysAsTextShifters()

" }}}
" Text formatting --------------------------------------------------------- {{{
" Change case
nnoremap <leader>U gUiw
nnoremap <leader>L guiw
inoremap <C-u> <esc>gUiwea
inoremap <C-l> <esc>guiwea

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" }}}
" Plugin settings --------------------------------------------------------- {{{
" Ultisnips --------------------------------------------------------------- {{{
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]

" }}}
" Airline ----------------------------------------------------------------- {{{
let g:airline_enable_branch = 1
let g:airline_enable_syntastic = 1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '␊ '
let g:airline_branch_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" }}}
" Yankstack --------------------------------------------------------------- {{{
let g:yankstack_map_keys = 0
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-P> <Plug>yankstack_substitute_newer_paste
imap <c-p> <c-o><Plug>yankstack_substitute_older_paste
imap <c-P> <c-o><Plug>yankstack_substitute_newer_paste

" }}}
" ctrlp ------------------------------------------------------------------- {{{
let g:path_to_matcher = "/usr/local/bin/matcher"
let g:ctrlp_map = '<c-t>'
let g:ctrlp_switch_buffer = 2
let g:ctrlp_use_caching = 1
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = expand("~/.vim/tmp")
let g:ctrlp_max_files = 10000
let g:ctrlp_clear_cache_on_exit = 0

if filereadable(g:path_to_matcher)
    let g:ctrlp_match_func = { 'match': 'GoodMatch' }
endif

if has("unix")

    if executable('ag')
        " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_cmd_fallback = 'ag %s -l --nocolor -g "" | head -' . g:ctrlp_max_files
    else
        let g:ctrlp_user_cmd_fallback = 'find %s -type f | head -' . g:ctrlp_max_files
    endif

    let g:ctrlp_user_command = {
        \   'types': {
        \       1: ['.git', 'cd %s && git ls-files']
        \   },
        \   'fallback': g:ctrlp_user_cmd_fallback
        \ }
endif

let g:ctrlp_prompt_mappings = {
    \ 'PrtClearCache()':      ['<c-r>'],
\ }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  " Used by the 'matcher' program / ctrl-p add-on
  " Create a cache file if not yet exists
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is currently ignored. In the future, we should probably do
  " something about that. the matcher behaves like "full-line".
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")

endfunction


" }}}
" Fugitive ---------------------------------------------------------------- {{{
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
nnoremap <leader>gpl :Git pull origin master<CR>
nnoremap <leader>gps :Git push origin master<CR>

" }}}
" Tagbar ------------------------------------------------------------------ {{{
if(executable('/usr/local/bin/ctags'))  " Homebrew-installed ctags
    let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
elseif (executable('/usr/local/bin/exctags'))   " FreeBSD-port-installed ctags
    let g:tagbar_ctags_bin= '/usr/local/bin/exctags'
else
    let g:tagbar_ctags_bin= '/usr/bin/ctags'
endif

let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_expand = 0
let g:tagbar_singleclick = 1
let g:tagbar_usearrows = 1

" }}}
" Solarized --------------------------------------------------------------- {{{
let g:solarized_termcolors=256
let g:solarized_contrast = "high"
let g:solarized_termtrans = 0

" }}}
" Syntastic --------------------------------------------------------------- {{{
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_enable_balloons = 1
"TODO uncomment this next line if the check_on_open setting is unbearable
" let g:syntastic_disabled_filetypes = ['html', 'md']
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--max-complexity 12"
let g:syntastic_html_validator_parser='html5'

if !&diff
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_auto_jump = 0
endif

" }}}
" tslime ------------------------------------------------------------------ {{{
let g:tslime_ensure_trailing_newlines = 1
let g:tslime_normal_mapping = '<localleader>t'
let g:tslime_visual_mapping = '<localleader>t'
let g:tslime_vars_mapping = '<localleader>T'

" }}}
" vim-session ------------------------------------------------------------- {{{
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_default_to_last = 0
let g:session_command_aliases = 1
" }}}
" Clam -------------------------------------------------------------------- {{{
nnoremap ! :Clam<space>
vnoremap ! :ClamVisual<space>
" }}}
" Indent Guides ----------------------------------------------------------- {{{
let g:indent_guides_guide_size = 1
" }}}
" SuperTab ---------------------------------------------------------------- {{{
let g:SuperTabSetDefaultCompletionType = 'context'
let g:SuperTabDefaultCompletionType = '<C-Tab>'
" }}}
" YouCompleteMe ----------------------------------------------------------- {{{
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:SuperTabDefaultCompletionType = '<C-Tab>'
" }}}
" vim-sneak --------------------------------------------------------------- {{{
nmap f <Plug>SneakForward
xmap f <Plug>VSneakForward
nmap F <Plug>SneakBackward
xmap F <Plug>VSneakBackward
nmap s <Plug>SneakStreak

nmap <enter> <Plug>SneakNext
xmap <enter> <Plug>VSneakNext
nmap <bs> <Plug>SneakPrevious
xmap <bs> <Plug>VSneakPrevious
" }}}
" Python mode ------------------------------------------------------------- {{{
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting - Syntastic handles this
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Stop easytags complaining
let g:easytags_updatetime_warn = 0
" }}}
" }}}
" Vim editing ------------------------------------------------------------- {{{
nnoremap <leader>v :e ~/Code/dotfiles/vimrc<cr>:lcd ~/Code/dotfiles<cr>

" automatically source the .vimrc file if I change it
" the bang (!) forces it to overwrite this command rather than stack it
au! BufWritePost .vimrc :source ~/.vimrc
au! BufWritePost .gvimrc :source ~/.gvimrc
au! BufWritePost vimrc :source ~/.vimrc
au! BufWritePost gvimrc :source ~/.gvimrc

" }}}
" Text objects ------------------------------------------------------------ {{{
" Numbers - 'N' ----------------------------------------------------------- {{{
onoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
xnoremap N :<c-u>call <SID>NumberTextObject(0)<cr>
onoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap aN :<c-u>call <SID>NumberTextObject(1)<cr>
onoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>
xnoremap iN :<c-u>call <SID>NumberTextObject(1)<cr>

function! s:NumberTextObject(whole)
    normal! v

    while getline('.')[col('.')] =~# '\v[0-9]'
        normal! l
    endwhile

    if a:whole
        normal! o

        while col('.') > 1 && getline('.')[col('.') - 2] =~# '\v[0-9]'
            normal! h
        endwhile
    endif
endfunction

" }}}
" }}}
" Autocommands ------------------------------------------------------------ {{{
" Autocomplete ------------------------------------------------------------ {{{
autocmd FileType * exe('setlocal dictionary+='.$VIMRUNTIME.'/syntax/'.&filetype.'.vim')
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" }}}
" Filename -> filetype mappings ------------------------------------------- {{{
augroup FTCheck
    autocmd!
    autocmd BufNewFile,BufRead */apache2/[ms]*-*/* set ft=apache
    autocmd BufNewFile,BufRead /etc/udev/*.rules set ft=udev
    autocmd BufRead * if ! did_filetype() && getline(1)." ".getline(2).
            \ " ".getline(3) =~? '<\%(!DOCTYPE \)\=html\>' | setf html | endif
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
    autocmd BufNewFile,BufRead *vim_colors set ft=vim
    autocmd BufNewFile,BufRead smb.conf.master set ft=samba
augroup END

" }}}
" Filetype-specific actions ----------------------------------------------- {{{
" Bunch of stuff lifted from Tim Pope's vimrc
augroup FTMisc
    autocmd!

    autocmd BufNewFile */init.d/*
            \ if filereadable("/etc/init.d/skeleton") |
            \   0r /etc/init.d/skeleton |
            \   $delete |
            \   silent! execute "%s/\\$\\(Id\\):[^$]*\\$/$\\1$/eg" |
            \ endif |
            \ set ft=sh | 1

    autocmd BufNewFile  * let b:chmod_exe=1
    autocmd BufWritePre * if exists("b:chmod_exe") |
            \ unlet b:chmod_exe |
            \ if getline(1) =~ '^#!' | let b:chmod_new="+x" | endif |
            \ endif

    function! EnsureDirExists ()
      let required_dir = expand("%:h")
      if !isdirectory(required_dir)
        call mkdir(required_dir, 'p')
      endif
    endfunction
    autocmd BufWritePre * :call EnsureDirExists()

    autocmd BufWritePost,FileWritePost * if exists("b:chmod_new")|
            \ silent! execute "!chmod ".b:chmod_new." <afile>"|
            \ unlet b:chmod_new|
            \ endif

    autocmd BufWritePre,FileWritePre /etc/* if &ft == "dns" |
            \ exe "normal msHmt" |
            \ exe "gl/^\\s*\\d\\+\\s*;\\s*Serial$/normal ^\<C-A>" |
            \ exe "normal g`tztg`s" |
            \ endif
    autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif
augroup END

" }}}
" Filetype-specific settings ---------------------------------------------- {{{
augroup FTOptions
    autocmd!
    autocmd FileType c,cpp,cs,java          setlocal ai et sta sw=4 sts=4 cin
    autocmd FileType sh,csh,zsh             setlocal ai et sta sw=4 sts=4
    autocmd FileType perl,python            setlocal ai et sta sw=4 sts=4
    autocmd FileType markdown               setlocal ai et sta sw=2 sts=2 tw=72
    autocmd FileType javascript             setlocal ai et sta sw=2 sts=2 ts=2 cin isk+=$
    autocmd FileType apache,sql             setlocal ai et sta sw=4 sts=4
    autocmd FileType tex,css,scss           setlocal ai et sta sw=2 sts=2
    autocmd FileType html,xhtml             setlocal ai et sta sw=2 sts=2
    autocmd FileType xml,xsd,xslt           setlocal ai et sta sw=2 sts=2 ts=2
    autocmd FileType text,txt,mail          setlocal ai com=fb:*,fb:-,n:>
    autocmd FileType sh,zsh,csh             inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
    autocmd FileType perl,python,ruby       inoremap <silent> <buffer> <C-X>! #!/usr/bin/env <C-R>=&ft<CR>
    autocmd FileType sh,zsh,csh,tcsh,perl,python,ruby imap <buffer> <C-X>& <C-X>!<Esc>o <C-U># $I<C-V>d$<Esc>o <C-U><C-X>^<Esc>o <C-U><C-G>u
    autocmd FileType css  silent! setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType git,gitcommit setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitcommit,gitrebase setlocal colorcolumn=50,72
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitrebase nnoremap <buffer> S :Cycle<CR>
    " Don't spell check help
    autocmd FileType help setlocal nospell
    autocmd FileType help setlocal ai fo+=2n | silent! setlocal nospell
    autocmd FileType help nnoremap <silent><buffer> q :q<CR>
    autocmd FileType html setlocal iskeyword+=~
    autocmd FileType html let g:html_indent_inctags="head,html,body,p,head,table,tbody,div,script"
    autocmd FileType html let g:html_indent_script1="inc"
    autocmd FileType html let g:html_indent_style1="inc"
    autocmd FileType perl silent! compiler perl
    autocmd FileType text,txt setlocal tw=78 linebreak nolist
    autocmd FileType vim  setlocal ai et sta sw=4 sts=4 keywordprg=:help
    autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
    autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
augroup END

" Makefile settings ------------------------------------------------------- {{{
" Make the tab key do actual tab characters for makefiles.
autocmd BufNewFile,Bufread *akefile call <SID>MakefileSettings()

" Settings for Makefile-like things
function! s:MakefileSettings()
    set noexpandtab " don't use spaces to indent
    set nosmarttab  " don't ever use spaces, not even at line beginnings
endfunction

autocmd QuickFixCmdPost make cwindow
" }}}
" }}}
" }}}
