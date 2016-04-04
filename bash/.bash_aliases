alias c='clear'
alias serve='python -m SimpleHTTPServer'

source $HOME/workit.bash
source /usr/local/bin/virtualenvwrapper.sh

# Allow for per-machine aliases
if [ -f ~/.local_aliases ]; then
    . ~/.local_aliases
fi
