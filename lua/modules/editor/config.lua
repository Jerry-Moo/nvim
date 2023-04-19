local config = {}

function config.lua_snip()
  local ls = require('luasnip')
  ls.config.set_config({
    delete_check_events = 'TextChanged,InsertEnter',
  })
  require('luasnip.loaders.from_vscode').lazy_load({
    paths = { './snippets/' },
  })
end

function config.auto_pairs()
  require('nvim-autopairs').setup({})
  local status, cmp = pcall(require, 'cmp')
  if not status then
    vim.cmd([[packadd nvim-cmp]])
    cmp = require('cmp')
  end
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )
end

function config.nvim_treesitter()
  vim.api.nvim_command('set foldmethod=expr') -- 开启 Folding
  vim.api.nvim_command('set foldexpr=nvim_treesitter#foldexpr()')
  vim.api.nvim_command('set foldlevel=99') -- 默认不要折叠

  local ignored = {
    'phpdoc',
    'astro',
    'arduino',
    'beancount',
    'bibtex',
    'bluprint',
    'eex',
    'ecma',
    'elvish',
    'embedded_template',
    'vala',
    'wgsl',
    'verilog',
    'twig',
    'turtle',
    'm68k',
    'hocon',
    'lalrpop',
    'ledger',
    'meson',
    'mehir',
    'rasi',
    'rego',
    'racket',
    'pug',
    'java',
    'tlaplus',
    'supercollider',
    'slint',
    'sparql',
    'rst',
    'rnoweb',
    'm68k',
    'smali',
  }

  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all', -- 安装 language parser
    ignore_install = ignored,
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

function config.peek()
  local peek = require('peek')
  peek.setup({
    app = 'browser',
    theme = 'light',
    vim.api.nvim_create_user_command('PeekOpen', peek.open, {}),
    vim.api.nvim_create_user_command('PeekClose', peek.close, {}),
  })
end

return config
