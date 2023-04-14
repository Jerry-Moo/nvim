local conf = require('modules.editor.config')

packadd({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
})

packadd({ -- markdown preview
  'toppair/peek.nvim',
  ft = { 'markdown' },
  build = 'deno task --quiet build:fast',
  config = conf.peek,
})
