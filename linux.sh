#!/bin/sh

DIR=$(dirname $0)

# Shared
$DIR/shared-init/unix.sh

# Nvim
ln -s -f $PWD/nvim $HOME/.config/nvim
sudo ln -s -f $PWD/scripts/* /usr/local/bin/