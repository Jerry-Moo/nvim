local config = {}

function config.whichkey()
	local wk = require("which-key")
	wk.setup({
		wk.register({
			["<Leader>"] = {
				f = {
					name = "+find",
					f = { "Find File" },
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

return config
