function color(n)
    local name = 'color' .. n
    for line in io.lines(os.getenv('HOME') .. '/.Xresources') do
        if string.match(line, name) then
            local fields = {}
            for field in string.gmatch(line, '[^%s]+') do
                table.insert(fields, field)
            end
            return fields[2]
        end
    end
    return nil
end

vim.api.nvim_set_hl(0, 'Comment', { fg = color(7) })
vim.api.nvim_set_hl(0, 'Constant', { fg = color(5) })
vim.api.nvim_set_hl(0, 'Function', { fg = color(8) })
vim.api.nvim_set_hl(0, 'Identifier', { fg = color(3) })
vim.api.nvim_set_hl(0, 'Keyword', { fg = color(3) })
vim.api.nvim_set_hl(0, 'Special', { fg = color(3) })
vim.api.nvim_set_hl(0, 'Statement', {})
vim.api.nvim_set_hl(0, 'String', { fg = color(15) })

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = color(0) })
vim.api.nvim_set_hl(0, 'CursorLine', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { bold = true , fg = color(8) })
vim.api.nvim_set_hl(0, 'LineNr', { fg = color(7) })
vim.api.nvim_set_hl(0, 'NonText', { fg = color(0) })
vim.api.nvim_set_hl(0, 'Normal', {})
vim.api.nvim_set_hl(0, 'Pmenu', { bg = color(0) })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = color(0), fg = color(5) })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = color(7) })
vim.api.nvim_set_hl(0, 'Search', { bg = color(5), fg = color(0) })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = color(7) })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = color(0) })
vim.api.nvim_set_hl(0, 'Visual', { bg = color(0) })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = color(0) })

vim.opt.colorcolumn = { 80 }
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.laststatus = 0
vim.opt.list = true
vim.opt.listchars = { tab = '<->', trail = '.' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = false
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.smartcase = true

vim.keymap.set('n', '<bs>', function() vim.cmd('nohlsearch') end)
vim.keymap.set('n', '<leader>n', function() vim.cmd('terminal node %') end)
