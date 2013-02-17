#!/bin/sh

DOTFILES='~/Code/dotfiles'
ZPREZTO='~/Code/zprezto'

if [ x"$1" = x"new" ]; then
    REMOVE_EXISTING=1
fi

# Bail if anything's unset
set -e
set -u

# Basic directory structure
test -d ~/Code || mkdir ~/Code

update_repos () {
    echo "Updating repos"
    cd ${ZPREZTO} && git pull
    cd ${DOTFILES} && git pull
}

checkout_repos () {
    echo "Checking out repos"
    rm -rf ${ZPREZTO} && clone https://github.com/johnoshea/zprezto.git ${ZPREZTO}
    rm -rf ${DOTFILES} && clone https://github.com/johnoshea/dotfiles ${DOTFILES}
}

remove_dotfiles () {
    echo "Removing existing home dotfiles"
    rm -f ~/.ackrc
    rm -f ~/.css
    rm -f ~/.js
    rm -f ~/.gvimrc
    rm -f ~/.inputrc
    rm -f ~/.rvmrc
    rm -f ~/.ssh/config
    rm -f ~/.terminfo
    rm -f ~/.tmux.conf
    rm -f ~/.terminfo
    rm -f ~/.vim
    rm -f ~/.vim_colors
    rm -f ~/.vimrc
    rm -f ~/.zlogin
    rm -f ~/.zlogout
    rm -f ~/.zprezto
    rm -f ~/.zpreztorc
    rm -f ~/.zprofile
    rm -f ~/.zshenv
    rm -f ~/.zshrc
}


create_symlinks () {
    echo "Creating dotfile symlinks"
    ln -s ${DOTFILES}/ackrc ~/.ackrc
    ln -s ${DOTFILES}/dotcss ~/.css
    ln -s ${DOTFILES}/dotjs ~/.js
    ln -s ${DOTFILES}/gvimrc ~/.gvimrc
    ln -s ${DOTFILES}/inputrc ~/.inputrc
    ln -s ${DOTFILES}/rvmrc ~/.rvmrc
    ln -s ${DOTFILES}/ssh_config ~/.ssh/config
    ln -s ${DOTFILES}/tmux.conf ~/.tmux.conf
    ln -s ${DOTFILES}/terminfo ~/.terminfo
    ln -s ${DOTFILES}/vim ~/.vim
    ln -s ${DOTFILES}/vim_colors ~/.vim_colors
    ln -s ${DOTFILES}/vimrc ~/.vimrc

    ln -s ${ZPREZTO}/zlogin ~/.zlogin
    ln -s ${ZPREZTO}/zlogout ~/.zlogout
    ln -s ${ZPREZTO}/zprezto ~/.zprezto
    ln -s ${ZPREZTO}/zpreztorc ~/.zpreztorc
    ln -s ${ZPREZTO}/zprofile ~/.zprofile
    ln -s ${ZPREZTO}/zshenv ~/.zshenv
    ln -s ${ZPREZTO}/zshrc ~/.zshrc
}

update_vim_submodules () {
    echo "Updating vim submodules"
    cd ${DOTFILES}
    mkdir -p ~/.vim/tmp/undo
    git submodule init
    git submodule update
    git submodule foreach git pull origin master --recurse-submodules
}

update_zprezto_submoules () {
    echo "Updating zprezto submodules"
    cd ${ZPREZTO}
    git submodule init
    git submodule update
    git submodule foreach git pull origin master --recurse-submodules
}

if [ ${REMOVE_EXISTING} ]; then
    checkout_repos
    remove_dotfiles
    create_symlinks
else
    update_repos
    update_vim_submodules
    update_zprezto_submoules
fi
