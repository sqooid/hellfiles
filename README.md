# Installation

Make sure the working directory is the root of this repository

## Linux

`./linux.sh`.  Note that `xclip` may have to be installed for system clipboard to work.
_Do not_ run with sudo as this will mess up the `$HOME` used for things like the nvim config.

## Mac

`sudo ./mac.sh`

## Windows

`./windows.bat`

# Configs

## NeoVim config

### Requirements

For Neovide, font used is InconsolataGo Nerd Font (non-mono) at <https://www.nerdfonts.com/font-downloads>

For general functioning:

- node
- npm
- yarn
- python
- wget
- curl
- gzip
- tar
- gcc
- ripgrep
- unzip

Formatters:

- black (pip)
- rustfmt (cargo)
- stylua (cargo)
- prettier (npm)
- clang-format (install llvm)

For markdown preview:

- live-server (npm)
- pandoc
