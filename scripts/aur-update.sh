#!/bin/zsh

# Updates all AUR repositories contained in root folder provided as $1
if [[ "$#" -ne 1 ]] ; then
  echo "Must provide root folder of AUR repositories" >&2
  exit 1
fi

for i in $1/* ; do
  echo "$i"
  cd "$i"
  output="$(git pull)"
  if [[ $output == "Already up to date." ]] ; then
    echo "Already up to date"
  else
    makepkg -sirc --noconfirm
  fi
done
