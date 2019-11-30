#!/bin/sh

# Set up i3wm
cp ./config $HOME/.config/i3/
cp ./i3blocks.conf $HOME/.config/i3/
sudo cp ./i3blocks-scripts/* /usr/share/i3blocks

# Set up vim
cp ./.vimrc $HOME

# Set up zsh
cp ./.zshrc $HOME

# Set up Xdefaults
cp ./.Xdefaults $HOME
