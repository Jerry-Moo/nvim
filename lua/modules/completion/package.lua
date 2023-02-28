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
  ft = enable_lsp_filetype,
  event = 'BufRead',
  config = conf.lspsaga,
})

package({
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  config = conf.nvim_cmp,
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    -- icon
    { 'onsails/lspkind.nvim'},
  },
})

package({
  'L3MON4D3/LuaSnip',
  event = 'InsertCharPre',
  config = conf.lua_snip,
  dependencies = { 'saadparwaiz1/cmp_luasnip' },
})

package({ 'windwp/nvim-autopairs', event = 'InsertEnter', config = conf.auto_pairs })

-- lua 编辑调试插件
package({
  'ii14/emmylua-nvim',
  ft = 'lua',
})
