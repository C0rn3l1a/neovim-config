local builtin = require('telescope.builtin')
local wk = require('which-key')

wk.register({
    ["<leader>f"] = { name = "Telescope" },
    ["<leader>ff"] = { builtin.find_files, "Find Files" },
    ["<leader>fa"] = { builtin.live_grep, "Find Everywhere | Live Grep" },
    ["<leader>fg"] = { builtin.git_files, "Find in Git repo" },
})
