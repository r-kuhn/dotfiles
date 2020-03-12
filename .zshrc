# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd nomatch notify
unsetopt extendedglob

setopt rmstarsilent # don't make my say 'y' to each rm file
setopt nobgnice # don't nice background tasks
setopt nohup
setopt nobeep
setopt localoptions # allow functions to have local options
setopt localtraps # allow functions to have local traps
setopt share_history # read history on every history recall
setopt extendedhistory
setopt promptsubst
setopt correct
setopt completeinword
setopt appendhistory
setopt incappendhistory # automatically append to history
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

    export PATH=${HOME}/bin:${GOROOT}/bin:${GOBIN}:${HOME}/.cargo/bin:${HOME}/local:${HOME}/brew/bin:${HOME}/.npm/bin:/usr/local/bin:${HOME}/Library/Python/3.7/bin:${PATH}
    export PATH=${HOME}/nvim-osx64/bin:${PATH}

    source '/Users/dan/brew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/Users/dan/brew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
    ;;
  Linux)
	  export GOPATH=$HOME/go
	  export GOBIN=$GOPATH/bin

	  alias ls='ls --color=auto'
	  export PATH=${HOME}/bin:${HOME}/.cargo/bin:${HOME}/.npm/bin:${GOPATH}/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$PATH
	  # The next line updates PATH for the Google Cloud SDK.
    if [ -f '/home/dan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/dan/google-cloud-sdk/path.zsh.inc'; fi
    if [ -f '/home/dan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/dan/google-cloud-sdk/completion.zsh.inc'; fi
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
#alias grep='grep --color'
alias tmux='tmux attach -d -t $(whoami)|| tmux new -s $(whoami)'
alias ee='emacsclient -c '
alias titan='mosh titan'
alias lapetus='mosh -p 61002 lapetus'
alias cat='bat'
alias less='bat'
alias find='fd'
alias grep='rg'
alias time='hyperfine'
alias df='dust'
alias ps='procs'


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

