#!/bin/sh

echo "install LSP servers"
#npm i -g flow-language-server
npm i -g yaml-language-server
npm i -g vscode-json-languageservice
npm i -g bash-language-server 
npm i -g markdown-language-server
npm i -g vscode-html-languageserver-bin
npm i -g vscode-css-languageserver-bin
go get -u golang.org/x/tools/cmd/gopls
