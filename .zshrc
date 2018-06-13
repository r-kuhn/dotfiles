export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
DEFAULT_USER="dan"
#POWERLEVEL9K_CONTEXT_TEMPLATE="%n@`hostname -f`"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs virtualenv root_indicator background_jobs time)



# Setup nvim
alias vi=nvim
alias vim=nvim
export EDITOR=nvim
export VISUAL=$EDITOR
export GIT_EDITOR=nvim
. ~/.secret_env

# Setup fuzzy finding for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup Python
export PYTHONSTARTUP=~/.pythonrc

system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
  # use the python's inside my user space
  export PATH=${HOME}/Library/Python/3.6/bin:${HOME}/Library/Python/2.7/bin:${PATH}
  # homebrew goes first
  export PATH=${HOME}/brew/bin:${PATH}
elif [ "$system_type" = "Linux" ]; then
fi
export PATH=${HOME}/bin:${PATH}

# Configure GO
export GOROOT="${HOME}/go"
export GOPATH="${HOME}/p/go"
export PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin

