#!/bin/bash

if which brew >/dev/null; then
    echo brew exists
else
    echo brew does not exist installing it
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

pkg="python"
if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Package '$pkg' is installed"
else
    echo "Package '$pkg' is not installed, installing it"
    brew install python
    brew linkapps python
fi


pkg="python3"
if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Package '$pkg' is installed"
else
    echo "Package '$pkg' is not installed, installing it"
    brew install python3
    brew linkapps python3
fi

if which ansible >/dev/null; then
    echo ansible exists
else
    echo ansible does not exist installing it
    pip install ansible
fi

if which ansible-playbook >/dev/null; then
    echo "running ansible playbook step1.yml"
    ansible-playbook -i hosts step1.yml

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    echo "running ansible playbook step2.yml"
    ansible-playbook -i hosts step2.yml --ask-sudo-pass
else
    echo ansible-playbook not installed
fi

