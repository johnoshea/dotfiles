" Preamble ---------------------------------------------------------------- {{{

set nocompatible            " Use Vim settings, rather then Vi settings.
                            " Must be first, because it changes other options

call plug#begin('~/.vim/bundle')

" }}}
" Plugins ----------------------------------------------------------------- {{{

" Utilities/dependencies
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
Plug 'tpope/vim-vinegar'
Plug 'justinmk/vim-sneak'

" Tags
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" Editing
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
" - use 'ga' to start EasyAlign
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-exchange'
Plug 'triglav/vim-visual-increment'
Plug 'Konfekt/FastFold'

" Git
Plug 'tpope/vim-fugitive'

" Display
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ZoomWin'
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'renyard/vim-git-flow-format'
" Show VCS diffs
Plug 'mhinz/vim-signify'

" System / program integration
Plug 'sjl/clam.vim'
Plug 'benmills/vimux'
Plug 'LargeFile'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-eunuch'

" Filetypes/file formats
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-endwise'
Plug 'sheerun/vim-polyglot'
" Django
Plug 'django.vim', {'for': 'django'}
" Javascript
Plug 'marijnh/tern_for_vim', {'for': 'javascript', 'do': 'npm install'}
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'gavocanov/vim-js-indent', {'for': 'javascript'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript'}
" Jade filetype support
Plug 'digitaltoad/vim-jade', {'for': ['jade']}
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
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'hdima/python-syntax', {'for': 'python'}
" Docker syntax
Plug 'ekalinin/Dockerfile.vim', {'for': 'docker'}
" Sass
Plug 'cakebaker/scss-syntax.vim'
" HTML
Plug 'mattn/emmet-vim', {'for': 'html'}
" Twig
Plug 'johnoshea/vim-twig', {'for': ['html', 'twig']}

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

" Add new text objects
Plug 'wellle/targets.vim'

" Fencview - autodetect CJK and Unicode file encodings
Plug 'fencview.vim'

" 'splitjoin' plugin
Plug 'AndrewRadev/splitjoin.vim'

" Provides easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'

" Search
Plug 'inside/vim-search-pulse'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'wincent/ferret'

" Rainbow parentheses/braces/brackets
Plug 'junegunn/rainbow_parentheses.vim'

" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'ConradIrwin/vim-bracketed-paste'

" Always have a nice view for vim split windows
Plug 'zhaocai/GoldenView.Vim'

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

" Startup screen/session handling
Plug 'mhinz/vim-startify'

" Buffers
Plug 'moll/vim-bbye'
Plug 'mhinz/vim-sayonara'

" Add dispatch back in, so that Fugitive can use it
Plug 'tpope/vim-dispatch'

" Supertab
Plug 'ervandew/supertab'

" TaskList
Plug 'vim-scripts/TaskList.vim'


call plug#end()
