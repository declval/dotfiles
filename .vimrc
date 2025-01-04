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

highlight Comment guifg=#949494
highlight Constant guifg=#949494
highlight CurSearch guibg=#949494 guifg=#202020
highlight CursorColumn guibg=#444444
highlight CursorLine cterm=NONE guibg=NONE
highlight CursorLineNr cterm=NONE guifg=#ffffff
highlight Directory guifg=#a9a4df
highlight Error guibg=#de4978 guifg=#202020
highlight ErrorMsg guibg=NONE guifg=#de4978
highlight Identifier guifg=#ffffff
highlight LineNr guifg=#949494
highlight LspErrorText guifg=#949494
highlight LspHintText guifg=#949494
highlight LspInformationText guifg=#949494
highlight LspWarningText guifg=#949494
highlight MatchParen guibg=#444444
highlight MoreMsg guifg=#949494
highlight NonText guifg=#444444
highlight Pmenu guibg=#202020 guifg=#949494
highlight PmenuSbar guibg=#202020
highlight PmenuSel guibg=NONE guifg=#ffffff
highlight PmenuThumb guibg=#444444
highlight PreProc guifg=#ffffff
highlight Question guifg=#949494
highlight Search guibg=#444444 guifg=NONE
highlight Special guifg=#949494
highlight SpecialKey guifg=#444444
highlight Statement guifg=#ffffff
highlight Todo guibg=#ffed75 guifg=#202020
highlight Type guifg=#949494
highlight Visual guibg=#444444 guifg=NONE
highlight WarningMsg guifg=#de4978

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
set listchars=extends:>,precedes:<,tab:>\ ,trail:.
set mouse=a
set nowrap
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
