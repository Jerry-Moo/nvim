local api = vim.api
require('keymap.remap')
local map = require('core.keymap')
local cmd = map.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
map.n({ [' '] = '' })
map.x({ [' '] = '' })

-- usage example
map.n({
  -- plugin manager: Lazy.nvim
  ['<Leader>pu'] = cmd('Lazy update'),
  ['<Leader>pi'] = cmd('Lazy install'),
  -- nvimtree
  ['<Leader>e'] = cmd('NvimTreeToggle'),
  -- Telescope
  ['<Leader>fb'] = cmd('Telescope buffers'),
  ['<Leader>fa'] = cmd('Telescope live_grep'),
  ['<Leader>fw'] = cmd('Telescope grep_string'),
  ['<Leader>ff'] = cmd('Telescope find_files'),
  -- Lsp
  ['<Leader>li'] = cmd('LspInfo'),
  ['<Leader>ll'] = cmd('LspLog'),
  ['<Leader>lr'] = cmd('LspRestart'),
  -- Lspsaga
  ['K'] = cmd('Lspsaga hover_doc'),
  ['gd'] = cmd('Lspsaga peek_definition'),
  ['gD'] = cmd('lua vim.lsp.buf.definition()'),
})
