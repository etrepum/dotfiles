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

git_dir="$(xcode-select -p)/usr/share/git-core"
# git completion and prompt
for ext in sh bash; do
    if [ -f "$git_dir/git-completion.$ext" ]; then
	source "$git_dir/git-completion.$ext"
    fi
done
if [ -f "$git_dir/git-prompt.sh" ]; then
    source "$git_dir/git-prompt.sh"
    export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

# go completion
if [ -f "/usr/local/etc/bash_completion.d/go-completion.bash" ]; then
    source "/usr/local/etc/bash_completion.d/go-completion.bash"
fi

# hg completion
if [ -f "/usr/local/etc/bash_completion.d/hg-completion.bash" ]; then
    source "/usr/local/etc/bash_completion.d/hg-completion.bash"
fi

alias e=aquamacs

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Add GHC 7.10.1 to the PATH, via https://ghcformacosx.github.io/
export GHC_DOT_APP="/Applications/ghc-7.10.1.app"
if [ -d "$GHC_DOT_APP" ]; then
  export PATH="${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
fi

# Sublime Text
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"

# Pandoc
export PATH="$HOME/src/pandoc/.cabal-sandbox/bin:$PATH"

# Hobbes
export PATH="$HOME/src/hobbes/.cabal-sandbox/bin:$PATH"

JDK_PATH=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home
if [ -e $JDK_PATH ]; then
    export JAVA_HOME=$JDK_PATH
fi

# Arcanist
export PATH="$HOME/src/arcanist/bin:$PATH"

# Local $HOME/bin
export PATH="$HOME/bin:$PATH"

if [ -e "$HOME/src/ippolito/dotfiles/bashrc" ]; then
    source "$HOME/src/ippolito/dotfiles/bashrc"
fi
if [ -e "/app/halcyon/halcyon" ]; then
  eval "$( HALCYON_NO_SELF_UPDATE=1 "/app/halcyon/halcyon" paths )"
fi
