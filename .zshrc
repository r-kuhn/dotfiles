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

export GO111MODULE=on

case $(uname) in
  Darwin)
    alias ls='ls -G'
    export GOROOT=${HOME}/.go
    export GOPATH=${HOME}/go
    export GOBIN=${HOME}/go/bin

    if [ -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]; then
      source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
    fi
    export PATH=${HOME}/bin:${GOROOT}/bin:${GOBIN}:${HOME}/brew/bin:${HOME}/.npm/bin:/usr/local/bin:${HOME}/Library/Python/3.7/bin:${PATH}
    ;;
  Linux)
    export GOBIN=${GOPATH}/bin
    export GOPATH=${HOME}/go
    alias ls='ls --color=auto'
    export PATH=${HOME}/bin:${HOME}/.npm/bin:${PATH}:${GOPATH}/bin
    ;;
esac


# POWERLEVEL9K
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

# Pure prompt
PURE_CMD_MAX_EXEC_TIME=5
PURE_GIT_PULL=0


# These are needed for oh-my-zsh
#export ZSH=${HOME}/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh
#export ZSH_CACHE_DIR=~/.cache/zsh

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

# fzf + ag configuration
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
--color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
--color info:108,prompt:109,spinner:108,pointer:168,marker:168
'

#zsh shortcuts
alias vi='nvim'
alias nano='nvim'
alias vim='nvim'
export EDITOR=nvim

alias e='emacs'
alias l='ls -lFh'
alias -g R='| rg'
alias -g A='| ag'
alias grep='grep --color'
alias tmux='tmux attach|| tmux'

source ~/.zsh_functions

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
true
