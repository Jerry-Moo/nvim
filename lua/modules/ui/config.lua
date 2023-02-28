local config = {}

function config.nvim_tree()
  require('nvim-tree').setup({
    -- 完全禁止内置netrw
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
      dotfiles = true,
      -- 隐藏 node_modules 文件夹
      -- custom = { 'node_modules' },
    },
    view = {
      -- 宽度
      width = 30,
      -- 左/右
      side = 'left',
      -- 隐藏根目录
      hide_root_folder = true,
      -- 不显示行数
      -- number = false,
      relativenumber = true,
      -- 显示图标
      signcolumn = "yes",
    },
  })
  -- 自动关闭
  vim.cmd([[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
  ]])
end

function config.indent_blankline()
  require('indent_blankline').setup({
    char = '│',
    use_treesitter_scope = true,
    show_first_indent_level = true,
    show_current_context = false,
    show_current_context_start = false,
    show_current_context_start_on_current_line = false,
    filetype_exclude = {
      'dashboard',
      'log',
      'fugitive',
      'gitcommit',
      'packer',
      'markdown',
      'json',
      'txt',
      'vista',
      'help',
      'todoist',
      'git',
      'TelescopePrompt',
      'undotree',
    },
    buftype_exclude = { 'terminal', 'nofile', 'prompt' },
    context_patterns = {
      'class',
      'function',
      'method',
      'block',
      'list_literal',
      'selector',
      '^if',
      '^table',
      'if_statement',
      'while',
      'for',
    },
  })
end

return config
