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

if [ -e ${HOME}/brew/share/antigen/antigen.zsh ]; then
        source /Users/dan/brew/share/antigen/antigen.zsh
fi

if [ -e ${HOME}/.nix-profile/share/antigen/antigen.zsh ]; then
        source ~/.nix-profile/share/antigen/antigen.zsh
fi
antigen use oh-my-zsh

antigen bundle git
antigen bundle sudo
antigen bundle pip
antigen bundle docker
antigen bundle command-not-found
#antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zdharma/fast-syntax-highlighting
#antigen bundle common-aliases
#antigen bundle desyncr/auto-ls
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle ael-code/zsh-colored-man-pages
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle ssh-agent
antigen bundle colored-man-pages
antigen bundle zsh-nix-shell
antigen bundle nix-zsh-completions

# Theme
# antigen theme agnoster
# antigen theme ergenekonyigit/lambda-gitster
antigen theme bhilburn/powerlevel9k powerlevel9k
antigen apply

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

# Setup golang
export GOPATH=${HOME}/go

case $(uname) in
  Darwin)
          if [ -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]; then
                  source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
          fi
          export PATH=~/bin:${GOPATH}/bin:${PATH}:/usr/local/bin/:~/brew/bin:${HOME}/.npm/bin
          ;;
  Linux)
          export PATH=~/bin:${PATH}:${GOPATH}/bin:${HOME}/.npm/bin
          ;;
esac

# setup direnv
eval "$(direnv hook zsh)"

# setup npm
npm config set prefix ${HOME}/.npm



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
