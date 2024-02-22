local builtin = require('telescope.builtin')
local wk = require('which-key')

function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end


function search_current_selection_buffer()
    local builtin = require('telescope.builtin')
	local text = vim.getVisualSelection()
	builtin.current_buffer_fuzzy_find({ default_text = text })
end

function search_current_selection_everywhere()
	local text = vim.getVisualSelection()
    require('telescope').extensions.live_grep_args.live_grep_args({ default_text = "\""..text.."\""});
end

function test()
    local builtin = require('telescope.builtin')
    builtin.lsp_references()
end

wk.register({
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>ff"] = { builtin.find_files, "Find Files" },
    ["<leader>fi"] = { builtin.current_buffer_fuzzy_find, "Find in Buffer" },
    ["<leader>fi"] = { search_current_selection_buffer, "Find in Buffer", mode="v" },
    ["<leader>fa"] = { ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", "Find Everywhere | Live Grep" },
    ["<leader>fa"] = { search_current_selection_everywhere, "Find Everywhere | Live Grep", mode="v" },
    ["<leader>fg"] = { builtin.git_files, "Find in Git repo" },
    ["<leader>fb"] = { builtin.buffers, "Find Buffers" },
    ["<leader>fh"] = { builtin.help_tags, "Find Help Tags" },
    ["<leader>ft"] = { test, "TEST" },
})
