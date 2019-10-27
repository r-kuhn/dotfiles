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

# Emacs mode:
bindkey -e
# Vi mode
#bindkey -v
#export KEYTIMEOUT=1

fpath=(~/.zsh/completion $fpath)

autoload -Uz compinit && compinit -i
compinit

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

export GO111MODULE=on
case $(uname) in
  Darwin)
    alias ls='ls -G'
    export GOPATH=${HOME}/go
    export GOBIN=${HOME}/go/bin

    if [ -e "${HOME}/.nix-profile/etc/profile.d/nix.sh" ]; then
      source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
    fi
    export PATH=${HOME}/bin:${GOROOT}/bin:${GOBIN}:${HOME}/local:${HOME}/brew/bin:${HOME}/.npm/bin:/usr/local/bin:${HOME}/Library/Python/3.7/bin:${PATH}
    export PATH=${HOME}/nvim-osx64/bin:${PATH}

    source '/Users/dan/brew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/Users/dan/brew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
    ;;
  Linux)
	  export GOPATH=$HOME/go
	  export GOBIN=$GOPATH/bin

	  alias ls='ls --color=auto'
	  export PATH=${HOME}/bin:${HOME}/.npm/bin::${GOPATH}/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$PATH
	  ;;
esac

# Pure prompt
PURE_CMD_MAX_EXEC_TIME=5
PURE_GIT_PULL=0

source <(antibody init)
antibody bundle < ~/.zsh/plugins.txt

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=3'

# fzf + ag configuration
#export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
--color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
'

source ~/.zsh/functions.zsh

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
alias ee='emacsclient -c '
alias titan='mosh titan'
alias lapetus='mosh -p 61002 lapetus'

# setup direnv
eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ "${VIM_THEME+set}" != set ]; then
  export VIM_THEME=iceberg-dark
  #export VIM_THEME=oceanicnext
  #export VIM_THEME=atomonelight
fi


source <(kubectl completion zsh)  # setup autocomplete in zsh into the current shell
true
