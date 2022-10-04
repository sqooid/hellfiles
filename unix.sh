#!/bin/sh

DIR=$(dirname $0)
DIR_ABS=$(cd $DIR; pwd)

# Shared
$DIR/shared-init/unix.sh

# Configs
find $DIR_ABS/config -mindepth 1 -maxdepth 1 | xargs ln -v -s -f -t $HOME/.config

# Fonts
mkdir -p /tmp && cd /tmp
curl -sLOJ 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip' 
unzip JetBrainsMono.zip '*NL*Mono.ttf' -d $HOME/.fonts
rm JetBrainsMono.zip
