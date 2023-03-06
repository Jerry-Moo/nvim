local api = vim.api
require('keymap.remap')
local map = require('core.keymap')
local cmd = map.cmd

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
  ['<Leader>ff'] = cmd('Telescope find_files find_command=rg,--ignore,--hidden,--files'),
  -- Lsp
  ['<Leader>li'] = cmd('LspInfo'),
  ['<Leader>ll'] = cmd('LspLog'),
  ['<Leader>lr'] = cmd('LspRestart'),
  -- Lspsaga
  ['K'] = cmd('Lspsaga hover_doc'),
  ['gd'] = cmd('Lspsaga peek_definition'),
  ['gD'] = cmd('lua vim.lsp.buf.definition()'), -- 比 cmd('Lspsaga goto_definition') 好用
})

map.n('<Leader>E', function()
  vim.cmd('Telescope file_browser')
  local esc_key = api.nvim_replace_termcodes('<Esc>', true, false, true)
  api.nvim_feedkeys(esc_key, 'n', false)
end)
