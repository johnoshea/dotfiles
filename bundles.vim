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
Plug 'dhruvasagar/vim-table-mode'
Plug 'tomtom/tcomment_vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Display
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ZoomWin'
Plug 'kshenoy/vim-signature'
Plug 'bling/vim-airline'
" Show VCS diffs
Plug 'mhinz/vim-signify'

" System / program integration
Plugin 'sjl/vitality.vim'
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
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}

" Colorschemes
if has('gui')
    " Needed for pre 7.3 vims
    Plugin 'CSApprox'
end
Plug 'romainl/Apprentice'

" Experimental
Plugin 'junegunn/vim-easy-align'
Plugin 'osyo-manga/vim-over'
Plug 'tpope/vim-eunuch'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'jmcantrell/vim-virtualenv', {'for': ['python', 'django']}
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown', {'for': 'markdown'}

" Swap out easymotion for vim-sneak

" ----------------------------------------------------------------------------
" Adds gr command to replace text (takes a motion) similar to v(motion)p but
" also cuts text into black hole register so it is repeatable. So really it's
" similar to v(motion)"_p
" ----------------------------------------------------------------------------
Plugin 'ReplaceWithRegister'

" gitv is a 'gitk clone' plugin
" Usage:
"   :Gitv
Plugin 'gregsexton/gitv'

" vim-pentadactyl syntax
Plugin 'joedicastro/vim-pentadactyl'
Plug 'justinmk/vim-sneak'

" Add new text objects

" Swap text using cx...
Plugin 'tommcdo/vim-exchange'

" Expand text regions
Plugin 'terryma/vim-expand-region'
Plug 'wellle/targets.vim'

" Semi-automatic sessions
Plug 'tpope/vim-obsession'

" Jinja syntax
Plug 'Glench/Vim-Jinja2-Syntax'

" Salt syntax/ftplugin
Plug 'saltstack/salt-vim'

" Fencview - autodetect CJK and Unicode file encodings

" 'Dash' plugin
Plugin 'rizzatti/dash.vim'
Plug 'fencview.vim'

" 'splitjoin' plugin
Plug 'AndrewRadev/splitjoin.vim'

" Provides easy code formatting in Vim by integrating existing code formatters.
Plug 'Chiel92/vim-autoformat'

" 'Pulse' search results
Plug 'inside/vim-search-pulse'

" Add CSS3 syntax highlighting
Plug 'hail2u/vim-css3-syntax', {'for': ['html', 'css', 'scss']}

" Rainbow parentheses/braces/brackets
Plug 'kien/rainbow_parentheses.vim'

" Better JSON
Plug 'elzr/vim-json', {'for': ['javascript', 'json']}

" More better JSON
Plug 'tpope/vim-jdaddy', {'for': ['javascript', 'json']}

" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plug 'ConradIrwin/vim-bracketed-paste'

" color hex codes and color names
Plug 'ap/vim-css-color', {'for': ['html', 'css', 'scss']}

" Always have a nice view for vim split windows
Plug 'zhaocai/GoldenView.Vim'

" Try jedi direct, rather than YouCompleteMe
Plug 'davidhalter/jedi-vim'

" Speeddating

" Try out spacegray colorscheme
Plugin 'ajh17/Spacegray.vim'
Plug 'tpope/vim-speeddating'

" Nim(rod) support
Plug 'rhysd/nimrod.vim', {'for': ['nim', 'nimrod']}

" SCSS support
Plug 'tpope/vim-haml', {'for': ['html', 'css', 'scss']}

" HTML5
Plug 'othree/html5.vim', {'for': ['html', 'css', 'scss']}

call plug#end()
