if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_prompt
fi

if [ -f $HOME/.bash_local ]; then
    . $HOME/.bash_local
fi
