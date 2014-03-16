" Preamble ---------------------------------------------------------------- {{{

set nocompatible            " Use Vim settings, rather then Vi settings.
                            " Must be first, because it changes other options
filetype off                " Needed for Vundle

set rtp+=~/.vim/bundle/vundle/
filetype off
call vundle#rc()

" let Vundle mange Vundle
" required!
Bundle 'gmarik/vundle'

" }}}
" Bundles ----------------------------------------------------------------- {{{

" Completion
Bundle 'SirVer/ultisnips'
Bundle 'kana/vim-smartinput'

" Coding
Bundle 'klen/python-mode'
Bundle 'scrooloose/syntastic'

" Navigation
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'

" Tags
Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-easytags'

" Editing
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-unimpaired'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
Bundle 'dhruvasagar/vim-table-mode'
" if v:version > 703 || v:version == 703 && has("patch584")
"     Bundle "Valloric/YouCompleteMe"
" endif
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
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-markdown'

" Swap out easymotion for vim-sneak
Bundle 'justinmk/vim-sneak'

" ----------------------------------------------------------------------------
" Adds gr command to replace text (takes a motion) similar to v(motion)p but
" also cuts text into black hole register so it is repeatable. So really it's
" similar to v(motion)"_p
" ----------------------------------------------------------------------------
Bundle 'ReplaceWithRegister'

" ColorV is a color view/pick/edit/design/scheme tool
Bundle 'Rykka/colorv.vim'
" needed for fetching schemes online.
Bundle 'mattn/webapi-vim'

" gitv is a 'gitk clone' plugin
" Usage:
"   :Gitv
Bundle 'gregsexton/gitv'

" vim-pentadactyl syntax
Bundle 'joedicastro/vim-pentadactyl'

" Add new text objects
Bundle 'wellle/targets.vim'

" Swap text using cx...
Bundle 'tommcdo/vim-exchange'

filetype plugin indent on       " Needed for Vundle

