local config = {}

function config.flybuf()
	require("flybuf").setup({})
end

function config.template_nvim()
	require("template").setup({
		temp_dir = "~/.config/nvim/template",
		author = "JerryMoo",
		email = "wuchujie123@gmail.com",
	})
	require("telescope").load_extension("find_template")
end

function config.colorizer()
	require("colorizer").setup()
	exec_filetype("ColorizerSetup")
end

function config.whichkey()
	local wk = require("which-key")
	wk.setup({
		wk.register({
			["<Leader>"] = {
				["1"] = {
					name = "+Select Window-1",
				},
				["2"] = {
					name = "+Select Window-2",
				},
				["3"] = {
					name = "+Select Window-3",
				},
				["4"] = {
					name = "+Select Window-4",
				},
				["5"] = {
					name = "+Select Window-5",
				},
				["6"] = {
					name = "+Select Window-6",
				},
				["7"] = {
					name = "+Select Window-7",
				},
				["8"] = {
					name = "+Select Window-8",
				},
				["9"] = {
					name = "+Select Window-9",
				},
				["0"] = {
					name = "+Select Last Window",
				},
				b = {
					name = "+FlyBuf",
				},
				e = {
					name = "+Open NvimTree",
				},
				E = {
					name = "+Open File Browser",
				},
				f = {
					name = "+Find",
					a = { "Find Word" },
					b = { "Find Buffer" },
					f = { "Find File" },
					w = { "Find Current Word" },
				},
				t = {
					name = "TrimTrailingWhitespace",
				},
				T = {
					name = "Template",
				},
				w = {
					name = "+Window",
					n = { "New Window" },
				},
			},
		}),
	})
end

function config.hlslens()
	require("hlslens").setup({
		override_lens = function(render, posList, nearest, idx, relIdx)
			local sfw = vim.v.searchforward == 1
			local indicator, text, chunks
			local absRelIdx = math.abs(relIdx)
			if absRelIdx > 1 then
				indicator = ("%d%s"):format(absRelIdx, sfw ~= (relIdx > 1) and "▲" or "▼")
			elseif absRelIdx == 1 then
				indicator = sfw ~= (relIdx == 1) and "▲" or "▼"
			else
				indicator = ""
			end

			local lnum, col = unpack(posList[idx])
			if nearest then
				local cnt = #posList
				if indicator ~= "" then
					text = ("[%s %d/%d]"):format(indicator, idx, cnt)
				else
					text = ("[%d/%d]"):format(idx, cnt)
				end
				chunks = { { " ", "Ignore" }, { text, "HlSearchLensNear" } }
			else
				text = ("[%s %d]"):format(indicator, idx)
				chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
			end
			render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
		end,
	})
end

function config.leap()
	local leap = require("leap")
	leap.add_default_mappings()
	leap.opts.highlight_unlabeled_phase_one_targets = true
end

function config.flit()
	require("flit").setup({
		keys = { f = "f", F = "F", t = "t", T = "T" },
		-- A string like "nv", "nvo", "o", etc.
		labeled_modes = "v",
		multiline = true,
		-- Like `leap`s similar argument (call-specific overrides).
		-- E.g.: opts = { equivalence_classes = {} }
		opts = {},
	})
end

function config.window_picker()
	require("window-picker").setup({
		selection_chars = "SDFJKLZXCV",
		include_current_win = true,
	})
end

return config
