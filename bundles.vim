" Preamble ---------------------------------------------------------------- {{{

set nocompatible            " Use Vim settings, rather then Vi settings.
                            " Must be first, because it changes other options

call plug#begin('~/.vim/bundle')

" }}}
" Plugins ----------------------------------------------------------------- {{{

" Utilities/dependencies
Plug 'xolox/vim-misc'
Plug 'tpope/vim-sleuth'

" Completion
Plug 'SirVer/ultisnips'
" Ultisnips snippets are now stored in honza/vim-snippets
Plug 'honza/vim-snippets'
Plug 'kana/vim-smartinput'

" Coding
Plug 'scrooloose/syntastic'

" Navigation
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'

" Tags
Plug 'majutsushi/tagbar'
Plug 'xolox/vim-easytags'

" Editing
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'osyo-manga/vim-over'

" Git
Plug 'tpope/vim-fugitive'

" Display
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ZoomWin'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
Plug 'renyard/vim-git-flow-format'
" Show VCS diffs
Plug 'mhinz/vim-signify'

" System / program integration
Plug 'sjl/clam.vim'
Plug 'sjl/tslime.vim'
Plug 'LargeFile'
Plug 'szw/vim-tags'
Plug 'christoomey/vim-tmux-navigator'

" Filetypes/file formats
Plug 'tpope/vim-abolish'
Plug 'django.vim', {'for': 'django'}
" Javascript
Plug 'marijnh/tern_for_vim', {'for': 'javascript'}
Plug 'othree/yajs.vim', {'for': 'javascript'}
" Jade filetype support
Plug 'digitaltoad/vim-jade', {'for': ['jade']}
" Jinja syntax
Plug 'Glench/Vim-Jinja2-Syntax'
" Salt syntax/ftplugin
Plug 'saltstack/salt-vim'
" Add CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax', {'for': ['html', 'css', 'scss']}
" Better JSON
Plug 'elzr/vim-json', {'for': ['javascript', 'json']}
" More better JSON
Plug 'tpope/vim-jdaddy', {'for': ['javascript', 'json']}
" Nim(rod) support
Plug 'rhysd/nimrod.vim', {'for': ['nim', 'nimrod']}
" Add csv plugin back in, now that it's been removed from vim-ployglot
Plug 'chrisbra/csv.vim', {'for': ['csv', 'tsv', 'psv']}
" Python syntax
Plug 'hdima/python-syntax', {'for': ['python']}
" Docker syntax
Plug 'ekalinin/Dockerfile.vim', {'for': ['docker']}

" 'Writing' plugins
Plug 'kana/vim-textobj-user', {'for': ['text', 'markdown']}
Plug 'reedes/vim-pencil', {'for': ['text', 'markdown']}
Plug 'reedes/vim-lexical', {'for': ['text', 'markdown']}
Plug 'reedes/vim-litecorrect', {'for': ['text', 'markdown']}
Plug 'reedes/vim-wordy', {'for': ['text', 'markdown']}
Plug 'reedes/vim-textobj-quote', {'for': ['text', 'markdown']}
Plug 'reedes/vim-textobj-sentence', {'for': ['text', 'markdown']}

" Colorschemes
Plug 'romainl/Apprentice'
Plug 'NLKNguyen/papercolor-theme'

" Experimental
Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'

" Swap out easymotion for vim-sneak
Plug 'justinmk/vim-sneak'

" Add new text objects
Plug 'wellle/targets.vim'

" Fencview - autodetect CJK and Unicode file encodings
Plug 'fencview.vim'

" 'splitjoin' plugin
Plug 'AndrewRadev/splitjoin.vim'

" Provides easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'

" 'Pulse' search results
Plug 'inside/vim-search-pulse'

" Rainbow parentheses/braces/brackets
Plug 'kien/rainbow_parentheses.vim'

" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'ConradIrwin/vim-bracketed-paste'

" Always have a nice view for vim split windows
Plug 'zhaocai/GoldenView.Vim'

" Try jedi direct, rather than YouCompleteMe
Plug 'davidhalter/jedi-vim'

" Speeddating
Plug 'tpope/vim-speeddating'

" Peekaboo - show registers while in insert mode
Plug 'junegunn/vim-peekaboo'

" DidYouMean - avoid opening up new empty files if multiple completions
Plug 'EinfachToll/DidYouMean'

" Better display of whitespace
Plug 'ntpeters/vim-better-whitespace'

" Create directories and files at the same time
Plug 'vim-scripts/easydir.vim'

" Better QuickFix window handling
Plug 'yssl/QFEnter'

" EasyGrep
Plug 'vim-scripts/EasyGrep'

" Startup screen/session handling
Plug 'mhinz/vim-startify'

" Better buffer handling
Plug 'moll/vim-bbye'

" Add dispatch back in, so that Fugitive can use it
Plug 'tpope/vim-dispatch'

" Supertab
Plug 'ervandew/supertab'

" Sayonara buffer/window management
Plug 'mhinz/vim-sayonara'

" TaskList
Plug 'vim-scripts/TaskList.vim'

" Unicode
Plug 'chrisbra/unicode.vim'

call plug#end()
