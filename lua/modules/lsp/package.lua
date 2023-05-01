local conf = require("modules.lsp.config")

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

local loaded = false
local function diag_config()
	local signs = {
		Error = " ",
		Warn = " ",
		Info = " ",
		Hint = " ",
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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
end

packadd({
	"neovim/nvim-lspconfig",
	ft = lsp_fts(),
	config = function()
		if not loaded then
			diag_config()
			loaded = true
		end
		require("modules.lsp.backend")
		require("modules.lsp.frontend")
	end,
})

packadd({
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	cmd = "Lspsaga term_toggle",
	config = conf.lspsaga,
})

packadd({
	"williamboman/mason.nvim",
	event = "VimEnter", -- event?
	config = conf.mason,
})

packadd({
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter", -- event?
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
		-- icon
		{ "onsails/lspkind.nvim", config = conf.lspkind },
	},
})

packadd({
	"mhartington/formatter.nvim",
	ft = { "c", "cpp", "rust", "lua", "go", "typescript", "javascript", "javascriptreact", "python" },
	config = conf.formatter,
})
