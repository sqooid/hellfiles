DIR=$(dirname $0)

source $DIR/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
precmd () { __git_ps1 "%n" ":%~$ " "|%s" }

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3~' delete-char
bindkey '^[[3;5~' kill-word

export SUDO_EDITOR=/usr/bin/nvim
