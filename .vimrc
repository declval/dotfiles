filetype plugin indent on

syntax on

highlight Comment ctermfg=7
highlight Constant ctermfg=7
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
highlight Special ctermfg=7
highlight SpecialKey ctermfg=8
highlight Statement ctermfg=NONE
highlight Type ctermfg=NONE
highlight Visual ctermbg=4

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no
    setlocal tagfunc=lsp#tagfunc

    nmap <buffer> <Leader>f <plug>(lsp-document-format)
    nmap <buffer> <Leader>rn <plug>(lsp-rename)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)

    let g:lsp_diagnostics_virtual_text_align = 'right'
    let g:lsp_document_highlight_enabled = 0
endfunction

augroup lsp_install
    autocmd!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set expandtab
set list
set listchars=extends:>,precedes:<,tab:<->,trail:.
set noruler
set noshowmode
set nowrap
set number
set relativenumber
set scrolloff=8
set shiftwidth=4
set sidescroll=1
set softtabstop=4
set tabstop=4
set ttimeoutlen=100
