filetype plugin indent on

syntax on

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

autocmd BufNewFile,BufRead *.h setlocal filetype=c

autocmd FileType c setlocal noexpandtab shiftwidth=8 softtabstop=8

autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': { server_info -> ['clangd'] },
    \ 'allowlist': ['c', 'cpp']
    \ })

autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'typescript-language-server',
    \ 'cmd': { server_info -> ['typescript-language-server', '--stdio'] },
    \ 'allowlist': ['javascript']
    \ })

function s:on_lsp_buffer_enabled()
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no
    setlocal tagfunc=lsp#tagfunc

    nmap <buffer> <Leader>a <plug>(lsp-code-action)
    nmap <buffer> <Leader>f <plug>(lsp-document-format)
    nmap <buffer> <Leader>r <plug>(lsp-references)
    nmap <buffer> <Leader>rn <plug>(lsp-rename)
endfunction

highlight Comment guifg=#b8b8b8
highlight Constant guifg=#b8b8b8
highlight CurSearch guibg=#b8b8b8 guifg=#181818
highlight CursorColumn guibg=#383838
highlight CursorLine cterm=NONE guibg=NONE
highlight CursorLineNr cterm=NONE guifg=#ffffff
highlight Directory guifg=#96a8fa
highlight Error guibg=#ed5580 guifg=#181818
highlight ErrorMsg guibg=NONE guifg=#ed5580
highlight Identifier guifg=#ffffff
highlight LineNr guifg=#b8b8b8
highlight LspErrorText guifg=#b8b8b8
highlight LspHintText guifg=#b8b8b8
highlight LspInformationText guifg=#b8b8b8
highlight LspWarningText guifg=#b8b8b8
highlight MatchParen guibg=#383838
highlight MoreMsg guifg=#b8b8b8
highlight NonText guifg=#383838
highlight Pmenu guibg=#181818 guifg=#b8b8b8
highlight PmenuSbar guibg=#181818
highlight PmenuSel guibg=NONE guifg=#ffffff
highlight PmenuThumb guibg=#383838
highlight PreProc guifg=#ffffff
highlight Question guifg=#b8b8b8
highlight Search guibg=#383838 guifg=NONE
highlight Special guifg=#b8b8b8
highlight SpecialKey guifg=#383838
highlight Statement guifg=#ffffff
highlight Todo guibg=#f0ed8d guifg=#181818
highlight Type guifg=#b8b8b8
highlight Visual guibg=#383838 guifg=NONE
highlight WarningMsg guifg=#ed5580

let g:lsp_diagnostics_virtual_text_align='right'
let g:netrw_banner=0
let g:netrw_liststyle=3

nmap <Leader>k :!clear && kotlinc % -include-runtime -d %:r.jar && java -jar %:r.jar && rm %:r.jar<CR>
nmap <Leader>n :!clear && node %<CR>
nmap <silent> <Esc> :nohlsearch<CR>

set clipboard=unnamedplus
set cursorline
set expandtab
set hlsearch
set incsearch
set list
set listchars=tab:>\ ,trail:.
set mouse=a
set number
set relativenumber
set scrolloff=8
set shiftwidth=4
set sidescroll=1
set softtabstop=4
set termguicolors
set ttimeoutlen=0
set undodir=$HOME/.vim/undo
set undofile
