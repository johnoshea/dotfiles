#
# Defines vagrant aliases.
#
# Authors:
#   John O'Shea <john.m.oshea@gmail.com>
#

# Return if requirements are not found.
if (( ! $+commands[vagrant] )); then
  return 1
fi

#
# Aliases
#

alias vup='vagrant up'              # Start a vagrant box
alias vdes='vagrant destroy -f'     # Destroy a vagrant box
alias vssh='vagrant ssh'            # SSH into a vagrant box
alias vst='vagrant status'          # Show Vagrant status
alias vgst='vagrant global-status'  # Show Vagrant global status
