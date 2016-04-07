#!/bin/bash
if [ -f "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi
if [ -e "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

