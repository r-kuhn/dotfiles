" vim: sw=2 sw=2 et
"
call plug#begin('~/.vim/plugged')

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " snippets documented here: https://github.com/honza/vim-snippets
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'easymotion/vim-easymotion'
Plug 'wincent/ferret' " project wide search and replace
Plug 'junegunn/fzf.vim' " until denite is fixed
Plug 'Shougo/denite.nvim', {'do': ':UpdateRemotePlugins' } " Fuzzy finding, buffer management
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons' " icons for denite, nerdtree
Plug 't9md/vim-choosewin' " hit '-' to pick a window
Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
"Plug 'fatih/vim-go' , { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary' " gc to comment out sections
Plug 'plasticboy/vim-markdown' " for markdown
Plug 'luochen1990/rainbow' " Rainbow parenthesis
Plug 'dense-analysis/ale'

" Lightline or Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'albertomontesg/lightline-asyncrun'

"Plug 'mhinz/vim-signify' " git gutter
"Plug 'tpope/vim-fugitive' " git handling
Plug 'itchyny/vim-gitbranch' " branch name for for git repo
Plug 'rhysd/git-messenger.vim' " git commit messages under curosr <Leader>gm
Plug 'macthecadillac/lightline-gitdiff'
Plug 'tpope/vim-ragtag' " for better html.eruby indenting
"Plug 'jreybert/vimagit' " git hunk handling
Plug 'mhinz/vim-startify' "fancy start screen
Plug 'mattn/emmet-vim' " html faster editing
Plug 'liuchengxu/vista.vim', {'on': 'Vista' } " LSP tag browsing
Plug 'sheerun/vim-polyglot' " handle most file types
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
Plug 'mhartington/oceanic-next' " Color scheme for 24-bit
Plug 'srcery-colors/srcery-vim'
Plug 'crusoexia/vim-monokai'
Plug 'NLKNguyen/papercolor-theme' " color scheme for 8-bit
Plug 'haishanh/night-owl.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'

call plug#end()


"=====================================================
"===================== SETTINGS ======================

set nocompatible
filetype off
filetype plugin indent on

set ttyfast

if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3
endif

set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     "Enable mouse mode
set noerrorbells             " No beeps
 set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set cmdheight=1              " better command section, needed for coc
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set nowritebackup
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
"Search is ignore case, but autocomplete is case sensitive
set smartcase                " ... but not it begins with upper case
set foldmethod=syntax
set foldlevel=99     " don't fold by default
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden
set inccommand=split         " preview changes live such as %s
set signcolumn=yes           " always show sign columns
"set wildoptions=pum " requires nvim 0.4+
"set pumblend=20              " alpha blending for pum list
set clipboard=unnamedplus   " have vim use the system clipboard

set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion

set lazyredraw

" increase max memory to show syntax highlighting for large files
set maxmempattern=20000

" ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last
" recently opened files, :FzfHistory uses it
set viminfo='1000

" restore cursor _except_ for commit messages
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" color
syntax enable

  if $VIM_THEME=='atomonelight'
    set background=light
    set termguicolors  " 24-bit color
    colorscheme one
    let g:airline_theme="one"
    let g:one_allow_italics = 1
  endif

  if $VIM_THEME=='onedark'
    set background=light
    set termguicolors  " 24-bit color
    colorscheme onedark
    let g:airline_theme="onedark"
    let g:onedark_terminal_italics = 1
    let g:onedark_hide_endofbuffer = 1
  endif

  if $VIM_THEME=='purify'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme purify
    let g:airline_theme="purify"
  endif

  if $VIM_THEME=='iceberg'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme iceberg
    let g:airline_theme="iceberg"
  endif

  if $VIM_THEME=='iceberg-dark'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme iceberg
    let g:lightline = { 'colorscheme': 'icebergDark' }
    let g:airline_theme="iceberg"
  endif

  if $VIM_THEME=='srcery'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme srcery
    let g:srcery_bold = 1
    let g:srcery_italic = 1
    let g:airline_theme="srcery"
  endif

  if $VIM_THEME=='oceanicnext'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme OceanicNext
    let g:oceanic_next_terminal_bold = 1
    let g:oceanic_next_terminal_italic = 1
    let g:airline_theme="oceanicnext"
  endif

  if $VIM_THEME=='nightowl'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme night-owl
    set termguicolors  " 24-bit color
    let g:airline_theme="nightowl"
  endif

  if $VIM_THEME == 'dracula'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme dracula
    let g:airline_theme="dracula"
  endif

  if $VIM_THEME == 'monokai'
    set background=dark
    set termguicolors  " 24-bit color
    colorscheme monokai
    let g:airline_theme="base16_monokai"
    let g:monokai_term_italic = 1
    let g:monokai_gui_italic = 1
  endif

  if $VIM_THEME == 'papercolor-dark'
    set background=dark
    "set t_Co=256  " 256-bit color, should gracefully degrade
    colorscheme PaperColor
    let g:airline_theme="papercolor"
    let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'allow_bold': 1,
  \       'allow_italic': 1,
  \     }
  \   }
  \ }
  endif

  if $VIM_THEME == 'papercolor-light'
    set background=light
    "set t_Co=256  " 256-bit color, should gracefully degrade
    colorscheme PaperColor
    let g:airline_theme="papercolor"
    let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'allow_bold': 1,
  \       'allow_italic': 1,
  \     }
  \   }
  \ }
  endif

