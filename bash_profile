#!/bin/bash
export BASH_SILENCE_DEPRECATION_WARNING=1

if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi
if [ -e "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
