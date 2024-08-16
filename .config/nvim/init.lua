vim.api.nvim_create_autocmd('BufRead', {
    callback = function() vim.opt_local.filetype = 'c' end,
    pattern = '*.h'
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        vim.lsp.start({ cmd = { 'clangd' }, name = 'clangd' })

        vim.opt.expandtab = false
        vim.opt.shiftwidth = 8
        vim.opt.softtabstop = 8
        vim.opt.tabstop = 8
    end,
    pattern = 'c'
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        vim.lsp.start({
            cmd = { 'typescript-language-server', '--stdio' },
            name = 'typescript-language-server'
        })
    end,
    pattern = 'javascript'
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help)
        vim.keymap.set('n', '<Leader>F', vim.lsp.buf.format)
        vim.keymap.set('n', '<Leader>S', vim.lsp.buf.workspace_symbol)
        vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action)
        vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition)
        vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover)
        vim.keymap.set('n', '<Leader>i', vim.lsp.buf.implementation)
        vim.keymap.set('n', '<Leader>r', vim.lsp.buf.references)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename)
        vim.keymap.set('n', '<Leader>s', vim.lsp.buf.document_symbol)
        vim.keymap.set('n', '<Leader>t', vim.lsp.buf.type_definition)
    end
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 100 })
    end,
    pattern = '*'
})

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#191919' })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#444444' })
vim.api.nvim_set_hl(0, 'Constant', { fg = '#a2a2a2' })
vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#abd7f2', fg = '#181818' })
vim.api.nvim_set_hl(0, 'CursorLine', {})
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#444444' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#444444' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#444444' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#444444' })
vim.api.nvim_set_hl(0, 'Directory', { fg = '#abd7f2' })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = '#fc79a2' })
vim.api.nvim_set_hl(0, 'Function', {})
vim.api.nvim_set_hl(0, 'Identifier', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#444444' })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#202020' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#444444' })
vim.api.nvim_set_hl(0, 'NonText', { fg = '#202020' })
vim.api.nvim_set_hl(0, 'Normal', {})
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#202020', fg = '#a2a2a2' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#202020', fg = '#ffffff' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#444444' })
vim.api.nvim_set_hl(0, 'Search', { bg = '#202020' })
vim.api.nvim_set_hl(0, 'Special', { fg = '#fffdc9' })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = '#878787' })
vim.api.nvim_set_hl(0, 'Statement', {})
vim.api.nvim_set_hl(0, 'StatusLine', {})
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#a2a2a2' })
vim.api.nvim_set_hl(0, 'String', { fg = '#878787' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#202020' })

vim.diagnostic.config({
    underline = false,
    virtual_text = {
        prefix = '*',
        spacing = 0
    }
})

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set('n', '<Leader>f', vim.cmd.Files)
vim.keymap.set('n', '<Leader>u', vim.cmd.UndotreeToggle)

vim.opt.colorcolumn = { 80 }
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = { extends = '>', precedes = '<', tab = '  ', trail = '.' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scroll = 8
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = 'no'
vim.opt.softtabstop = 4
vim.opt.statusline = '%=%F%='
vim.opt.tabstop = 4
vim.opt.undofile = true
vim.opt.wrap = false
