#!/bin/sh

# Set up i3wm
cp ./config ~/.config/i3/
cp ./i3blocks.conf ~/.config/i3/
sudo cp ./i3blocks-scripts/* /usr/share/i3blocks

# Set up vim
cp ./.vimrc ~

# Set up zsh
cp ./.zshrc ~

# Set up Xdefaults
cp ./.Xdefaults ~
