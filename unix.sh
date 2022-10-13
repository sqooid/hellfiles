#!/bin/sh

DIR=$(dirname $0)
DIR_ABS=$(cd $DIR; pwd)

# Configs
find $DIR_ABS/config -mindepth 1 -maxdepth 1 |  xargs -I {} ln -v -s -f {} $HOME/.config

# Fonts
mkdir -p /tmp && cd /tmp
curl -sLOJ 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip' 
if [[ $OSTYPE == 'darwin'* ]]; then
  FONT_DIR=$HOME/Library/Fonts
else 
  FONT_DIR=$HOME/.fonts
fi
unzip JetBrainsMono.zip '*NL*Mono.ttf' -d $HOME/.fonts
rm JetBrainsMono.zip
