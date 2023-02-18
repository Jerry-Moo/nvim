local config = {}

function config.zephyr()
  vim.cmd.colorscheme('zephyr')
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

return config
