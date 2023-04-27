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

packadd({
	"nvimdev/whiskyline.nvim",
	config = conf.whisky,
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

packadd({
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
	config = conf.indent_blankline,
})
