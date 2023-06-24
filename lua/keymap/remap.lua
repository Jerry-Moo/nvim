local map = require("core.keymap")
local cmd = map.cmd

map.n({
	["j"] = "gj",
	["k"] = "gk",
	["<C-s>"] = cmd("write"), -- save
	["<C-x>k"] = cmd("bdelete"), -- close buffer
	["<C-n>"] = cmd("bn"), -- buffer jump
	["<C-p>"] = cmd("bp"), -- buffer jump
	["<C-q>"] = cmd("qa!"), -- force quit all
	["<Leader>t"] = cmd("TrimTrailingWhitespace"), -- remove trailing white space
	["Y"] = "y$", -- yank
	-- switch window
	["<C-h>"] = "<C-w>h",
	["<C-l>"] = "<C-w>l",
	["<C-j>"] = "<C-w>j",
	["<C-k>"] = "<C-w>k",
	-- Windows resize window
	["<A-h>"] = cmd("vertical resize -5"),
	["<A-l>"] = cmd("vertical resize +5"),
	["<A-j>"] = cmd("resize -5"),
	["<A-k>"] = cmd("resize +5"),
	-- Mac resize window
	["˙"] = cmd("vertical resize -5"),
	["¬"] = cmd("vertical resize +5"),
	["∆"] = cmd("resize -5"),
	["˚"] = cmd("resize +5"),
	-- tab 标签页切换快捷键
	["<Leader>1"] = "1gt",
	["<Leader>2"] = "2gt",
	["<Leader>3"] = "3gt",
	["<Leader>4"] = "4gt",
	["<Leader>5"] = "5gt",
	["<Leader>6"] = "6gt",
	["<Leader>7"] = "7gt",
	["<Leader>8"] = "8gt",
	["<Leader>9"] = "9gt",
	["<Leader>0"] = cmd("tablast"),
	-- window
	["<Leader><TAB>"] = "<C-O><CR>",
	["<Leader>ws"] = cmd("sp"),
	["<Leader>wv"] = cmd("vs"),
	["<Leader>wh"] = "<C-w>h",
	["<Leader>wj"] = "<C-w>j",
	["<Leader>wk"] = "<C-w>k",
	["<Leader>wl"] = "<C-w>l",
	["<Leader>wH"] = "<C-w>H",
	["<Leader>wJ"] = "<C-w>J",
	["<Leader>wK"] = "<C-w>K",
	["<Leader>wL"] = "<C-w>L",
	["<Leader>wx"] = "<C-w>x",
	["<Leader>wc"] = "<C-w>c",
	["<Leader>wo"] = "<C-w>o",
	["<Leader>wR"] = "<C-w>R",
	["<Leader>wn"] = cmd("tabnew"),
})
-- insertmode remap
map.i({
	["<C-d>"] = "<C-o>diw",
	["<C-b>"] = "<Left>",
	["<C-f>"] = "<Right>",
	["<C-a>"] = "<Esc>^i",
	["<C-l>"] = "<C-o>d$",
	["<C-s>"] = "<ESC>:w<CR>",
	["<C-n>"] = "<Down>",
	["<C-p>"] = "<Up>",
	--down/up
	["<C-j>"] = "<C-o>o",
	["<C-k>"] = "<C-o>O",
	--@see https://github.com/neovim/neovim/issues/16416
	["<C-C>"] = "<C-C>",
	--@see https://vim.fandom.com/wiki/Moving_lines_up_or_down
	-- Windows
	["<A-j>"] = "<Esc>:m .+1<CR>==gi",
	["<A-k>"] = "<Esc>:m .-2<CR>==gi",
	-- Mac
	["∆"] = "<Esc>:m .+1<CR>==gi",
	["˚"] = "<Esc>:m .-2<CR>==gi",
})

map.i("<c-e>", function()
	return vim.fn.pumvisible() == 1 and "<C-e>" or "<Esc>g_a"
end, { expr = true })

-- commandline remap
map.c({
	["<C-b>"] = "<Left>",
	["<C-f>"] = "<Right>",
	["<C-a>"] = "<Home>",
	["<C-e>"] = "<End>",
	["<C-d>"] = "<Del>",
	["<C-h>"] = "<BS>",
})

map.t("<Esc>", [[<C-\><C-n>]])
