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
    rm -rf ${DOTFILES} && git clone https://github.com/johnoshea/dotfiles.git ${DOTFILES}
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim -u bundles.vim +BundleInstall +qa
    rm -rf ${ZPREZTO} && git clone https://github.com/johnoshea/prezto.git ${ZPREZTO}
}


make_symlinks () {
    echo "Creating dotfile symlinks"
    ln -sf ${DOTFILES}/ackrc ~/.ackrc
    ln -sf ${DOTFILES}/dotcss ~/.css
    ln -sf ${DOTFILES}/dotjs ~/.js
    ln -sf ${DOTFILES}/gvimrc ~/.gvimrc
    ln -sf ${DOTFILES}/inputrc ~/.inputrc
    ln -sf ${DOTFILES}/rvmrc ~/.rvmrc
    ln -sf ${DOTFILES}/ssh_config ~/.ssh/config
    ln -sf ${DOTFILES}/tmux.conf ~/.tmux.conf
    ln -sf ${DOTFILES}/terminfo ~/.terminfo
    ln -sf ${DOTFILES}/vim ~/.vim
    ln -sf ${DOTFILES}/vim_colors ~/.vim_colors
    ln -sf ${DOTFILES}/vimrc ~/.vimrc

    ln -sf ${ZPREZTO}/runcoms/zlogin ~/.zlogin
    ln -sf ${ZPREZTO}/runcoms/zlogout ~/.zlogout
    ln -sf ${ZPREZTO}/runcoms/zpreztorc ~/.zpreztorc
    ln -sf ${ZPREZTO}/runcoms/zprofile ~/.zprofile
    ln -sf ${ZPREZTO}/runcoms/zshenv ~/.zshenv
    ln -sf ${ZPREZTO}/runcoms/zshrc ~/.zshrc
    ln -sf ${ZPREZTO}/zprezto ~/.zprezto
}

update_vim_submodules () {
    echo "Updating vim submodules"
    cd ${DOTFILES}
    vim -u bundles.vim +BundleInstall! +q
}

update_zprezto_submodules () {
    echo "Updating zprezto submodules"
    cd ${ZPREZTO}
    git submodule init
    git submodule update
    git submodule foreach git pull origin master --recurse-submodules
}

make_symlinks
if [ ${REMOVE_EXISTING} ]; then
    checkout_repos
else
    update_repos
fi
update_vim_submodules
update_zprezto_submodules
