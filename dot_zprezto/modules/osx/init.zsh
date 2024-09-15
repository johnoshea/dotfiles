#
# Defines macOS aliases and functions.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
pmodload 'helper'

# Return if requirements are not found.
if ! is-darwin; then
  return 1
fi

#
# Aliases
#

# Changes directory to the current Finder directory.
alias cdf='cd "$(pfd)"'

# Pushes directory to the current Finder directory.
alias pushdf='pushd "$(pfd)"'

# delete the key from memory and hibernate the computer when closing the lid
alias sleepsafe='sudo pmset -a destroyfvkeyonstandby 1 hibernatemode 25'

# Copy the current directory basename to the clipboard
alias curd='echo "${PWD##*/}" | pbc'