highlight Comment cterm=italic gui=italic


augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L

  autocmd BufWritePre * %s/\s\+$//e " trim trailing whitespace
  autocmd BufNewFile,BufRead Brewfile set syntax=ruby
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  autocmd BufNewFile,BufRead *.fizz set syntax=javascript noexpandtab tabstop=4 shiftwidth=4

  autocmd BufNewFile,BufRead *.js setlocal noet ts=2 sw=2 sts=2
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal et ts=4 sw=4 tw=80
  autocmd BufNewFile,BufRead *plush.html setlocal noet ts=4 sw=4 filetype=html.eruby
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufRead,BufNewFile *.sbt set filetype=scala
  autocmd BufWritePre *.{scala,sbt} Neoformat

  autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  " autocmd FileType json autocmd BufWritePre <buffer> %!python -m json.tool
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
  autocmd FileType html,eruby,erb,tmpl let b:closetag_html_style=1
augroup END

"=============== Airline ============================
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


"=====================================================
"===================== MAPPINGS ======================

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","

noremap <C-s> :update<CR>
inoremap <C-s> <C-o>:update<CR>

" Handy keyboard keys while in insert mode.  C-o makes next char run in normal
" mode
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>l
inoremap <C-b> <C-o>h

" Emacs friendlier bindings that I'm used to hitting
nnoremap <C-e> $

" Some useful quickfix shortcuts for quickfix
map <C-n> :cn<CR>
map <C-p> :cp<CR>
nnoremap <leader>a :cclose<CR>

" put quickfix window always to the bottom
augroup quickfix
    autocmd!
    autocmd FileType qf wincmd J
    autocmd FileType qf setlocal wrap
augroup END

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Center the screen
nnoremap <space> zz

" Close all but the current one
nnoremap <leader>o :only<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h map <C-l> <C-W>l


" Print full path
map <C-f> :echo expand("%:p")<cr>

" Terminal settings
" if has('terminal')
"   " Kill job and close terminal window
"   tnoremap <Leader>q <C-w><C-C><C-w>c<cr>

"   " switch to normal mode with esc
"   tnoremap <Esc> <C-W>N

"   " mappings to move out from terminal to other views
"   tnoremap <C-h> <C-w>h
"   tnoremap <C-j> <C-w>j
"   tnoremap <C-k> <C-w>k
"   tnoremap <C-l> <C-w>l

"   " Open terminal in vertical, horizontal and new tab
"   nnoremap <leader>tv :vsplit<cr>:term ++curwin<CR>
"   nnoremap <leader>ts :split<cr>:term ++curwin<CR>
"   nnoremap <leader>tt :tabnew<cr>:term ++curwin<CR>

"   tnoremap <leader>tv <C-w>:vsplit<cr>:term ++curwin<CR>
"   tnoremap <leader>ts <C-w>:split<cr>:term ++curwin<CR>
"   tnoremap <leader>tt <C-w>:tabnew<cr>:term ++curwin<CR>

"   " always start terminal in insert mode when I switch to it
"   " NOTE(arslan): startinsert doesn't work in Terminal-normal mode.
"   " autocmd WinEnter * if &buftype == 'terminal' | call feedkeys("i") | endif
" endif
" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif


" hit jj or fd for escape
imap jj <Esc>
imap fd <Esc>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Act like D and C
nnoremap Y y$

" Do not show stupid q: window
map q: :q

" mimic the behavior of /%Vfoobar which searches within the previously
" selected visual selection
" while in search mode, pressing / will do this
vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Rust
let g:rustfmt_autosave = 1

" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

" === vim-go
" disable vim-go :GoDef short cut (gd). this is handled by Coc
let g:go_def_mapping_enabled = 0

let g:go_highlight_trailing_whitespace_error=0

" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

