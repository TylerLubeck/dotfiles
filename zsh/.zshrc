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

 alias t=todo.sh

add_key() {
    cat ~/.ssh/id_rsa.pub | ssh $1 'mkdir -p .ssh && cat >> .ssh/authorized_keys'
}

[[ -s "/Users/tyler/.gvm/scripts/gvm" ]] && source "/Users/tyler/.gvm/scripts/gvm"

it2prof() { echo -e "\033]1337;SetProfile=$1\a" }
