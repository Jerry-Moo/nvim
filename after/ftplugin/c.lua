vim.opt.commentstring = "//%s"
vim.opt.autoindent = true -- Use same indenting on new lines 新行使用与前一行一样的缩进
vim.opt.smartindent = true -- Smart autoindenting on new lines C 程序只能自动缩进
vim.opt.shiftwidth = 2 -- Number of spaces to use in auto(indent) (自动) 缩进使用的步进单位，以空白数目计
vim.opt.softtabstop = 2 -- Automatically keeps in sync with shiftwidth 编辑时 <Tab> 使用的空格数
vim.opt.tabstop = 2 -- The number of spaces a tab is <Tab>在文件里使用的空格数2
vim.opt.expandtab = true -- 不出现制表符 tab键转为空格
vim.opt.ofu = "v:lua.vim.lsp.omnifunc"
