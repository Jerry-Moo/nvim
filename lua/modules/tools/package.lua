local conf = require("modules.tools.config")

packadd({ -- css 着色器
	"norcalli/nvim-colorizer.lua",
	ft = { "lua", "css", "html", "sass", "less", "typescriptreact" },
	config = function()
		require("colorizer").setup()
	end,
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

packadd({ "ggandor/leap.nvim", event = "BufRead", config = conf.leap })

packadd({ "ggandor/flit.nvim", event = "BufRead", config = conf.flit })

packadd({
	"s1n7ax/nvim-window-picker",
	config = function()
		require("window-picker").setup({
			selection_chars = "SDFJKLZXCV",
			include_current_win = true,
		})
	end,
})
