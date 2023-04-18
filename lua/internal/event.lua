local api = vim.api
local nvim_create_autocmd = api.nvim_create_autocmd
local my_group = vim.api.nvim_create_augroup('JerryMooGroup', {})

nvim_create_autocmd('VimEnter', {
  group = my_group,
  callback = function ()
    vim.defer_fn(function ()
      require('keymap')
    end, 5)
  end,
  desc = 'Load my keymap',
})

nvim_create_autocmd({ 'BufWritePre' }, {
  group = my_group,
  pattern = { '/tmp/*', 'COMMIT_EDITMSG', 'MERGE_MSG', '*.tmp', '*.bak' },
  command = 'setlocal noundofile',
})

nvim_create_autocmd('BufRead', {
  group = my_group,
  pattern = '*.conf',
  command = 'setlocal filetype=conf',
})

nvim_create_autocmd('TextYankPost', {
  group = my_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 400 })
  end,
})

-- disable default syntax in these file.
-- when file is larged ,load regex syntax
-- highlight will cause very slow
nvim_create_autocmd('Filetype', {
  group = my_group,
  pattern = '*.c,*.cpp,*.lua,*.go,*.rs,*.py,*.ts,*.tsx',
  command = 'syntax off',
})

nvim_create_autocmd({ 'CursorHold' }, {
  group = my_group,
  pattern = '*',
  callback = function(opt)
    require('internal.cursorword').cursor_moved(opt.buf)
  end,
})

nvim_create_autocmd({ 'InsertEnter' }, {
  group = my_group,
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = false
    require('internal.cursorword').disable_cursorword()
  end,
})

nvim_create_autocmd('InsertLeave', {
  group = my_group,
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = true
  end
})

--disable diagnostic in neovim test file *_spec.lua
nvim_create_autocmd('FileType', {
  group = my_group,
  pattern = 'lua',
  callback = function(opt)
    local fname = api.nvim_buf_get_name(opt.buf)
    if fname:find('%w_spec%.lua') then
      vim.diagnostic.disable(opt.buf)
    end
  end,
})
