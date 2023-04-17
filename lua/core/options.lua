local opt = vim.opt
local cache_dir = vim.env.HOME .. '/.cache/nvim/'

-- General settings {{
opt.mouse = '' -- close mouse
opt.report = 0 -- Don't report on line changes
opt.errorbells = true -- Trigger bell on error
opt.hidden = true -- hide buffers when abandoned instead of unload 使得不可见的缓冲区保持载入
opt.fileformats = 'unix,dos,mac' -- 设置换行编码
opt.magic = true -- For regular expressions turn magic on
opt.virtualedit = 'block' -- Position cursor anywhere in visual block
opt.synmaxcol = 2500
opt.helplang = 'cn'
opt.langmenu = 'en_US' -- zh_CN 编码 encoding
opt.fenc = 'utf-8'
opt.fencs = 'utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936'
opt.encoding = 'utf-8' -- 设置Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等
-- What to save for views and sessions:
opt.viewoptions = 'folds,cursor,curdir,slash,unix' -- remember where to recover cursor
opt.sessionoptions = 'curdir,help,tabpages,winsize'

opt.clipboard = 'unnamedplus'
if vim.loop.os_uname().sysname == 'Darwin' then
  vim.g.clipboard = {
    name = 'macOS-clipboard',
    copy = {
      ['+'] = 'pbcopy',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'pbpaste',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 0,
  }
  vim.g.python_host_prog = '/usr/bin/python'
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end
-- }}

-- Wildmenu {{
opt.wildignorecase = true
-- }}

-- Vim Directories {{
opt.undofile = true
opt.swapfile = false
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
-- }}

-- History saving
opt.history = 2000

-- Tabs and Indents {{
opt.textwidth = 100 -- Text width maximum chars before wrapping
opt.expandtab = true -- 不出现制表符 tab键转为空格
opt.tabstop = 2 -- The number of spaces a tab is <Tab>在文件里使用的空格数2
opt.shiftwidth = 2 -- Number of spaces to use in auto(indent) (自动) 缩进使用的步进单位，以空白数目计
opt.smarttab = true -- Tab insert blanks according to 'shiftwidth' 插入 <Tab> 时使用 ’shiftwidth’
opt.autoindent = true -- Use same indenting on new lines 新行使用与前一行一样的缩进
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'  缩进列数对齐到 shiftwidth 的整数倍
opt.breakindentopt = 'shift:2,min:20'
-- }}

-- Timing {{
opt.timeout = true
opt.ttimeout = true
opt.timeoutlen = 500 -- Time out on mappings
opt.ttimeoutlen = 10 -- Time out on key codes
opt.updatetime = 100 -- Idle time to write swap and trigger CursorHold
opt.redrawtime = 1500 -- Time in milliseconds for stopping display redraw
-- }}

-- Searching {{
opt.ignorecase = true -- 搜索时大小写不敏感
opt.smartcase = true -- 搜索时保存记录
opt.infercase = true -- 关键字自动补全的匹配调整大小写
opt.incsearch = true -- 输入的过程中就开始搜索
opt.hlsearch = true -- highlight 搜索结果
opt.wrapscan = true -- Searches wrap around the end of the file

if vim.fn.executable('rg') == 1 then
  opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
  opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end
-- }}

-- Behavior {{
opt.autoread = true
opt.linebreak = true -- 单词换行
opt.whichwrap = 'h,l,<,>,[,],~' -- Move to following line on certain keys 允许backspace和光标键跨越行边界(不建议)
opt.splitbelow = true
opt.splitright = true -- Splits open bottom right
opt.switchbuf = 'useopen,vsplit' -- Jump to the first open window 通常分割/缓冲相关的命令会分割当前窗口，但是也可以让Vim在已经有窗口打开所指定的缓冲时，切换到那个窗口而不是新建一个
  opt.completeopt = 'menu,menuone,noselect,noinsert' -- Always show menu, even for one item
opt.scrolloff = 2 -- Keep at least 2 lines above/below
opt.sidescrolloff = 2 -- Keep at least 2 lines left/right
  opt.spelloptions = 'camel'
-- Text behaviour
---- o.formatoptions = o.formatoptions
--                    + 't'    -- auto-wrap text using textwidth
--                    + 'c'    -- auto-wrap comments using textwidth
--                    + 'r'    -- auto insert comment leader on pressing enter
--                    - 'o'    -- don't insert comment leader on pressing o
--                    + 'q'    -- format comments with gq
--                    - 'a'    -- don't autoformat the paragraphs (use some formatter instead)
--                    + 'n'    -- autoformat numbered list
--                    - '2'    -- I am a programmer and not a writer
--                    + 'j'    -- Join comments smartly
-- opt.formatoptions:remove('t') -- Don't auto-wrap text 文本不要自动换行
opt.formatoptions = 'qj'
-- }}

-- Editor UI {{
opt.cursorline = true -- 高亮显示当前光标所在的行
opt.confirm = true
opt.termguicolors = true
opt.number = true -- Show number
opt.relativenumber = true -- Show relative number
opt.showmode = false -- Don't show mode on bottom
opt.ruler = false -- Disable default status ruler
  opt.shortmess = 'aoOTIcF' -- 显示开屏系统版本信息
opt.list = true -- 自定义tab显示样式
opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
  opt.showtabline = 0
  opt.winwidth = 30 -- Minimum width for active window
-- 弹出菜单的行数
  opt.pumheight = 15 -- Pop-up menu's line height
-- 命令模式显示当前键入的指令
opt.showcmd = false -- Show command in status line
opt.cmdheight = 2 -- Height of the command line 0=全展 1=默认 2=留空2行
opt.equalalways = true -- resize windows on split or close 在拆分或关闭时调整窗口大小
  opt.laststatus = 2 -- 总是显示底部状态行
  -- opt.statusline = '-' -- hide file name in statusline 隐藏侧边栏 一般 git 代码检查
opt.colorcolumn = '120' -- Column highlight at textwidth's max character-limit
-- 折叠方法
-- manual    手工折叠
-- indent    使用缩进表示折叠
-- expr      使用表达式定义折叠
-- syntax    使用语法定义折叠
-- diff      对没有更改的文本进行折叠
-- marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
opt.foldmethod = 'syntax'
opt.foldlevelstart = 99 -- 关闭vim默认折叠
opt.signcolumn = 'yes' -- Always show signs column 总是显示左边git error 状态栏
opt.pumblend = 10
opt.winblend = 10
  opt.showbreak = '↳ ' -- 用于显示换行符前的可选字符，以表示文本行实际上已经被分为多个逻辑行。
-- }}
