set -o vi

# Stuff to make colors work in the terminal
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Customize terminal prompt-- what it says & color
export PS1="\[\e[1;91m\][\w]\$\[\e[0m\] "

# Move to trash instead of delete.
alias rm='echo Use sudo if you want to rm'

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
. /Users/filip/miniconda3/etc/profile.d/conda.sh
PATH=$PATH:/opt/metasploit-framework/bin
export PATH=$PATH:/opt/metasploit-framework/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/filip/google-cloud-sdk/path.bash.inc' ]; then . '/Users/filip/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/filip/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/filip/google-cloud-sdk/completion.bash.inc'; fi

# opam configuration
test -r /Users/filip/.opam/opam-init/init.sh && . /Users/filip/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
