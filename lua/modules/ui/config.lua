local config = {}

function config.gruvbox()
	vim.cmd("colorscheme gruvbox")
end

function config.lualine()
	require("lualine").setup({
		options = {
			-- 主题
			theme = "gruvbox",
			-- 分割线
			component_separators = {
				left = "",
				right = "",
			},
			section_separators = {
				left = "",
				right = "",
			},
			globalstatus = false,
		},
		-- 扩展
		extensions = { "nvim-tree" },
	})
end

function config.bufferline()
	require("bufferline").setup({
		options = {
			mode = "tabs", -- tab 模式
			numbers = "ordinal", -- 每个标签上都显示一个编号，以方便快速切换
			modified_icon = "✥",
			buffer_close_icon = "",
			always_show_bufferline = false,
			-- LSP 诊断集成，设置为 "nvim_lsp" 以启用
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				return "(" .. count .. ")"
			end,
			-- 侧边栏配置
			-- 左侧让出 nvim-tree 的位置, 显示文字 File Explorer
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	})
end

function config.dashboard()
	local db = require("dashboard")
	db.setup({
		theme = "hyper",
		config = {
			week_header = {
				enable = true,
			},
			project = {
				enable = true,
			},
			disable_move = true,
			shortcut = {
				{
					desc = "Update",
					icon = " ",
					group = "Include",
					action = "Lazy update",
					key = "u",
				},
				{
					icon = " ",
					desc = "Files",
					group = "Function",
					action = "Telescope find_files find_command=rg,--ignore,--hidden,--files",
					key = "f",
				},
				{
					icon = " ",
					desc = "Apps",
					group = "String",
					action = "Telescope app",
					key = "a",
				},
			},
		},
	})
end

function config.nvim_tree()
	require("nvim-tree").setup({
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
			width = 35,
			-- 左/右
			side = "left",
			-- 隐藏根目录
			-- hide_root_folder = false,
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
	require("gitsigns").setup({
		signs = {
			add = { text = "┃" },
			change = { text = "┃" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┃" },
		},
	})
end

function config.indent_blankline()
	require("ibl").setup({
		indent = {
			char = "│",
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = false,
			exclude = {
				language = {
					"help",
					"terminal",
					"nofile",
					"prompt",
				},
			},
		},
	})
end

return config
