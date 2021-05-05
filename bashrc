#!/bin/bash

# ensure /usr/local/bin comes early in the PATH
export PATH=/usr/local/bin:$PATH
if [ -d /opt/homebrew/bin ]; then
  export PATH="/opt/homebrew/bin:$PATH"
fi
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
else
  HOMEBREW_PREFIX="/usr/local"
fi

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

[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# git completion
if [ -f "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash" ]; then
  . "$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash"
fi

# git prompt
if [ -f "$HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh" ]; then
  . "$HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh"
  export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

# diff-highlight for git
if [ -d "$HOMEBREW_PREFIX/share/git-core/contrib/diff-highlight" ]; then
  export PATH="$PATH:$HOMEBREW_PREFIX/share/git-core/contrib/diff-highlight"
fi

# Local $HOME/bin
export PATH="$HOME/bin:$PATH"

# stack $HOME/.local/bin
export PATH="$HOME/.local/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk/

if [ -f "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

if [ -f "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc" ]; then
  . "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
fi

if [ -f "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc" ]; then
  . "$HOMEBREW_PREFIX/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
fi

if [ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

if [ -e "/etc/bash_completion.d/azds" ]; then
  . /etc/bash_completion.d/azds
fi

if [ -e "$HOME/src/ippolito/dotfiles/bashrc" ]; then
  . "$HOME/src/ippolito/dotfiles/bashrc"
fi
