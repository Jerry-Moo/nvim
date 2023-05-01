local config = {}

function config.lspsaga()
	require("lspsaga").setup({
		symbol_in_winbar = {
			ignore_patterns = { "%w_spec" },
		},
	})
end

function config.mason()
	require("mason").setup({
		ui = {
			-- Whether to automatically check for new versions when opening the :Mason window.
			check_outdated_packages_on_open = true,
			width = 0.5,
			height = 0.8,
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})
end

function config.copilot()
	require("copilot").setup({
		suggestion = { enable = false },
		panel = { enable = false },
	})
end

function config.copilot_cmp()
	require("copilot_cmp").setup({})
end

function config.lspkind()
	local lspkind = require("lspkind")
	lspkind.init({
		symbol_map = {
			Copilot = "",
		},
	})
	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
end

function config.nvim_cmp()
	local cmp = require("cmp")

	cmp.setup({
		preselect = cmp.PreselectMode.Item,
		formatting = {
			fields = { "abbr", "kind", "menu" },
			format = require("lspkind").cmp_format({
				mode = "symbol_text",
				menu = {
					copilot = "[COPI]",
					nvim_lsp = "[LSP]",
					luasnip = "[SNIP]",
					path = "[PATH]",
					buffer = "[BUF]",
				},
			}),
		},
		-- You can set mappings if you want
		mapping = cmp.mapping.preset.insert({
			["<C-u"] = cmp.mapping.scroll_docs(-4),
			["<C-d"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["Up"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
			["Down"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<TAB>"] = cmp.mapping(function(fallback)
				local ok, luasnip = pcall(require, "luasnip")
				local luasnip_status = false
				if ok then
					luasnip_status = luasnip.expand_or_jumpable()
				end

				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip_status then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-TAB>"] = cmp.mapping(function(fallback)
				local _, luasnip = pcall(require, "luasnip")

				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		sources = {
			-- Copilot Source
			{ name = "copilot" },
			-- Other Sources
			{ name = "nvim_lsp" }, -- nvim-lspconfig
			{ name = "luasnip" }, -- luasnip
			{ name = "path" }, -- cmp-path
			{ name = "buffer", keyword_length = 3 }, -- cmp-buffer
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
	})
	-- / 查找模式使用 buffer 源
	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
	-- : 命令行模式中使用 path 和 cmdline 源.
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
	})
end

function config.formatter()
	require("formatter").setup({
		-- Enable or disable logging
		logging = true,
		-- Set the log level
		log_level = vim.log.levels.WARN,
		-- All formatter configurations are opt-in
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			-- Use the special "*" filetype for defining formatter configurations on
			-- any filetype
			["*"] = {
				-- "formatter.filetypes.any" defines default configurations for any
				-- filetype
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	})
	vim.cmd([[
     autocmd BufWritePost * FormatWrite
  ]])
end
return config
