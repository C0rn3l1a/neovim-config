local wk = require("which-key")
local cs = require("cheatsheet")

wk.register({
    ["<leader>h"] = { name = "Help" },
    ["<leader>hc"] = { cs.show_cheatsheet, "Show Cheatsheet" },
    ["<leader>he"] = { cs.edit_user_cheatsheet, "Edit My Cheatsheet" },
})
