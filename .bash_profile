set -o vi

# Stuff to make colors work in the terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Customize terminal prompt-- what it says & color
export PS1="\[\e[1;91m\][\w]\$\[\e[0m\] "

# Move to trash instead of delete.
alias rm='echo Use sudo if you want to rm'

# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/filip/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/filip/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/filip/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/filip/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

