#!/bin/bash

# ensure /usr/local/bin comes early in the PATH
export PATH=/usr/local/bin:$PATH

# less shouldn't clear terminal on close, should allow escape codes
export LESS="-X -r"
export PAGER="less $LESS"

# Colorized ls
export CLICOLOR=1

# Bash history append instead of overwrite.
# TIP: use history -n to read in history from another shell
shopt -s histappend
PROMPT_COMMAND='history -a'

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# git completion
if [ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ]; then
  . "/usr/local/etc/bash_completion.d/git-completion.bash"
fi

# git prompt
if [ -f "/usr/local/etc/bash_completion.d/git-prompt.sh" ]; then
  . "/usr/local/etc/bash_completion.d/git-prompt.sh"
  export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

# diff-highlight for git
if [ -d "/usr/local/share/git-core/contrib/diff-highlight" ]; then
  export PATH="${PATH}:/usr/local/share/git-core/contrib/diff-highlight"
fi

# Local $HOME/bin
export PATH="$HOME/bin:$PATH"

# stack $HOME/.local/bin
export PATH="$HOME/.local/bin:$PATH"

if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

if [ -e "$HOME/src/ippolito/dotfiles/bashrc" ]; then
  . "$HOME/src/ippolito/dotfiles/bashrc"
fi
