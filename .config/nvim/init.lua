vim.api.nvim_create_autocmd('CursorHold', {
    callback = function () vim.lsp.buf.document_highlight() end
})
vim.api.nvim_create_autocmd('CursorMoved', {
    callback = function () vim.lsp.buf.clear_references() end
})
vim.api.nvim_create_autocmd('FileType', {
    callback = function (event) vim.opt.expandtab = false end,
    pattern = { 'c' }
})
vim.api.nvim_create_autocmd('FileType', {
    callback = function (event)
        vim.lsp.start({ cmd = { 'clangd' }, name = 'clangd' })
    end,
    pattern = { 'c', 'cpp' }
})
vim.api.nvim_create_autocmd('FileType', {
    callback = function (event)
        vim.lsp.start({
            cmd = { 'typescript-language-server', '--stdio' },
            name = 'typescript-language-server',
            root_dir = vim.fs.root(event.buf, { 'package.json' })
        })
    end,
    pattern = 'javascript'
})
vim.api.nvim_create_autocmd('FileType', {
    callback = function (event) vim.opt.laststatus = 0 end,
    pattern = { 'netrw' }
})
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function (event)
        vim.keymap.set('n', '<Leader>F', vim.lsp.buf.format, {
            buffer = event.buf
        })
    end
})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function ()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 128 })
    end
})

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#171717' })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#525252' })
vim.api.nvim_set_hl(0, 'Constant', { fg = '#c7d7ed' })
vim.api.nvim_set_hl(0, 'CurSearch', { bg = '#c7edde', fg = '#171717' })
vim.api.nvim_set_hl(0, 'CursorLine', {})
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#edc7d6' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#edeac7' })
vim.api.nvim_set_hl(0, 'Directory', { fg = '#c7d7ed' })
vim.api.nvim_set_hl(0, 'Function', {})
vim.api.nvim_set_hl(0, 'Identifier', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#323232' })
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#323232' })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#323232' })
vim.api.nvim_set_hl(0, 'NonText', { fg = '#323232' })
vim.api.nvim_set_hl(0, 'Normal', {})
vim.api.nvim_set_hl(0, 'Pmenu', { bg = '#171717' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#323232' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#323232' })
vim.api.nvim_set_hl(0, 'Question', {})
vim.api.nvim_set_hl(0, 'Search', { bg = '#323232' })
vim.api.nvim_set_hl(0, 'Special', { fg = '#c7e2ed' })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = '#323232' })
vim.api.nvim_set_hl(0, 'Statement', {})
vim.api.nvim_set_hl(0, 'StatusLine', {})
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#323232' })
vim.api.nvim_set_hl(0, 'String', { fg = '#898989' })
vim.api.nvim_set_hl(0, 'TablineSel', {})
vim.api.nvim_set_hl(0, 'Visual', { bg = '#c7edde', fg = '#171717' })
vim.api.nvim_set_hl(0, 'WinSeparator', { bold = true, fg = '#171717' })

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

for i = 1, 10 do
    vim.keymap.set(
        'n',
        string.format('<A-%d>', i),
        string.format('<cmd>tabnext %d<CR>', i)
    )
end
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-t>', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<Leader>P', function ()
    vim.cmd(
        'terminal node --prof %;' ..
        'echo;' ..
        'LOG="$(ls -t isolate*v8.log | head -n 1)";' ..
        'node --no-warnings --prof-process "$LOG";' ..
        'rm "$LOG"'
    )
end)
vim.keymap.set('n', '<Leader>f', '<cmd>Files<CR>')
vim.keymap.set('n', '<Leader>g', '<cmd>GFiles<CR>')
vim.keymap.set('n', '<Leader>n', '<cmd>terminal node %<CR>')

vim.opt.clipboard = 'unnamedplus'
vim.opt.colorcolumn = { 80 }
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.list = true
vim.opt.listchars = { extends = '>', precedes = '<', tab = '> ', trail = '.' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.rtp:append('/usr/share/doc/fzf/examples')
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.statusline = '%=%F%( %#String#%{FugitiveHead()}%)%='
vim.opt.tabstop = 4
vim.opt.updatetime = 1000
vim.opt.wrap = false
