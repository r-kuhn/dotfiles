set nocompatible              " be iMproved, required
filetype off                  " required

if filereadable(expand("~/.config/nvim/vimrc.experiment")) " try
  source ~/.config/nvim/vimrc.experiment
elseif filereadable(expand("~/.config/nvim/plugins.vim")) " Usual
  source ~/.config/nvim/plugins.vim
  source ~/.config/nvim/syntax.vim
  source ~/.config/nvim/settings.vim
  source ~/.config/nvim/filetypes.vim
  source ~/.config/nvim/functions.vim
  source ~/.config/nvim/abbreviations.vim
  source ~/.config/nvim/mappings.vim
  source ~/.config/nvim/go.vim
  source ~/.config/nvim/js.vim
endif


if filereadable(expand("~/.config/nvim/vimrc.local")) " Local overrides ...
  source ~/.vimrc.local
endif

