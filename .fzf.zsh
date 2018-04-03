# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/dan/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/dan/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/dan/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/dan/.fzf/shell/key-bindings.zsh"

