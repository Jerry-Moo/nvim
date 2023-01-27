local config = {}

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr') -- 开启 Folding
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  vim.api.nvim_command('set foldlevel=99') -- 默认不要折叠
  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all', -- 安装 language parser
    ignore_install = { 'phpdoc' },
    highlight = { -- 启用代码高亮功能
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
    },
  })
end

return config
