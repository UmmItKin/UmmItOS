#!/bin/bash

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

# Source library functions
source "$PARENT_DIR/lib/common.sh"
source "$PARENT_DIR/lib/display-utils.sh"

install_oh_my_zsh() {
    echo "${COLOR_BLUE}:: Checking for Oh My Zsh...${COLOR_RESET}"
    if ! command -v zsh &> /dev/null; then
        echo "${COLOR_RED}:: zsh is not installed.${COLOR_RESET}"
        echo "${COLOR_YELLOW}:: Install it by sudo pacman -S zsh or run the install.sh script again.${COLOR_RESET}"
        return 1
    fi

    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        echo "${COLOR_BLUE}:: Installing Oh My Zsh...${COLOR_RESET}"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        if [ $? -eq 0 ]; then
            echo "${COLOR_GREEN}:: Oh My Zsh installed successfully.${COLOR_RESET}"
        else
            echo "${COLOR_RED}:: Failed to install Oh My Zsh.${COLOR_RESET}"
            return 1
        fi
    else
        echo "${COLOR_GREEN}:: Oh My Zsh is already installed. Skipping.${COLOR_RESET}"
    fi

    # Install zsh-autosuggestions
    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        echo "${COLOR_BLUE}:: Installing zsh-autosuggestions...${COLOR_RESET}"
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    else
        echo "${COLOR_GREEN}:: zsh-autosuggestions is already installed. Skipping.${COLOR_RESET}"
    fi
}

install_oh_my_zsh
