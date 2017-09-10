" Preamble ---------------------------------------------------------------- {{{

" vint: -ProhibitSetNoCompatible
set nocompatible            " Use Vim settings, rather then Vi settings.
                            " Must be first, because it changes other options
call plug#begin('~/.vim/bundle')
" }}}

" Version-dependent plugins ----------------------------------------------- {{{
if v:version >= 704
    " Completion
    Plug 'SirVer/ultisnips'
    " Ultisnips snippets are now stored in honza/vim-snippets
    Plug 'honza/vim-snippets'

    " Tags
    Plug 'majutsushi/tagbar'
    " - auto-create 'tags' files - to disable per-directory, create a .notags file
    Plug 'ludovicchabant/vim-gutentags'
endif
" }}}

" Mac-specific plugins ---------------------------------------------------- {{{
if has('macunix')
    " Navigation
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

    " - use <leader>vp to prompt for a command, <leader>vl to re-run,
    "   <leader>vq to close tmux window
    Plug 'benmills/vimux'
    " - allow window nav to work across non-vim tmux panes (needs tmux config too)
    Plug 'christoomey/vim-tmux-navigator'
    " vim-tmux-focus-events
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " 'Writing' plugins
    Plug 'reedes/vim-pencil', {'for': ['text', 'markdown']}
    " <c-x><c-k> insert-mode spell-check
    " <c-x><c-t> insert-mode thesaurus suggestions
    Plug 'reedes/vim-lexical', {'for': ['text', 'markdown']}
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

    Plug 'rizzatti/dash.vim'
endif
" }}}

" Navigation/filesystem --------------------------------------------------- {{{
" - netrw enhancement
Plug 'tpope/vim-vinegar'
" - use 'f{CHAR1}{CHAR2} to move to the first occurrence of CHAR1CHAR2'
Plug 'justinmk/vim-sneak'
" DidYouMean - avoid opening up new empty files if multiple completions
Plug 'EinfachToll/DidYouMean'
" Create directories and files at the same time
Plug 'vim-scripts/easydir.vim'
" Startup screen/session handling
Plug 'mhinz/vim-startify'
" - add :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
Plug 'tpope/vim-eunuch'
" Fencview - autodetect CJK and Unicode file encodings
Plug 'vim-scripts/fencview.vim'
" }}}

" Editing ----------------------------------------------------------------- {{{
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'tpope/vim-repeat'
" - use [space/]space to create empty lines above/below, [l/]l for lprev/lnext
"   [q/]q for cprev/cnext, [n/]n for prev/next diff block
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
" - 'ga<text-object>' to start in normal mode, or <cr> in visual mode
"   <number> or '*' for count, followed by character to align on
Plug 'junegunn/vim-easy-align'
" - use 'cx' to start/finish changes (e.g. 'cxiw')
Plug 'tommcdo/vim-exchange'
" - use <c-a>/<c-e> to increment/decrement visual ranges of numbers
Plug 'triglav/vim-visual-increment'
" - auto-update folds only as needed
Plug 'Konfekt/FastFold'
" Show registers temporarily
Plug 'junegunn/vim-peekaboo'
" Smart-insert closing parentheses/quotes, etc
Plug 'Raimondi/delimitMate'
" Speeddating - increment/decrement dates correctly
Plug 'tpope/vim-speeddating'
" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'ConradIrwin/vim-bracketed-paste'
" - snake_case (crs). MixedCase (crm), camelCase (crc), UPPER_CASE (cru)
Plug 'tpope/vim-abolish'
" }}}

" Code editing ------------------------------------------------------------ {{{
Plug 'tomtom/tcomment_vim'
" Syntax-checking
Plug 'w0rp/ale'
" 'splitjoin' plugin
" - use 'sj'/'sk' to split/join to/from multiple lines
Plug 'AndrewRadev/splitjoin.vim'
" Provides easy code formatting in Vim by integrating existing code formatters.
" - use <leader>f to autoformat code
Plug 'Chiel92/vim-autoformat'
" Vim-test
Plug 'janko-m/vim-test'
" }}}

" Git --------------------------------------------------------------------- {{{
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-github-dashboard'
Plug 'tpope/vim-rhubarb'
" }}}

" Display ----------------------------------------------------------------- {{{
" - use <leader>z to zoom to single window and back
Plug 'vim-scripts/ZoomWin'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'renyard/vim-git-flow-format'
" Rainbow parentheses/braces/brackets
Plug 'junegunn/rainbow_parentheses.vim'
" Always have a nice view for vim split windows
Plug 'zhaocai/GoldenView.Vim'
" Better display of whitespace - adds :StripWhitespace too
Plug 'ntpeters/vim-better-whitespace'
" Editorconfig support
Plug 'editorconfig/editorconfig-vim'
" - turn on large (>20MB) file optimizations - use :Large/:Unlarge/:Large!
Plug 'vim-scripts/LargeFile'
" }}}

" Filetypes/file formats -------------------------------------------------- {{{
" - add lots of language support on-demand
Plug 'sheerun/vim-polyglot', { 'do': './build' }
" Django
Plug 'vim-scripts/django.vim', {'for': 'django'}
Plug 'tweekmonster/django-plus.vim'
" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" Add CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax', {'for': ['css', 'scss']}
" CSS OmniComplete
Plug 'othree/csscomplete.vim', {'for': ['css', 'scss']}
" Better JSON
Plug 'elzr/vim-json', {'for': ['javascript', 'json']}
Plug 'tpope/vim-jdaddy', {'for': ['javascript', 'json']}
" Add csv plugin back in, now that it's been removed from vim-ployglot
Plug 'chrisbra/csv.vim', {'for': ['csv', 'tsv', 'psv']}
" Python
Plug 'davidhalter/jedi-vim', {'do': 'git submodule update --init', 'for': 'python'}
Plug 'vim-python/python-syntax', {'for': 'python'}
" Sass
Plug 'cakebaker/scss-syntax.vim'
" HTML
Plug 'mattn/emmet-vim', {'for': 'html'}
" Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
" TaskPaper
Plug 'mutewinter/taskpaper.vim'
" HCL
Plug 'fatih/vim-hclfmt'
" Tmux
Plug 'tmux-plugins/vim-tmux'
" }}}

" Colorschemes ------------------------------------------------------------ {{{
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
" }}}

" Text objects ------------------------------------------------------------ {{{
" - use 'ia'/'aa' for arguments,
"   or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
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
" - flash search results
Plug 'inside/vim-search-pulse'
" - improved incremental searching
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
" - use <leader>a to call rg/ag/ack/etc
Plug 'wincent/ferret'
" }}}

" Buffers ----------------------------------------------------------------- {{{
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-sayonara'
" }}}

" Async ------------------------------------------------------------------- {{{
" Add dispatch back in, so that Fugitive can use it
Plug 'tpope/vim-dispatch'
" AsyncRun
Plug 'skywind3000/asyncrun.vim'
" }}}

" Miscellaneous ----------------------------------------------------------- {{{
" Enable local vim settings files
Plug 'embear/vim-localvimrc'

" Vimwiki
Plug 'vimwiki/vimwiki'

" Mucomplete
Plug 'lifepillar/vim-mucomplete'
" }}}

call plug#end()
