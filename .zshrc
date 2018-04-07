# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Setup nvim
alias vi=nvim
alias vim=nvim
export EDITOR=nvim
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
  export PATH=${HOME}/homebrew/bin:${PATH}
elif [ "$system_type" = "Linux" ]; then
fi
export PATH=${HOME}/bin:${PATH}

# Configure GO
export GOROOT="${HOME}/go"
export PATH=${PATH}:${HOME}/go/bin
export GOPATH="${HOME}/p/codenet/third_party:${HOME}/p/codenet/go"

