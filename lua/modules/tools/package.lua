local conf = require("modules.tools.config")

packadd({
	"nvimdev/flybuf.nvim",
	cmd = "FlyBuf",
	config = conf.flybuf,
})

packadd({
	"nvimdev/coman.nvim",
	event = "BufRead",
})

packadd({
	"nvimdev/template.nvim",
	cmd = "Template",
	config = conf.template_nvim,
})

packadd({ -- css 着色器
	"norcalli/nvim-colorizer.lua",
	ft = { "lua", "css", "html", "saflitss", "less", "typescriptreact", "conf" },
	config = conf.colorizer,
})

packadd({
	"folke/which-key.nvim",
	config = conf.whichkey,
})

packadd({ -- 高亮搜索内容
	"kevinhwang91/nvim-hlslens",
	event = "BufRead",
	config = conf.hlslens,
})

packadd({
	"ggandor/leap.nvim",
	event = "BufRead",
	config = conf.leap,
	dependencies = {
		-- flit
		{ "ggandor/flit.nvim", config = conf.flit },
	},
})

packadd({
	"s1n7ax/nvim-window-picker",
	event = "BufRead",
	config = conf.window_picker,
})
