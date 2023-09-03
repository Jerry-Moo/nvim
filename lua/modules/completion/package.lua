local conf = require("modules.completion.config")

local function lsp_fts(type)
	type = type or nil
	local fts = {}
	fts.backend = {
		"go",
		"lua",
		"sh",
		"rust",
		"c",
		"cpp",
		"python",
	}

	fts.frontend = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
	}
	if not type then
		return vim.list_extend(fts.backend, fts.frontend)
	end
	return fts[type]
end

local function diag_config()
	local t = {
		"Error",
		"Warn",
		"Info",
		"Hint",
	}
	for _, type in pairs(t) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = "⯈", texthl = hl, numhl = hl })
	end

	vim.diagnostic.config({
		signs = true,
		update_in_insert = true,
		severity_sort = true,
		virtual_text = {
			prefix = "",
			source = true,
		},
	})

	vim.lsp.set_log_level("OFF")

	--disable diagnostic in neovim test file *_spec.lua
	vim.api.nvim_create_autocmd("FileType", {
		group = vim.api.nvim_create_augroup("DisableInSpec", { clear = true }),
		pattern = "lua",
		callback = function(opt)
			local fname = vim.api.nvim_buf_get_name(opt.buf)
			if fname:find("%w_spec%.lua") then
				vim.diagnostic.disable(opt.buf)
			end
		end,
	})
end

packadd({
	"neovim/nvim-lspconfig",
	ft = lsp_fts(),
	config = function()
		diag_config()
		require("modules.completion.backend")
		require("modules.completion.frontend")
		exec_filetype({ "lspconfig", "DisableInSpec" })
	end,
})

packadd({
	"nvimdev/lspsaga.nvim",
	ft = lsp_fts(),
	cmd = "Lspsaga term_toggle",
	config = conf.lspsaga,
})

packadd({
	"williamboman/mason.nvim",
	event = "VimEnter",
	config = conf.mason,
})

packadd({
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	config = conf.copilot,
})

packadd({
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	config = conf.nvim_cmp,
	dependencies = {
		-- copilot
		{
			"zbirenbaum/copilot-cmp",
			dependencies = { "copilot.lua" },
			config = conf.copilot_cmp,
		},
		-- 补全源
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-cmdline" },
		-- snip
		{ "saadparwaiz1/cmp_luasnip" },
		{ "L3MON4D3/LuaSnip", config = conf.lua_snip },
		-- icon
		{ "onsails/lspkind.nvim", config = conf.lspkind },
		-- nvim-autopairs
		{ "windwp/nvim-autopairs", config = conf.auto_pairs },
	},
})

packadd({
	"mhartington/formatter.nvim",
	ft = { "c", "cpp", "rust", "lua", "go", "typescript", "javascript", "javascriptreact", "python" },
	config = conf.formatter,
})

packadd({
	"ii14/emmylua-nvim",
	ft = "lua",
})
