
autocmd FileType tmpl setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType php setlocal shiftwidth=4 tabstop=4 noexpandtab
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=8 tabstop=2 noexpandtab

" Custom file extensions
autocmd BufNewFile,BufRead *.fizz set syntax=javascript
autocmd BufNewFile,BufRead Brewfile set syntax=ruby
