#!/usr/bin/env bash

main () {
    DOTFILES="src/dotfiles"
    ZPREZTO="src/zprezto"

    # Bail if anything's unset
    set -e
    set -u

    # Basic directory structure
    cd ~
    if [ -d src ]; then
        # If it's already there, 'new' will have to be passed in explicitly for
        # a 'start from scratch' operation, otherwise we assume it's just an update
        UPDATE=1
    else
        mkdir src
        UPDATE=0
    fi

    make_symlinks
    if [ ${UPDATE} -eq 0 ]; then
        checkout_repos
    else
        update_repos
        update_vim_submodules
        update_zprezto_submodules
    fi

    if [ "$(uname -s)" == "Darwin" ]; then
        echo "Applying OSX-specific settings"
        source ~/${DOTFILES}/osx
    fi
}

update_repos () {
    echo "Updating repos"
    cd ~/${ZPREZTO} && git pull
    cd ~/${DOTFILES} && git pull
}

checkout_repos () {
    echo "Checking out repos"
    rm -rf ~/${DOTFILES} && git clone https://github.com/johnoshea/dotfiles.git ~/${DOTFILES}
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim -u ~/${DOTFILES}/bundles.vim +PlugInstall +qa
    rm -rf ~/${ZPREZTO} && git clone https://github.com/johnoshea/prezto.git ~/${ZPREZTO}
    update_zprezto_submodules
}


make_symlinks () {
    echo "Creating dotfile symlinks"
    ln -sf ~/${DOTFILES}/ackrc ~/.ackrc
    ln -sf ~/${DOTFILES}/agignore ~/.agignore
    ln -sf ~/${DOTFILES}/dotcss ~/.css
    ln -sf ~/${DOTFILES}/dotjs ~/.js
    ln -sf ~/${DOTFILES}/gvimrc ~/.gvimrc
    ln -sf ~/${DOTFILES}/inputrc ~/.inputrc
    ln -sf ~/${DOTFILES}/noserc ~/.noserc
    ln -sf ~/${DOTFILES}/psqlrc ~/.psqlrc
    ln -sf ~/${DOTFILES}/curlrc ~/.curlrc
    ln -sf ~/${DOTFILES}/wgetrc ~/.wgetrc
    if [ ! -d ~/.ssh ]; then
        mkdir ~/.ssh
    fi
    ln -sf ~/${DOTFILES}/ssh_config ~/.ssh/config
    ln -sf ~/${DOTFILES}/tmux.conf ~/.tmux.conf
    ln -sf ~/${DOTFILES}/terminfo ~/.terminfo
    ln -sf ~/${DOTFILES}/vim ~/.vim
    ln -sf ~/${DOTFILES}/vim_colors ~/.vim_colors
    ln -sf ~/${DOTFILES}/vimrc ~/.vimrc
    ln -sf ~/${DOTFILES}/vimperator ~/.vimperator
    ln -sf ~/${DOTFILES}/vimperatorrc ~/.vimperatorrc
    ln -sf ~/${DOTFILES}/pylintrc ~/.pylintrc
    ln -sf ~/${DOTFILES}/jscrc ~/.jscrc
    ln -sf ~/${DOTFILES}/gitconfig ~/.gitconfig
    ln -sf ~/${DOTFILES}/gitignore_global ~/.gitignore_global
    ln -sf ~/${DOTFILES}/hgignore_global ~/.hgignore_global
    ln -sf ~/${DOTFILES}/tigrc ~/.tigrc

    ln -sf ~/${ZPREZTO}/runcoms/zlogin ~/.zlogin
    ln -sf ~/${ZPREZTO}/runcoms/zlogout ~/.zlogout
    ln -sf ~/${ZPREZTO}/runcoms/zpreztorc ~/.zpreztorc
    ln -sf ~/${ZPREZTO}/runcoms/zprofile ~/.zprofile
    ln -sf ~/${ZPREZTO}/runcoms/zshenv ~/.zshenv
    ln -sf ~/${ZPREZTO}/runcoms/zshrc ~/.zshrc
    ln -sf ~/${ZPREZTO} ~/.zprezto
}

update_vim_submodules () {
    echo "Updating vim submodules"
    cd ~/${DOTFILES}
    TERM=xterm-256color vim -u bundles.vim +PlugInstall! +qa
}

update_zprezto_submodules () {
    echo "Updating zprezto submodules"
    cd ~/${ZPREZTO}
    git submodule init
    git submodule update
    git submodule foreach git pull origin master --recurse-submodules
}

if [ x"$1" = x"new" ]; then
    UPDATE=0
else
    UPDATE=1
fi
main

