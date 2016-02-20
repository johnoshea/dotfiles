#!/usr/bin/env bash

main () {
    DOTFILES="src/dotfiles"
    ZPREZTO="src/zprezto"

    # Bail if anything's unset
    set -e
    set -u

    if [[ -x "curl" ]]; then
        echo "curl not found - please install first"
        exit 1
    fi

    # Basic directory structure
    cd "$HOME"
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
        source "$HOME/${DOTFILES}/osx"
    fi
}

update_repos () {
    echo "Updating repos"
    cd "$HOME/${ZPREZTO}" && git pull
    cd "$HOME/${DOTFILES}" && git pull
}

checkout_repos () {
    echo "Checking out repos"
    rm -rf "$HOME/${DOTFILES:?}" && git clone https://github.com/johnoshea/dotfiles.git "$HOME/${DOTFILES}"
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim -u "$HOME/${DOTFILES:?}/bundles.vim" +PlugInstall +qa
    rm -rf "$HOME/${ZPREZTO:?}" && git clone https://github.com/johnoshea/prezto.git "$HOME/${ZPREZTO}"
    update_zprezto_submodules
}


make_symlinks () {
    echo "Creating dotfile symlinks"
    ln -sf "$HOME/${DOTFILES}/ackrc" "$HOME/.ackrc"
    ln -sf "$HOME/${DOTFILES}/agignore" "$HOME/.agignore"
    ln -sf "$HOME/${DOTFILES}/dotcss" "$HOME/.css"
    ln -sf "$HOME/${DOTFILES}/dotjs" "$HOME/.js"
    ln -sf "$HOME/${DOTFILES}/gvimrc" "$HOME/.gvimrc"
    ln -sf "$HOME/${DOTFILES}/inputrc" "$HOME/.inputrc"
    ln -sf "$HOME/${DOTFILES}/noserc" "$HOME/.noserc"
    ln -sf "$HOME/${DOTFILES}/psqlrc" "$HOME/.psqlrc"
    ln -sf "$HOME/${DOTFILES}/curlrc" "$HOME/.curlrc"
    ln -sf "$HOME/${DOTFILES}/wgetrc" "$HOME/.wgetrc"
    if [ ! -d "$HOME/.ssh" ]; then
        mkdir "$HOME/.ssh"
    fi
    ln -sf "$HOME/${DOTFILES}/ssh_config" "$HOME/.ssh/config"
    ln -sf "$HOME/${DOTFILES}/tmux.conf" "$HOME/.tmux.conf"
    ln -sf "$HOME/${DOTFILES}/terminfo" "$HOME/.terminfo"
    ln -sf "$HOME/${DOTFILES}/vim" "$HOME/.vim"
    ln -sf "$HOME/${DOTFILES}/vim_colors" "$HOME/.vim_colors"
    ln -sf "$HOME/${DOTFILES}/vimrc" "$HOME/.vimrc"
    ln -sf "$HOME/${DOTFILES}/vimperator" "$HOME/.vimperator"
    ln -sf "$HOME/${DOTFILES}/vimperatorrc" "$HOME/.vimperatorrc"
    ln -sf "$HOME/${DOTFILES}/pylintrc" "$HOME/.pylintrc"
    ln -sf "$HOME/${DOTFILES}/jscsrc" "$HOME/.jscsrc"
    ln -sf "$HOME/${DOTFILES}/jshintrc" "$HOME/.jshintrc"
    ln -sf "$HOME/${DOTFILES}/jshintignore" "$HOME/.jshintignore"
    ln -sf "$HOME/${DOTFILES}/eslintrc.js" "$HOME/.eslintrc.js"
    ln -sf "$HOME/${DOTFILES}/gitconfig.$(uname)" "$HOME/.gitconfig"
    ln -sf "$HOME/${DOTFILES}/gitignore_global" "$HOME/.gitignore_global"
    ln -sf "$HOME/${DOTFILES}/hgignore_global" "$HOME/.hgignore_global"
    ln -sf "$HOME/${DOTFILES}/tigrc" "$HOME/.tigrc"

    ln -sf "$HOME/${ZPREZTO}/runcoms/zlogin" "$HOME/.zlogin"
    ln -sf "$HOME/${ZPREZTO}/runcoms/zlogout" "$HOME/.zlogout"
    ln -sf "$HOME/${ZPREZTO}/runcoms/zpreztorc" "$HOME/.zpreztorc"
    ln -sf "$HOME/${ZPREZTO}/runcoms/zprofile" "$HOME/.zprofile"
    ln -sf "$HOME/${ZPREZTO}/runcoms/zshenv" "$HOME/.zshenv"
    ln -sf "$HOME/${ZPREZTO}/runcoms/zshrc" "$HOME/.zshrc"
    ln -sf "$HOME/${ZPREZTO}" "$HOME/.zprezto"
}

update_vim_submodules () {
    echo "Updating vim submodules"
    cd "$HOME/${DOTFILES}"
    TERM=xterm-256color vim -u bundles.vim +PlugInstall! +qa
}

update_zprezto_submodules () {
    echo "Updating zprezto submodules"
    cd "$HOME/${ZPREZTO}"
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

