#!/bin/sh

DIR=$(dirname $0)
DIR_ABS=$(cd $DIR; pwd)

# Shared
$DIR/shared-init/unix.sh

# Configs
find $DIR_ABS/config -mindepth 1 -maxdepth 1 | xargs ln -v -s -f -t $HOME/.config
