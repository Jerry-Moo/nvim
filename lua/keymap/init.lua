local api = vim.api
require("keymap.remap")
local map = require("core.keymap")
local cmd = map.cmd

-- usage example
map.n({
	-- plugin manager: Lazy.nvim
	["<Leader>pu"] = cmd("Lazy update"),
	["<Leader>pi"] = cmd("Lazy install"),

	-- LSP
	["<Leader>li"] = cmd("LspInfo"),
	["<Leader>ll"] = cmd("LspLog"),
	["<Leader>lr"] = cmd("LspRestart"),
	-- mason
	["<Leader>lp"] = cmd("Mason"),
	-- Lspsaga
	-- ["[e"] = cmd("Lspsaga diagnostic_jump_next"),
	["[e"] = cmd("lua vim.diagnostic.goto_next()"),
	-- ["]e"] = cmd("Lspsaga diagnostic_jump_prev"),
	["]e"] = cmd("lua vim.diagnostic.goto_prev()"),
	["K"] = cmd("Lspsaga hover_doc"),
	["ga"] = cmd("Lspsaga code_action"),
	["gd"] = cmd("Lspsaga peek_definition"),
	["gp"] = cmd("lua vim.lsp.buf.definition()"), -- 比 cmd('Lspsaga goto_definition') 好用
	["gr"] = cmd("Lspsaga rename"),
	["gh"] = cmd("Lspsaga finder"),
	["<Leader>o"] = cmd("Lspsaga outline"),
	["<Leader>dw"] = cmd("Lspsaga show_workspace_diagnostics"),
	["<Leader>db"] = cmd("Lspsaga show_buf_diagnostics"),

	-- Editor
	-- Telescope
	["<Leader>fb"] = cmd("Telescope buffers"),
	["<Leader>fa"] = cmd("Telescope live_grep"),
	["<Leader>fw"] = cmd("Telescope grep_string"),
	["<Leader>ff"] = cmd("Telescope find_files find_command=rg,--ignore,--hidden,--files"),
	-- peek.nvim
	["<Leader>po"] = cmd("PeekOpen"),
	["<Leader>pc"] = cmd("PeekClose"),

	-- Tools
	-- flybuf.nvim
	["<Leader>b"] = cmd("FlyBuf"),
	-- coman
	["gcc"] = cmd("ComComment"),
	["gcj"] = cmd("ComAnnotation"),

	-- ui
	-- nvimtree
	["<Leader>e"] = cmd("NvimTreeToggle"),
	-- gitsign
	["]g"] = cmd('lua require"gitsigns".next_hunk()<CR>'),
	["[g"] = cmd('lua require"gitsigns".prev_hunk()<CR>'),
})

map.n("<Leader>E", function()
	vim.cmd("Telescope file_browser")
	local esc_key = api.nvim_replace_termcodes("<Esc>", true, false, true)
	api.nvim_feedkeys(esc_key, "n", false)
end)

-- template.nvim
map.n("<Leader>T", function()
	local tmp_name
	if vim.bo.filetype == "lua" then
		tmp_name = "nvim_temp"
	end
	if tmp_name then
		vim.cmd("Template " .. tmp_name)
		return
	end
	return ":Template"
end, { expr = true })

map.n("-", function()
	local ok, pick_window = pcall(require, "window-picker")
	if ok then
		local picked_window_id = pick_window.pick_window() or vim.api.nvim_get_current_win()
		vim.api.nvim_set_current_win(picked_window_id)
	end
end)

map.x({
	-- coman
	["gcc"] = ":ComComment<CR>",
})
