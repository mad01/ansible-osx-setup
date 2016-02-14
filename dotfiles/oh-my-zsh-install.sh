#!/bin/bash

DIRECTORY=$HOME/.oh-my-zsh/ >/dev/null
if [ -d "$DIRECTORY" ]; then
    echo "oh-my-zsh is installed will skip"
else
    echo "installing oh-my-zsh"
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi


