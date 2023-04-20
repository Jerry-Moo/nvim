local conf = require('modules.editor.config')

packadd({
  'L3MON4D3/LuaSnip',
  event = 'InsertCharPre',
  config = conf.lua_snip,
  dependencies = { 'saadparwaiz1/cmp_luasnip' },
})

packadd({
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = conf.auto_pairs,
})

packadd({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
})

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

packadd({
  'ii14/emmylua-nvim',
  ft = 'lua',
})
