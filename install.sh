#!/usr/bin/env bash

main () {
    DOTFILES="src/dotfiles"
    PREZTO="src/prezto"

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
    if [ ! -d .ptpython ]; then
        mkdir .ptpython
    fi

    if [ "$(uname -s)" == "Darwin" ]; then
        echo "Set up OSX-specific requirements"
        # shellcheck disable=SC1090
        source "$HOME/${DOTFILES}/osx-requirements"
    fi

    make_symlinks
    if [ ${UPDATE} -eq 0 ]; then
        checkout_repos
    else
        update_repos
        update_vim_submodules
        update_prezto_submodules
    fi

    if [ "$(uname -s)" == "Darwin" ]; then
        echo "Applying OSX-specific settings"
        # Change shell to zsh
        sudo dscl . -change /Users/"$USER" UserShell "$SHELL" /usr/local/bin/zsh > /dev/null 2>&1
        # shellcheck disable=SC1090
        source "$HOME/${DOTFILES}/osx"
    fi
}

update_repos () {
    echo "Updating repos"
    cd "$HOME/${PREZTO}" && git pull
    cd "$HOME/${DOTFILES}" && git pull
}

checkout_repos () {
    echo "Checking out repos"
    rm -rf "$HOME/${DOTFILES:?}" && git clone https://github.com/johnoshea/dotfiles.git "$HOME/${DOTFILES}"
    curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qa
    rm -rf "$HOME/${PREZTO:?}" && git clone https://github.com/johnoshea/prezto.git "$HOME/${PREZTO}"
    update_prezto_submodules
}


make_symlinks () {
    echo "Creating dotfile symlinks"
    ln -sf "$HOME/${DOTFILES}/agignore" "$HOME/.agignore"
    ln -sf "$HOME/${DOTFILES}/inputrc" "$HOME/.inputrc"
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
    ln -sf "$HOME/${DOTFILES}/vimrc" "$HOME/.vimrc"
    ln -sf "$HOME/${DOTFILES}/pylintrc" "$HOME/.pylintrc"
    ln -sf "$HOME/${DOTFILES}/eslintrc.js" "$HOME/.eslintrc.js"
    ln -sf "$HOME/${DOTFILES}/gitconfig.$(uname)" "$HOME/.gitconfig"
    ln -sf "$HOME/${DOTFILES}/gitignore_global" "$HOME/.gitignore_global"
    ln -sf "$HOME/${DOTFILES}/hgignore_global" "$HOME/.hgignore_global"
    ln -sf "$HOME/${DOTFILES}/tigrc" "$HOME/.tigrc"
    ln -sf "$HOME/${DOTFILES}/pdbrc.py" "$HOME/.pdbrc.py"
    ln -sf "$HOME/${DOTFILES}/gemrc" "$HOME/.gemrc"
    ln -sf "$HOME/${DOTFILES}/mdlrc" "$HOME/.mdlrc"
    ln -sf "$HOME/${DOTFILES}/editorconfig" "$HOME/.editorconfig"
    ln -sf "$HOME/${DOTFILES}/ptpythonconfig.py" "$HOME/.ptpython/config.py"

    ln -sf "$HOME/${PREZTO}/runcoms/zlogin" "$HOME/.zlogin"
    ln -sf "$HOME/${PREZTO}/runcoms/zlogout" "$HOME/.zlogout"
    ln -sf "$HOME/${PREZTO}/runcoms/zpreztorc" "$HOME/.zpreztorc"
    ln -sf "$HOME/${PREZTO}/runcoms/zprofile" "$HOME/.zprofile"
    ln -sf "$HOME/${PREZTO}/runcoms/zshenv" "$HOME/.zshenv"
    ln -sf "$HOME/${PREZTO}/runcoms/zshrc" "$HOME/.zshrc"
    ln -sf "$HOME/${PREZTO}" "$HOME/.zprezto"
}

update_vim_submodules () {
    echo "Updating vim submodules"
    cd "$HOME/${DOTFILES}"
    TERM=xterm-256color vim +PlugInstall! +qa
}

update_prezto_submodules () {
    echo "Updating prezto submodules"
    cd "$HOME/${PREZTO}"
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
