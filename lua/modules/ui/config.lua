local config = {}

function config.dashboard()
  local db = require('dashboard')
  db.setup({
    theme = 'hyper',
    config = {
      week_header = {
        enable = true,
      },
      project = {
        enable = true,
      },
      disable_move = true,
      shortcut = {
        { desc = 'Update', icon = ' ', group = '@variable', action = 'Lazy update', key = 'u' },
        {
          icon = ' ',
          desc = 'Files',
          group = '@variable',
          action = 'Telescope find_files',
          key = 'f',
        },
        {
          icon = ' ',
          desc = 'Apps',
          group = '@variable',
          action = 'Telescope app',
          key = 'a',
        },
      },
    },
  })
end

function config.nvim_bufferline()
  require('bufferline').setup({
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
    },
  })
end

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
      hide_root_folder = false,
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

function config.gitsigns()
  require('gitsigns').setup({
    signs = {
      -- add          = { text = '│' },
      -- change       = { text = '│' },
      -- delete       = { text = '_' },
      -- topdelete    = { text = '‾' },
      -- changedelete = { text = '~' },
      -- untracked    = { text = '┆' },
      add = { text = '▍' },
      change = { text = '▍' },
      delete = { text = '▍' },
      topdelete = { text = '▔' },
      changedelete = { text = '▍' },
      untracked = { text = '▍' },
    },
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]g'] = { expr = true, "&diff ? ']g' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
      ['n [g'] = { expr = true, "&diff ? '[g' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".text_object()<CR>',
    },
  })
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
