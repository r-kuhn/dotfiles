# Dan Cardamore Dot Files

## Overview
This is my dotfiles for both OSX & Linux managed by yadm.
<https://thelocehiliosan.github.io/yadm/>
<https://github.com/TheLocehiliosan/yadm>


## Cheatsheet

* Adding files:
```sh
yadm add important_file
yadm commit
```

* Push changes to repo:
```sh
yadm remote add origin ssh://git@jarlan.hld.ca:5555/git-server/repos/dandotfiles.git
yadm push -u origin master
```

* Check status
```sh
yadm status
```

* Get changes from the repo
```sh
yadm fetch
```

* List files managed by yadm
```sh
yadm list -a
```



## Installation

This depends on yadm:
https://github.com/TheLocehiliosan/yadm

### Linux

* Install yadm:
```sh
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:flexiondotorg/yadm
sudo apt-get update
sudo apt-get -y install yadm
```

* Get dotfiles:
```sh
yadm clone --bootstrap ssh://git@jarlan.hld.ca:5555/git-server/repos/dandotfiles.git
```

### Mac

* Make sure you have brew installed in your home directory
```sh
git clone https://github.com/mxcl/homebrew.git
export PATH=${HOME}/homebrew/bin:${PATH}
```

* Install yadm:
```sh
brew install yadm
```

* Get dotfiles:
```sh
yadm clone --bootstrap ssh://git@jarlan.hld.ca:5555/git-server/repos/dandotfiles.git
```