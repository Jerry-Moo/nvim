local package = require('core.pack').package
local conf = require('modules.completion.config')

local enable_lsp_filetype = {
  'go',
  'lua',
  'sh',
  'rust',
  'c',
  'cpp',
  'typescript',
  'json',
  'python',
}

package({
  'neovim/nvim-lspconfig',
  -- used filetype to lazyload lsp
  -- config your language filetype in here
  ft = enable_lsp_filetype,
  config = conf.nvim_lsp,
})

package({
  'williamboman/mason.nvim',
  event = 'VimEnter',
  config = conf.mason,
})

package({
  'glepnir/lspsaga.nvim',
  event = 'BufRead',
  config = conf.lspsaga,
})

-- package({
--   'windwp/nvim-autopairs',
--   event = 'InsertEnter',
--   config = conf.auto_pairs,
-- })

-- lua 编辑调试插件
package({
  'ii14/emmylua-nvim',
  ft = 'lua',
})
