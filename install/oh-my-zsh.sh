#!/bin/bash

if ! command -v zsh &> /dev/null; then
    echo "zsh is not installed."
    echo "Install it by sudo pacman -S zsh or run the install.sh script again."
    exit 1
fi

if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh my zsh is installed. Nothing to do."
fi
