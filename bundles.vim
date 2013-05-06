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
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'

" Tags
Bundle 'majutsushi/tagbar'
Bundle 'xolox/vim-easytags'

" Editing
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'maxbrunsfeld/vim-yankstack'
Bundle 'godlygeek/tabular'
Bundle 'dhruvasagar/vim-table-mode'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'

" Display
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'xolox/vim-session'
Bundle 'ZoomWin'
Bundle 'kshenoy/vim-signature'
Bundle "airblade/vim-gitgutter"

" System / program integration
Bundle 'sjl/clam.vim'
Bundle 'sjl/vitality.vim'
Bundle 'sjl/tslime.vim'
Bundle 'LargeFile'

" Filetypes/file formats
Bundle 'hallison/vim-markdown'
Bundle 'tpope/vim-abolish'
Bundle 'othree/html5.vim'
Bundle 'TWiki-Syntax'
Bundle 'django.vim'
Bundle 'csv.vim'
Bundle 'pangloss/vim-javascript'

" Colorschemes
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'
Bundle 'Zenburn'
Bundle 'dhruvasagar/vim-railscasts-theme'
if has('gui')
    " Needed for pre 7.3 vims
    Bundle 'CSApprox'
end

" Experimental
Bundle "paradigm/TextObjectify"
Bundle "tpope/vim-dispatch"
Bundle "szw/vim-tags"

filetype plugin indent on       " Needed for Vundle

