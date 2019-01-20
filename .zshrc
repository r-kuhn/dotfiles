# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd nomatch notify
unsetopt extendedglob


# don't make my say 'y' to each rm file
setopt rmstarsilent
# don't nice background tasks
setopt nobgnice
setopt nohup
setopt nobeep
# allow functions to have local options
setopt localoptions
# allow functions to have local traps
setopt localtraps
# share history with other sessions
setopt sharehistory
setopt extendedhistory
setopt promptsubst
setopt correct
setopt completeinword
setopt appendhistory
setopt incappendhistory
setopt histignorealldups
setopt histreduceblanks
setopt histignoredups
setopt histignorespace
setopt histverify
setopt histexpiredupsfirst

bindkey -e

autoload -Uz compinit
compinit

# Setup golang
export GOPATH=${HOME}/go

case $(uname) in
  Darwin)
          if [ -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]; then
                  source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
          fi
          export PATH=~/bin:~/brew/bin:${GOPATH}/bin:${PATH}:/usr/local/bin/:${HOME}/.npm/bin:~/Library/Python/3.7/bin/:${GOPATH}/bin
          ;;
  Linux)
          export PATH=~/bin:${PATH}:${GOPATH}/bin:${HOME}/.npm/bin
          ;;
esac


export DEFAULT_USER=dan
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs)
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

# Configure FZF
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
fi

#zsh shortcuts
alias vi='nvim'
alias nano='nvim'
alias vim='nvim'
export EDITOR=nvim

alias l='ls -lFh'
alias -g R='| rg'
alias grep='grep --color'

# Setup 1password
function initop () {
  if [ ! -e "${HOME}/.op" ]; then
    ~/bin/init1password.sh
  fi
  eval "$(op signin my)"
}

alias dsrv_postgres='docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres'

# setup flutter
if [ -e "${HOME}/p/flutter" ]; then
  export PATH=${PATH}:$HOME/p/flutter/bin
fi


# setup direnv
eval "$(direnv hook zsh)"

# setup npm
npm config set prefix ${HOME}/.npm



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
