# The following lines were added by compinstall
zstyle :compinstall filename '/Users/tylerl/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

EDITOR=vim

# Antigen setup
# Grab antigen if it doesn't exist
if [[ ! -f ~/.antigen.zsh ]]; then
    curl https://cdn.rawgit.com/zsh-users/antigen/v1.4.0/bin/antigen.zsh > ~/.antigen.zsh
fi

source ~/.antigen.zsh
antigen use oh-my-zsh

antigen bundles << EOBUNDLES
    git
    brew
    pip
    virtualenv

    # joel-porquet/zsh-dircolors-solarized.git
    gerges/oh-my-zsh-jira-plus
    zlsun/solarized-man.git
    Tarrasch/zsh-autoenv
    zsh-users/zsh-completions src
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme TylerLubeck/oh-my-zsh-seeker-theme seeker

antigen apply
# End Antigen setup

# Pull in my aliases
if [[ -f ~/.zsh_aliases ]]; then
    source ~/.zsh_aliases
fi

# Pull in stuff for local machine
if [[ -f ~/.zsh_local ]]; then
    source ~/.zsh_local
fi

# If pyenv exists, enable autocomplete
if which pyenv > /dev/null; then 
    eval "$(pyenv init -)"; 
fi

# If pyenv-virtualenv exists, enable autocomplete
if which pyenv-virtualenv-init > /dev/null; then 
    eval "$(pyenv virtualenv-init -)"; 
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set up autojump
 [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

[[ -s "/Users/tyler/.gvm/scripts/gvm" ]] && source "/Users/tyler/.gvm/scripts/gvm"

# OPAM configuration
. /Users/tylerl/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

it2prof() { echo -e "\033]1337;SetProfile=$1\a" }

# Stolen from https://development.robinwinslow.uk/2012/07/20/tmux-and-ssh-auto-login-with-ssh-agent-finally/

if [[ -z "$TMUX" ]]; then
    # if ssh auth variable is missing
    if [[ -z $SSH_AUTH_SOCK ]]; then
        export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
    fi

    # if socket is available create the new auth session
    if [[ ! -S $SSH_AUTH_SOCK ]]; then
        `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null 2>&1
        echo $SSH_AGENT_PID > $HOME/.ssh/.auth_pid

        # Add all default keys to ssh auth
        # Only do this if we had to make a new ssh-agent anyway, otherwise it
        #    should already be done
        ssh-add 2>/dev/null
    fi

    # if agent isn't defined, recreate it from pid file
    if [[ -z $SSH_AGENT_PID ]]; then
        export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid`
    fi

fi

