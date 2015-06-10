#!/bin/bash

if ls $HOME/.oh-my-zsh/ >/dev/null; then
    echo "oh-my-zsh is installed will skip"
else
    echo "installing oh-my-zsh"
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
fi

