local package = require('core.pack').package
local conf = require('modules.editor.config')

package({
  'nvim-treesitter/nvim-treesitter',
  event = 'BufRead',
  run = ':TSUpdate',
  config = conf.nvim_treesitter,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
})

package({ -- markdown preview
  'toppair/peek.nvim',
  ft = { 'markdown' },
  build = 'deno task --quiet build:fast',
  config = conf.peek,
})
