#!/usr/bin/env zsh

# returns true if the executable exists
function executable_exists() { [ ! -z `which "$1"` ]; }

function random_string() {
  cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

function watchexec() {
  cmd="$@"
  rg -l . | entr sh -c "$cmd"
}

function true_colours() {
  awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'
}


function initop () {
  if [ ! -e "${HOME}/.op" ]; then
    ~/bin/init1password.sh
  fi
  eval "$(op signin my)"
}

function git_prune() {
	echo "prune remote branches"
	git remote prune origin
	echo "prune local branches that have been merged"
	git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
}
