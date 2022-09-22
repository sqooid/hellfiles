#!/bin/bash
mkdir -p /tmp
cd /tmp
curl -Ls https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/InconsolataGo.zip -o font.zip
mkdir -p ~/.local/share/fonts
unzip -p font.zip 'InconsolataGo Nerd Font Complete Mono.ttf' > "$HOME/.local/share/fonts/InconsolataGo Nerd Font Complete Mono.ttf"
fc-cache
rm /tmp/font.zip