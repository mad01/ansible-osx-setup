#!/bin/bash

if which brew >/dev/null; then
    echo brew exists
else
    echo brew does not exist installing it 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if which ansible >/dev/null; then
    echo brew exists
else
    echo ansible does not exist installing it 
    pip install ansible
fi

pkg="python"
if brew list -1 | grep -q "^${pkg}\$"; then
    echo "Package '$pkg' is installed"
else
    echo "Package '$pkg' is not installed, installing it"
    brew install python
    brew linkapps python
fi

echo "running ansible playbook"
ansible-playbook -i hosts site.yml
