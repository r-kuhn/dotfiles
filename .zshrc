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

# setup direnv
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# this overrides exit for to keep tmux running if its the last pane
exit() {
  if [[ -z $TMUX ]]; then
    builtin exit
    return
  fi

  panes=$(tmux list-panes | wc -l)
  wins=$(tmux list-windows | wc -l) 
  count=$(($panes + $wins - 1))
  if [ $count -eq 1 ]; then
    tmux detach
  else
    builtin exit
  fi
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/dan/brew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/dan/brew/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/dan/brew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/dan/brew/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/dan/brew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/dan/brew/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
