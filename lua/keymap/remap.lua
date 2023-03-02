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
  -- switch window
  ['<C-h>'] = '<C-w>h',
  ['<C-l>'] = '<C-w>l',
  ['<C-j>'] = '<C-w>j',
  ['<C-k>'] = '<C-w>k',
  -- resize window
  ['<A-h>'] = cmd('vertical resize -5'),
  ['<A-l>'] = cmd('vertical resize +5'),
  ['<A-j>'] = cmd('resize +5'),
  ['<A-k>'] = cmd('resize -5'),
  -- window
  ['<Leader>1'] = '1gt',
  ['<Leader>2'] = '2gt',
  ['<Leader>3'] = '3gt',
  ['<Leader>4'] = '4gt',
  ['<Leader>5'] = '5gt',
  ['<Leader>6'] = '6gt',
  ['<Leader>7'] = '7gt',
  ['<Leader>8'] = '8gt',
  ['<Leader>9'] = '9gt',
  ['<Leader>0'] = cmd('tablast'),
  -- Mac
  ['˙'] = cmd('vertical resize -5'),
  ['¬'] = cmd('vertical resize +5'),
  ['∆'] = cmd('resize +5'),
  ['˚'] = cmd('resize -5'),
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
