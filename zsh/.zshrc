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
bindkey -v
# End of lines configured by zsh-newuser-install


# Antigen setup
# Grab antigen if it doesn't exist
if [[ ! -f ~/.antigen.zsh ]]; then
    curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
fi

source ~/.antigen.zsh
antigen use oh-my-zsh

antigen bundles << EOBUNDLES
    git
    brew
    pip
    virtualenv
    virtualenvwrapper

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

