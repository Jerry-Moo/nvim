local map = require('core.keymap')
local cmd = map.cmd

map.n({
  -- close buffer
  ['<C-x>k'] = cmd('bdelete'),
  -- save
  ['<C-s>'] = cmd('write'),
  -- buffer jump
  [']b'] = cmd('bn'),
  ['[b'] = cmd('bp'),
  -- force quit all
  ['<C-q>'] = cmd('qa!'),
  -- remove trailing white space
  ['<Leader>t'] = cmd('TrimTrailingWhitespace'),
  -- yank
  ['Y'] = 'y$',
  -- window jump
  ['<C-h>'] = '<C-w>h',
  ['<C-l>'] = '<C-w>l',
  ['<C-j>'] = '<C-w>j',
  ['<C-k>'] = '<C-w>k',
  -- resize window
  ['<A-[>'] = cmd('vertical resize -5'),
  ['<A-]>'] = cmd('vertical resize +5'),
})

-- insertmode remap
map.i({
  ['<C-w>'] = '<C-[>diwa',
  ['<C-h>'] = '<Bs>',
  ['<C-d>'] = '<Del>',
  ['<C-u>'] = '<C-G>u<C-u>',
  ['<C-b>'] = '<Left>',
  ['<C-f>'] = '<Right>',
  ['<C-a>'] = '<Esc>^i',
  ['<C-j>'] = '<Esc>o',
  ['<C-k>'] = '<Esc>O',
  ['<C-s>'] = '<ESC>:w<CR>',
})

map.i('<c-e>', function()
  return vim.fn.pumvisible() == 1 and '<C-e>' or '<End>'
end, { expr = true })

-- commandline remap
map.c({
  ['<C-b>'] = '<Left>',
  ['<C-f>'] = '<Right>',
  ['<C-a>'] = '<Home>',
  ['<C-e>'] = '<End>',
  ['<C-d>'] = '<Del>',
  ['<C-h>'] = '<BS>',
})

map.t('<Esc>', [[<C-\><C-n>]])
