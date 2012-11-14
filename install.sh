#!/bin/sh

if [ x"$1" = x"new" ]; then
    REMOVE_EXISTING=1
fi

# Bail if anything's unset
set -e
set -u

echo "Checking out repos"
test -d ~/.oh-my-zsh || git clone https://github.com/johnoshea/oh-my-zsh.git ~/Code/oh-my-zsh

if [ ${REMOVE_EXISTING} ]; then
    echo "Removing existing home dotfiles"
    rm -f ~/.ackrc
    rm -f ~/.css
    rm -f ~/.js
    rm -f ~/.gvimrc
    rm -f ~/.inputrc
    rm -f ~/.rvmrc
    rm -f ~/.ssh/config
    rm -f ~/.tmux.conf
    rm -f ~/.vim
    rm -f ~/.vim_colors
    rm -f ~/.vimrc
    rm -f ~/.zshrc
    rm -f ~/.oh-my-zsh
fi

echo "Creating dotfile symlinks"
ln -s ~/Code/dotfiles/ackrc ~/.ackrc
ln -s ~/Code/dotfiles/dotcss ~/.css
ln -s ~/Code/dotfiles/dotjs ~/.js
ln -s ~/Code/dotfiles/gvimrc ~/.gvimrc
ln -s ~/Code/dotfiles/inputrc ~/.inputrc
ln -s ~/Code/dotfiles/rvmrc ~/.rvmrc
ln -s ~/Code/dotfiles/ssh_config ~/.ssh/config
ln -s ~/Code/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/Code/dotfiles/vim ~/.vim
ln -s ~/Code/dotfiles/vim_colors ~/.vim_colors
ln -s ~/Code/dotfiles/vimrc ~/.vimrc
ln -s ~/Code/oh-my-zsh/zshrc ~/.zshrc
ln -s ~/Code/oh-my-zsh ~/.oh-my-zsh

echo "Updating vim submodules"
cd ~/Code/dotfiles
mkdir -p ~/.vim/tmp/undo
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "Removing non-functioning bundle checkouts"
#TODO work out why I have to do this
rm -rf ~/Code/dotfiles/vim/bundle/vim-powerline/
rm -rf ~/Code/dotfiles/vim/bundle/Zenburn/
rm -rf ~/Code/dotfiles/vim/bundle/dbext.vim/
rm -rf ~/Code/dotfiles/vim/bundle/TWiki-Syntax/
rm -rf ~/Code/dotfiles/vim/bundle/tabular/
rm -rf ~/Code/dotfiles/vim/bundle/vim-makegreen/
rm -rf ~/Code/dotfiles/vim/bundle/vim-session/
vim +BundleInstall

echo "Updating zsh submodules"
cd ~/Code/oh-my-zsh
git submodule init
git submodule update
git submodule foreach git pull origin master --recurse-submodules
