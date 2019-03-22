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
export GOBIN=${GOPATH}/bin
export GO111MODULE=on

case $(uname) in
  Darwin)
          if [ -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]; then
                  source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
          fi
          export PATH=${HOME}/bin:${HOME}/brew/bin:${GOPATH}/bin:${HOME}/.npm/bin:/usr/local/bin:${HOME}/Library/Python/3.7/bin:${PATH}
          ;;
  Linux)
          # export GOROOT=${HOME}/go
          # export PATH=${HOME}/bin:${GOPATH}/bin:${HOME}/.npm/bin:${PATH}
          export PATH=${HOME}/bin::${HOME}/.npm/bin:${PATH}:${GOPATH}/bin
          ;;
esac


export DEFAULT_USER=dan
POWERLEVEL9K_MODE='powerline'
POWERLEVEL9K_STATUS_OK=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs)
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_ETC_ICON=''
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# These are needed for oh-my-zsh
#export ZSH=${HOME}/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh
#export ZSH_CACHE_DIR=~/.cache/zsh

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
alias ls='ls -G'
alias -g R='| rg'
alias grep='grep --color'
alias stmux='tmux new-session -sAD -s main'

# Setup 1password
function initop () {
  if [ ! -e "${HOME}/.op" ]; then
    ~/bin/init1password.sh
  fi
  eval "$(op signin my)"
}

function true_colours() {
  awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'
}

function random_string() {
  cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

# setup direnv
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Auto completes
#
# GCloud
if [ -e "${HOME}/brew/Caskroom/google-cloud-sdk/latest" ]; then
  source "${HOME}/brew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
  source "${HOME}/brew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  export PATH=$PATH:${HOME}/brew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin
fi

source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
