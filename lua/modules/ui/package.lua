local conf = require("modules.ui.config")

packadd({
	"ellisonleao/gruvbox.nvim",
	config = conf.gruvbox,
})

packadd({
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = conf.dashboard,
	dependencies = { "nvim-tree/nvim-web-devicons" },
})

-- 状态栏
packadd({
	"nvim-lualine/lualine.nvim",
	config = conf.lualine,
	dependencies = { "nvim-tree/nvim-web-devicons" },
})

-- buffer
packadd({
	"akinsho/bufferline.nvim",
	config = conf.bufferline,
	dependencies = { "nvim-tree/nvim-web-devicons" },
})

packadd({
	"lewis6991/gitsigns.nvim",
	event = { "BufRead", "BufNewFile" },
	config = conf.gitsigns,
})

packadd({
	"nvim-tree/nvim-tree.lua",
	cmd = "NvimTreeToggle",
	config = conf.nvim_tree,
	dependencies = { "nvim-tree/nvim-web-devicons" },
})

packadd({ -- 显示缩进级别的插件
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
	config = conf.indent_blankline,
})

packadd({ -- mini.icons
	"echasnovski/mini.icons",
	opts = {},
	lazy = true,
	dependencies = { "nvim-tree/nvim-web-devicons", enable = false, optional = true },
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
})
