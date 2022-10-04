DIR=$(dirname $0)

# Prompt
source $DIR/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
autoload -U colors && colors
precmd () { __git_ps1 "%B%F{red}%n%f%b:%~%F{blue}" "%f$ " "|%s" }

# Keybinds
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
bindkey '^[[3~' delete-char
bindkey '^[[3;5~' kill-word

# Editor
export SUDO_EDITOR=/usr/bin/nvim
export EDITOR=/usr/bin/nvim

# Aliases
alias reload='source ~/.zshrc'
alias ls='ls --color'
alias hx='helix'