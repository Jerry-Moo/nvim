local conf = require("modules.editor.config")

packadd({
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	config = conf.telescope,
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
})

packadd({
	"nvim-treesitter/nvim-treesitter",
	event = "BufRead",
	run = ":TSUpdate",
	config = conf.nvim_treesitter,
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
})

packadd({ -- markdown preview
	"toppair/peek.nvim",
	ft = { "markdown" },
	build = "deno task --quiet build:fast",
	config = conf.peek,
})
