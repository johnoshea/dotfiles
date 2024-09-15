#
# Sets directory options and defines directory aliases.
#
# Authors:
#   James Cox <james@imaj.es>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Options
#

setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

#
# Aliases
#

if ! zstyle -t ':prezto:module:directory:alias' skip; then
  alias -- -='cd -'
  alias d='dirs -v'
  for index ({1..30}) alias "$index"="cd +${index}"; unset index
fi

export HISTORY_IGNORE='(ls|ll|la|l|clear|tmux|pwd|exit|fc|df|ps|top|history|[bf]g)'


function zshaddhistory() {
    emulate -L zsh
    ## uncomment if HISTORY_IGNORE
    ## should use EXTENDED_GLOB syntax
    setopt extendedglob
    [[ $1 != ${~HISTORY_IGNORE} ]]
}

# add a "cd <absolute path>" to history whenever the working directory changes
function chpwd() {
    escaped_dir=$(printf %q "$(pwd)") # escape spaces in directory names
    print -rs "cd $escaped_dir"
}
