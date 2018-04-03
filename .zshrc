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

system_type=$(uname -s)

if [ "$system_type" = "Darwin" ]; then
  export PATH=${HOME}/homebrew/bin:${PATH}
elif [ "$system_type" = "Darwin" ]; then
fi
