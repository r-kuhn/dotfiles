#!/usr/bin/env bash

go get -u golang.org/x/tools/cmd/gopls
go get -u github.com/klauspost/asmfmt/cmd/asmfmt
go get -u github.com/derekparker/delve/cmd/dlv
go get -u github.com/kisielk/errcheck
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
#go get -u github.com/mdempsky/gocode
go get -u github.com/stamblerre/gocode
go get -u github.com/rogpeppe/godef
go get -u github.com/zmb3/gogetdoc
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/lint/golint
go get -u github.com/alecthomas/gometalinter
go get -u github.com/fatih/gomodifytags
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/jstemmer/gotags
go get -u golang.org/x/tools/cmd/guru
go get -u github.com/josharian/impl
go get -u honnef.co/go/tools/cmd/keyify
go get -u github.com/fatih/motion
go get -u github.com/koron/iferr
go get -u github.com/gobuffalo/buffalo/buffalo
go get -u github.com/gobuffalo/buffalo-pop
go get -u github.com/cespare/reflex
go get -u github.com/mattn/efm-langserver/cmd/efm-langserver

# for spacemacs
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/cweill/gotests/...
go get -u github.com/haya14busa/gopkgs/cmd/gopkgs

# Get npm stuff too
npm i -g markdownlint-cli
npm i -g bash-language-server

# Python stuff
pip3 install vim-vint
