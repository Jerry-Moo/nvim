local config = {}

function config.telescope()
	local fb_actions = require("telescope").extensions.file_browser.actions
	require("telescope").setup({
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			layout_config = {
				horizontal = { prompt_position = "top", results_width = 0.6 },
				vertical = { mirror = false },
			},
			sorting_strategy = "ascending",
			file_previewer = require("telescope.previewers").vim_buffer_cat.new,
			grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
			qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		},
		extensions = {
			fzy_native = {
				override_generic_sorter = false,
				override_file_sorter = true,
			},
			file_browser = {
				mappings = {
					["n"] = {
						["c"] = fb_actions.create,
						["r"] = fb_actions.rename,
						["d"] = fb_actions.remove,
						["o"] = fb_actions.open,
						["u"] = fb_actions.goto_parent_dir,
					},
				},
			},
		},
	})
	require("telescope").load_extension("fzy_native")
	require("telescope").load_extension("file_browser")
	require("telescope").load_extension("app")
end

function config.nvim_treesitter()
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
	vim.opt.foldlevel = 99

	local ignored = {
		"phpdoc",
		"ada",
		"astro",
		"arduino",
		"bicep",
		"blueprint",
		"beancount",
		"bibtex",
		"bluprint",
		"cpon",
		"cooklang",
		"cuda",
		"d",
		"dhall",
		"elm",
		"elsa",
		"firttl",
		"eex",
		"ecma",
		"elvish",
		"embedded_template",
		"vala",
		"wgsl",
		"verilog",
		"twig",
		"turtle",
		"m68k",
		"hocon",
		"lalrpop",
		"ledger",
		"meson",
		"mehir",
		"rasi",
		"rego",
		"racket",
		"pug",
		"java",
		"tlaplus",
		"supercollider",
		"slint",
		"sparql",
		"rst",
		"rnoweb",
		"m68k",
		"yang",
		"nickel",
		"cue",
	}

	require("nvim-treesitter.configs").setup({
		ensure_installed = "all", -- 安装 language parser
		ignore_install = ignored,
		highlight = { -- 启用代码高亮功能
			enable = true,
		},
		textobjects = {
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	})

	--set indent for jsx tsx
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "javascriptreact", "typescriptreact" },
		callback = function(opt)
			vim.bo[opt.buf].indentexpr = "nvim_treesitter#indent()"
		end,
	})
end

function config.peek()
	local peek = require("peek")
	peek.setup({
		app = "browser",
		theme = "light",
		vim.api.nvim_create_user_command("PeekOpen", peek.open, {}),
		vim.api.nvim_create_user_command("PeekClose", peek.close, {}),
	})
end

return config
