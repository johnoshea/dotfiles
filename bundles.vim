" Preamble ---------------------------------------------------------------- {{{

set nocompatible            " Use Vim settings, rather then Vi settings.
                            " Must be first, because it changes other options
filetype off                " Needed for Vundle

set rtp+=~/.vim/bundle/vundle/
filetype off
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" }}}
" Bundles ----------------------------------------------------------------- {{{

" Completion
" Supertab needs to load before UltiSnips
Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'
Bundle 'kana/vim-smartinput'

" Coding
Bundle 'klen/python-mode'
Bundle 'scrooloose/syntastic'

" Navigation
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'

" Tags
Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-easytags'

" Editing
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'godlygeek/tabular'
Bundle 'paradigm/TextObjectify'
Bundle 'dhruvasagar/vim-table-mode'
if v:version > 703 || v:version == 703 && has("patch584")
    Bundle "Valloric/YouCompleteMe"
endif
Bundle 'tomtom/tcomment_vim'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" Display
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'xolox/vim-session'
Bundle 'ZoomWin'
Bundle 'kshenoy/vim-signature'
Bundle 'bling/vim-airline'
Bundle 'mhinz/vim-signify'

" System / program integration
Bundle 'sjl/clam.vim'
Bundle 'sjl/vitality.vim'
Bundle 'sjl/tslime.vim'
Bundle 'LargeFile'
Bundle 'tpope/vim-dispatch'
Bundle 'szw/vim-tags'
Bundle 'christoomey/vim-tmux-navigator'

" Filetypes/file formats
Bundle 'tpope/vim-abolish'
Bundle 'TWiki-Syntax'
Bundle 'django.vim'
       " Javascript
Bundle 'marijnh/tern_for_vim'
Bundle 'jelera/vim-javascript-syntax'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'dhruvasagar/vim-railscasts-theme'
if has('gui')
    " Needed for pre 7.3 vims
    Bundle 'CSApprox'
end

" Utilities/dependencies
Bundle 'xolox/vim-misc'
Bundle 'tpope/vim-sleuth'

" Experimental
Bundle 'tpope/vim-eunuch'
Bundle 'junegunn/vim-easy-align'
Bundle 'sheerun/vim-polyglot'
Bundle 'mattn/emmet-vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'osyo-manga/vim-over'

filetype plugin indent on       " Needed for Vundle

