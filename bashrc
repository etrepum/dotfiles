#!/bin/bash

# ensure /usr/local/bin comes early in the PATH
export PATH=/usr/local/bin:$PATH

# less shouldn't clear terminal on close, should allow escape codes
export LESS="-X -r"
export PAGER="less $LESS"

# Colorized ls
export CLICOLOR=1
#alias ls='ls -GF'
alias ll='ls -l'

# Bash history append instead of overwrite.
# TIP: use history -n to read in history from another shell
shopt -s histappend
PROMPT_COMMAND='history -a'

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

# go completion
if [ -f "/usr/local/etc/bash_completion.d/go-completion.bash" ]; then
    source "/usr/local/etc/bash_completion.d/go-completion.bash"
fi

# hg completion
if [ -f "/usr/local/etc/bash_completion.d/hg-completion.bash" ]; then
    source "/usr/local/etc/bash_completion.d/hg-completion.bash"
fi

export EMACS=/Applications/Aquamacs.app/Contents/MacOS/Aquamacs
alias e=aquamacs

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Sublime Text
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

JDK_PATH=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home
if [ -e $JDK_PATH ]; then
    export JAVA_HOME=$JDK_PATH
fi

# Arcanist
export PATH="$HOME/src/arcanist/bin:$PATH"

# Local $HOME/bin
export PATH="$HOME/bin:$PATH"

# stack $HOME/.local/bin
export PATH="$HOME/.local/bin:$PATH"

if [ -e "$HOME/src/ippolito/dotfiles/bashrc" ]; then
    source "$HOME/src/ippolito/dotfiles/bashrc"
fi
# if [ -e "/app/halcyon/halcyon" ]; then
#     export cabal_helper_libexecdir=/app/libexec
#     export HALCYON_GHC_VERSION=7.10.1
#     export HALCYON_CABAL_VERSION=1.22.4.0
#     export HALCYON_NO_SELF_UPDATE=1
#     eval "$( HALCYON_NO_SELF_UPDATE=1 "/app/halcyon/halcyon" paths )"
# fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export NVM_DIR=~/.nvm
. $(brew --prefix nvm)/nvm.sh


# added by travis gem
[ -f /Users/bob/.travis/travis.sh ] && source /Users/bob/.travis/travis.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
