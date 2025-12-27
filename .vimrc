filetype plugin indent on

syntax on

autocmd FileType c {
    set noexpandtab
    set shiftwidth=8
    set softtabstop=8
    set tabstop=8
}

autocmd FileType netrw {
    highlight Function ctermfg=NONE
}

autocmd FileType typescript,typescriptreact {
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
}

highlight Comment ctermfg=7
highlight Constant ctermfg=7
highlight CurSearch ctermbg=4 ctermfg=0
highlight CursorLine cterm=NONE
highlight CursorLineNr cterm=NONE ctermfg=4
highlight ErrorMsg ctermbg=NONE ctermfg=1
highlight Identifier ctermfg=5
highlight LineNr ctermfg=7
highlight LspErrorHighlight ctermbg=NONE
highlight LspErrorText ctermfg=8
highlight LspHintHighlight ctermbg=NONE
highlight LspHintText ctermfg=8
highlight LspWarningHighlight ctermbg=NONE
highlight LspWarningText ctermfg=8
highlight MatchParen ctermbg=8
highlight MoreMsg ctermbg=NONE ctermfg=7
highlight NonText ctermfg=8
highlight Pmenu ctermbg=NONE ctermfg=8
highlight PmenuSbar ctermbg=NONE
highlight PmenuSel ctermbg=NONE ctermfg=NONE
highlight PmenuThumb ctermbg=0
highlight PreProc ctermfg=NONE
highlight Search ctermbg=8
highlight SignColumn ctermbg=NONE
highlight Sneak ctermbg=8 ctermfg=NONE
highlight SneakCurrent ctermbg=4 ctermfg=0
highlight Special ctermfg=7
highlight SpecialKey ctermfg=8
highlight Statement ctermfg=NONE
highlight Type ctermfg=NONE
highlight Visual ctermbg=4 ctermfg=0

let g:netrw_banner = 0
let g:netrw_liststyle = 3

nmap <Space>f :Files<CR>
nmap <silent> <Esc> :nohlsearch<CR>

set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set list
set listchars=extends:>,precedes:<,tab:<->,trail:.
set noruler
set noshowmode
set nowrap
set number
set relativenumber
set runtimepath+=/usr/share/doc/fzf/examples
set shiftwidth=4
set sidescroll=1
set smartcase
set softtabstop=4
set tabstop=4
set ttimeoutlen=100
set undodir=~/.vim/undo
set undofile

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no
    setlocal tagfunc=lsp#tagfunc

    let g:lsp_diagnostics_virtual_text_align = 'right'
    let g:lsp_document_highlight_enabled = 0

    nmap <buffer> <Leader>a <plug>(lsp-code-action)
    nmap <buffer> <Leader>f <plug>(lsp-document-format)
    nmap <buffer> <Leader>h <plug>(lsp-hover)
    nmap <buffer> <Leader>rn <plug>(lsp-rename)
    nmap <buffer> g[ <plug>(lsp-previous-diagnostic)
    nmap <buffer> g] <plug>(lsp-next-diagnostic)
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gs <plug>(lsp-document-symbol)

    nnoremap <buffer> <expr><C-D> lsp#scroll(1)
    nnoremap <buffer> <expr><C-U> lsp#scroll(-1)
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
