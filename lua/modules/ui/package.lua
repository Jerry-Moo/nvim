local package = require('core.pack').package
local conf = require('modules.ui.config')

package({
  'ellisonleao/gruvbox.nvim',
  config = function()
    vim.cmd.colorscheme('gruvbox')
  end,
})

package({
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = conf.dashboard,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

package({
  'nvim-tree/nvim-tree.lua',
  cmd = 'NvimTreeToggle',
  config = conf.nvim_tree,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
})

package({
  'lukas-reineke/indent-blankline.nvim',
  event = 'BufRead',
  config = conf.indent_blankline,
})

package({
  'lewis6991/gitsigns.nvim',
  event = { 'BufRead', 'BufNewFile' },
  config = conf.gitsigns,
})
