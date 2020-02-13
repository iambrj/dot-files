#!/bin/sh

configDir="$HOME/.config/"
rofiDir="${configDir}rofi/"
i3Dir="${configDir}i3/"
i3BlockScriptsDir="/usr/share/i3blocks"

i3DirFiles="./i3blocks.conf ./config"
i3BlockScripts="./i3blocks-scripts/*"
homeFiles="${HOME}/.zshrc ${HOME}/.Xdefaults"

# Create directories, if they don't already exist
if [ -d "$configDir" ]; then
	echo "Installing config files in ${configDir}..."
else
	mkdir "$configDir"
fi
# TODO: create missing directories

# Set up i3wm
cp "$i3DirFiles" "$i3Dir"
sudo cp ./i3blocks-scripts/* /usr/share/i3blocks
sudo cp "$i3BlockScripts" "$i3BlockScriptsDir"

# Set up vim
cp ./.vimrc "$HOME"
# TODO set up YCM

# Set up homefiles
cp "$homeFiles" "$HOME"

# rofi theme
cp 
