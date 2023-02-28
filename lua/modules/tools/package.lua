local package = require('core.pack').package
local conf = require('modules.tools.config')

package({ -- css 着色器
  'norcalli/nvim-colorizer.lua',
  ft = { 'lua', 'css', 'html', 'sass', 'less', 'typescriptreact' },
  config = function()
    require('colorizer').setup()
  end,
})

package({
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
})
