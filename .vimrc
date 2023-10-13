filetype plugin on

syntax enable

colorscheme custom

nmap <BS> :let @/ = ""<CR>
nmap <Leader>g :!clear && gcc '%' && ./a.out<CR>
nmap <Leader>n :!clear && node '%'<CR>

set backspace=eol,start
set clipboard=unnamedplus
set colorcolumn=80
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set list
set listchars=tab:>\\x20,trail:.
set mouse=a
set noruler
set number
set relativenumber
set shiftwidth=4
set smartcase
set softtabstop=4
set tabstop=4
