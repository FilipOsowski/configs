set -o vi

# Stuff to make colors work in the terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Customize terminal prompt-- what it says & color
export PS1="\[\e[1;91m\][\w]\$\[\e[0m\] "

# Move to trash instead of delete.
alias rm='echo Use sudo if you want to rm'
