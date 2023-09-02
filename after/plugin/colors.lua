function applyColors()
	-- use Abstract colorscheme as default
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- use transparent background
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

applyColors()
