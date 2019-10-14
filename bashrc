#!/bin/bash

# ensure /usr/local/bin comes early in the PATH
export PATH=/usr/local/bin:$PATH

# less shouldn't clear terminal on close, should allow escape codes
export LESS="-X -r"
export PAGER="less $LESS"

# Colorized ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

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

export ANDROID_HOME=$HOME/Library/Android/sdk/

if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
  . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
fi

if [ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc" ]; then
  . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
fi

if [ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

if [ -e "$HOME/src/ippolito/dotfiles/bashrc" ]; then
  . "$HOME/src/ippolito/dotfiles/bashrc"
fi
