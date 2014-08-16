" Preamble ---------------------------------------------------------------- {{{

set nocompatible            " Use Vim settings, rather then Vi settings.
                            " Must be first, because it changes other options
filetype off                " Needed for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle mange Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" }}}
" Plugins ----------------------------------------------------------------- {{{

" Utilities/dependencies
Plugin 'xolox/vim-misc'
Plugin 'tpope/vim-sleuth'

" Completion
Plugin 'SirVer/ultisnips'
" Ultisnips snippets are now stored in honza/vim-snippets
Plugin 'honza/vim-snippets'
Plugin 'kana/vim-smartinput'

" Coding
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'

" Navigation
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'

" Tags
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-easytags'

" Editing
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-table-mode'
if v:version > 703 || v:version == 703 && has("patch584")
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'tomtom/tcomment_vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'

" Display
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ZoomWin'
Plugin 'kshenoy/vim-signature'
Plugin 'bling/vim-airline'
Plugin 'mhinz/vim-signify'

" System / program integration
Plugin 'sjl/clam.vim'
Plugin 'sjl/vitality.vim'
Plugin 'sjl/tslime.vim'
Plugin 'LargeFile'
Plugin 'tpope/vim-dispatch'
Plugin 'szw/vim-tags'
Plugin 'christoomey/vim-tmux-navigator'

" Filetypes/file formats
Plugin 'tpope/vim-abolish'
Plugin 'django.vim'
       " Javascript
Plugin 'marijnh/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'

" Colorschemes
Plugin 'dhruvasagar/vim-railscasts-theme'
Plugin 'Slava/vim-colors-tomorrow'
if has('gui')
    " Needed for pre 7.3 vims
    Plugin 'CSApprox'
end

" Experimental
Plugin 'tpope/vim-eunuch'
Plugin 'junegunn/vim-easy-align'
Plugin 'sheerun/vim-polyglot'
Plugin 'mattn/emmet-vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'osyo-manga/vim-over'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-markdown'

" Swap out easymotion for vim-sneak
Plugin 'justinmk/vim-sneak'

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

" Add new text objects
Plugin 'wellle/targets.vim'

" Swap text using cx...
Plugin 'tommcdo/vim-exchange'

" Expand text regions
Plugin 'terryma/vim-expand-region'

" Semi-automatic sessions
Plugin 'tpope/vim-obsession'

" Jinja syntax
Plugin 'Glench/Vim-Jinja2-Syntax'

" Salt syntax/ftplugin
Plugin 'saltstack/salt-vim'

" Fencview - autodetect CJK and Unicode file encodings
Plugin 'fencview.vim'

" 'Dash' plugin
Plugin 'rizzatti/dash.vim'

" 'splitjoin' plugin
Plugin 'AndrewRadev/splitjoin.vim'

" Provides easy code formatting in Vim by integrating existing code formatters.
Plugin 'Chiel92/vim-autoformat'

" 'Pulse' search results
Plugin 'inside/vim-search-pulse'

" Add CSS3 syntax highlighting
Plugin 'hail2u/vim-css3-syntax'

" Rainbow parentheses/braces/brackets
Plugin 'kien/rainbow_parentheses.vim'

" Better JSON
Plugin 'elzr/vim-json'

" More better JSON
Plugin 'tpope/vim-jdaddy'

" Handles bracketed-paste-mode in vim (aka. automatic `:set paste`)
Plugin 'ConradIrwin/vim-bracketed-paste'

" color hex codes and color names
Plugin 'chrisbra/Colorizer'

" Always have a nice view for vim split windows
Plugin 'zhaocai/GoldenView.Vim'

call vundle#end()
filetype plugin indent on       " Needed for Vundle