"===================== PLUGINS ======================
let g:rainbow_active = 1
noremap <Leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
" hit '-' to choose windows
nmap  -  <Plug>(choosewin)
let g:vim_json_syntax_conceal = 0
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]

" === Signify
let g:signify_vcs_list = ['git']
nmap <silent> gj <plug>(signify-next-hunk)
nmap <silent> gk <plug>(signify-prev-hunk)

" === markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['go=go', 'viml=vim', 'bash=sh']
let g:vim_markdown_conceal = 0
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1

" === Startify
let g:startify_change_to_vcs_root = 1

" Add icons to each entry
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" === Ferret
let g:FerretExecutable='rg,ag'
nmap <leader>f  <Plug>(FerretAck)
nmap <leader>*  <Plug>(FerretAckWord)

nmap <silent> ; :Buffers<CR>
nnoremap <c-p> :FZF<cr>
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>
" nnoremap <Leader>f :Ack!<Space>
" nnoremap <Leader>/ :Ack!<Space>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" end of until its fixed

" === TMUX
" save files when switching from vim to tmux
let g:tmux_navigator_save_on_switch = 2

" === ALE
" specify some specific ale linter sources, rest are using defaults
let g:VIM_Linter = 'ale'
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'go': ['gofmt', 'goimports'],
      \ 'css': ['prettier'],
      \}
let g:ale_gofmt_options='-s'
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0 "using CoC
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'c': ['clang', 'clangtidy', 'clang-format'],
      \ 'typescript': ['eslint'],
      \ 'go': ['golangci-lint'],
      \ 'sh': ['shellcheck']}
let g:ale_python_flake8_args='--exclude=migrations --ignore=E261 --max-line-length=80'
let g:ale_golangci_lint_options="'--enable-all'"
"let g:ale_golangci_lint_options="'--fast'"
let g:ale_go_golangci_lint_options = '
  \ --config=~/.config/golangci.yml
  \ --fast
  \'
let g:ale_go_golangci_lint_package = 1

let g:ale_set_signs = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE guifg=#ff6D00 ctermfg=red
highlight ALEWarningSign ctermbg=NONE guifg=#ffBB00 ctermfg=yellow

" Javascript / React improved highlighting/indentation
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" map error jumping to [e and ]e
nnoremap <silent> <Plug>LocationPrevious    :<C-u>exe 'call <SID>LocationPrevious()'<CR>
nnoremap <silent> <Plug>LocationNext        :<C-u>exe 'call <SID>LocationNext()'<CR>
nmap <silent> [e  <Plug>LocationPrevious
nmap <silent> ]e  <Plug>LocationNext
" make error jumping wrap
function! <SID>LocationPrevious()
    try
        lprev
    catch /^Vim\%((\a\+)\)\=:E553/
        llast
    endtry
endfunction
function! <SID>LocationNext()
    try
        lnext
    catch /^Vim\%((\a\+)\)\=:E553/
        lfirst
    endtry
endfunction

" === COC
let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-git',
  \ 'coc-html',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-emmet',
  \ 'coc-python',
  \ 'coc-prettier',
  \ 'coc-css',
  \ 'coc-rls'
  \ ]
" Improve completion for coc:
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" dan comment out these two lines because the code above is newer
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

highlight CocErrorSign ctermfg=red ctermbg=NONE guifg=#ff6D00
highlight CocWarningSign ctermfg=yellow ctermbg=NONE guifg=#ffbb00

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc-pairs needs this to make it nicely indent on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR> " vim-go overwrites
nnoremap <silent> I :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for do action format
nnoremap <silent> F :call CocAction('format')<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> gx <Plug>(coc-fix-current)
nmap <silent> ga <Plug>(coc-codeaction)


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_executive_for = {
  \ 'go': 'coc',
  \ 'sh': 'coc',
  \ 'scala': 'coc',
  \ }
let g:vista#renderer#enable_icon = 0

nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" fuzzy finder for tas
nnoremap <silent> <space>o  :<C-u>Vista finder coc<CR>
" tag list:
nnoremap <silent> <space>t  :<C-u>Vista coc<CR>
" toggle vista window
nnoremap <silent> <space>v  :<C-u>Vista!<CR>
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Scala stuff
nnoremap <silent> <M-B> :call CocRequest('scalametals', 'workspace/executeCommand', { 'command': 'build-import' })<CR>
let g:neoformat_scala_scalafmt = {
        \ 'exe': 'ng',
        \ 'args': ['scalafmt', '--stdin'],
        \ 'stdin': 1,
        \ }


"=============== Lightline ============================
let g:Lightline_Linter = [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
source ~/.config/nvim/lightline.vimrc
