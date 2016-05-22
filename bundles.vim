" Preamble ----------------------------------------------------------------

" vint: -ProhibitSetNoCompatible
set nocompatible            " Use Vim settings, rather then Vi settings.
                            " Must be first, because it changes other options
call plug#begin('~/.vim/bundle')

"
" Plugins -----------------------------------------------------------------


if v:version >= 703
    " Show VCS diffs
    Plug 'mhinz/vim-signify'
endif

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

if has('macunix')
    " Navigation
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

    " - use <leader>vp to prompt for a command, <leader>vl to re-run,
    "   <leader>vq to close tmux window
    Plug 'benmills/vimux'
    " - allow window nav to work across non-vim tmux panes (needs tmux config too)
    Plug 'christoomey/vim-tmux-navigator'
    " vim-tmux-focus-events
    Plug 'tmux-plugins/vim-tmux-focus-events'

    " 'Writing' plugins
    Plug 'reedes/vim-pencil', {'for': ['text', 'markdown']}
    Plug 'reedes/vim-lexical', {'for': ['text', 'markdown']}
    Plug 'reedes/vim-litecorrect', {'for': ['text', 'markdown']}
    Plug 'reedes/vim-wordy', {'for': ['text', 'markdown']}
    Plug 'reedes/vim-textobj-quote', {'for': ['text', 'markdown']}
    Plug 'reedes/vim-textobj-sentence', {'for': ['text', 'markdown']}

    Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}
endif


" Smart-insert closing parentheses/quotes, etc
Plug 'kana/vim-smartinput'
" Syntax-checking
Plug 'scrooloose/syntastic'
" Utilities/dependencies
Plug 'tpope/vim-sleuth'
" - netrw enhancement
Plug 'tpope/vim-vinegar'
" - use 'f{CHAR1}{CHAR2} to move to the first occurrence of CHAR1CHAR2'
Plug 'justinmk/vim-sneak'

" Editing
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'tpope/vim-repeat'
" - use [space/]space to create empty lines above/below, [l/]l for lprev/lnext
"   [q/]q for cprev/cnext, [n/]n for prev/next diff block
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
" - use 'ga' to start EasyAlign
Plug 'junegunn/vim-easy-align'
" - use 'cx' to start/finish changes (e.g. 'cxiw')
Plug 'tommcdo/vim-exchange'
" - use <c-a>/<c-e> to increment/decrement visual ranges of numbers
Plug 'triglav/vim-visual-increment'
" - auto-update folds only as needed
Plug 'Konfekt/FastFold'

" Git
Plug 'tpope/vim-fugitive'

" Display
" - provides 'i' indent object (e.g. 'vai')
Plug 'michaeljsmith/vim-indent-object'
" - use <leader>z to zoom to single window and back
Plug 'ZoomWin'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'renyard/vim-git-flow-format'

" - turn on large (>20MB) file optimizations - use :Large/:Unlarge/:Large!
Plug 'LargeFile'
" - add :Remove, :Move, :Rename, :Chmod, :Mkdir, :Wall, :SudoWrite, :SudoEdit
Plug 'tpope/vim-eunuch'

" Filetypes/file formats
" - snake_case (crs). MixedCase (crm), camelCase (crc), UPPER_CASE (cru)
Plug 'tpope/vim-abolish'
" - close 'if' statements in sh, etc
Plug 'tpope/vim-endwise'
" - add lots of language support on-demand
Plug 'sheerun/vim-polyglot', { 'do': './build' }
" Django
Plug 'django.vim', {'for': 'django'}
" Javascript
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'gavocanov/vim-js-indent', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" Salt syntax/ftplugin
Plug 'saltstack/salt-vim'
" Add CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax', {'for': ['html', 'css', 'scss']}
" Better JSON
Plug 'elzr/vim-json', {'for': ['javascript', 'json']}
Plug 'tpope/vim-jdaddy', {'for': ['javascript', 'json']}
" Add csv plugin back in, now that it's been removed from vim-ployglot
Plug 'chrisbra/csv.vim', {'for': ['csv', 'tsv', 'psv']}
" Python
Plug 'davidhalter/jedi-vim', {'do': 'git submodule update --init', 'for': 'python'}
Plug 'hdima/python-syntax', {'for': 'python'}
" Sass
Plug 'cakebaker/scss-syntax.vim'
" HTML
Plug 'mattn/emmet-vim', {'for': 'html'}
" Twig
Plug 'johnoshea/vim-twig', {'for': ['html', 'twig']}


" Colorschemes
Plug 'romainl/Apprentice'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhinz/vim-janah'

" Add new text objects
" - use 'ia'/'aa' for arguments,
"   or i/a followed by any of , . ; : + - = ~ _ * # / | \ & $
Plug 'wellle/targets.vim'
" Needed for vim-textobj-underscore
Plug 'kana/vim-textobj-user'
" Add underscore text object - use a_ or i_
Plug 'lucapette/vim-textobj-underscore'

" Fencview - autodetect CJK and Unicode file encodings
Plug 'fencview.vim'

" 'splitjoin' plugin
" - use 'sj'/'sk' to split/join to/from multiple lines
Plug 'AndrewRadev/splitjoin.vim'

" Provides easy code formatting in Vim by integrating existing code formatters.
" - use <leader>f to autoformat code
Plug 'Chiel92/vim-autoformat'

" Search
" - flash search results
Plug 'inside/vim-search-pulse'
" - improved incremental searching
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
" - use <leader>a to call ag/ack/etc
Plug 'wincent/ferret'

" Rainbow parentheses/braces/brackets
Plug 'junegunn/rainbow_parentheses.vim'

" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'ConradIrwin/vim-bracketed-paste'

" Always have a nice view for vim split windows
Plug 'zhaocai/GoldenView.Vim'

" Speeddating - increment/decrement dates correctly
Plug 'tpope/vim-speeddating'

" Peekaboo - show registers while in insert mode
Plug 'junegunn/vim-peekaboo'

" DidYouMean - avoid opening up new empty files if multiple completions
Plug 'EinfachToll/DidYouMean'

" Better display of whitespace - adds :StripWhitespace too
Plug 'ntpeters/vim-better-whitespace'

" Create directories and files at the same time
Plug 'vim-scripts/easydir.vim'

" Startup screen/session handling
Plug 'mhinz/vim-startify'

" Buffers
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-sayonara'

" Add dispatch back in, so that Fugitive can use it
Plug 'tpope/vim-dispatch'

" Supertab
Plug 'ervandew/supertab'

" TaskList - use <localleader>t to call it up
Plug 'vim-scripts/TaskList.vim'

" Editorconfig support
Plug 'editorconfig/editorconfig-vim'

call plug#end()
