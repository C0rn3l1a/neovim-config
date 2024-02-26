local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local wk = require("which-key")

wk.register({
    -- Harpoon group
    ["<leader>a"] = { name = "H[A]rpoon" },
    -- Harpoon controls
    ["<leader>aa"] = { mark.add_file, "[A]dd file" },
    ["<leader>ar"] = { mark.rm_file, "[R]emove file" },
    ["<leader>ac"] = { mark.clear_all, "[C]lear all" },
    ["<leader>af"] = { ui.toggle_quick_menu, "Quick menu" },
    -- Harpoon jumps
    ["<leader>1"] = { function() ui.nav_file(1) end, "which_key_ignore" },
    ["<leader>2"] = { function() ui.nav_file(2) end, "which_key_ignore" },
    ["<leader>3"] = { function() ui.nav_file(3) end, "which_key_ignore" },
    ["<leader>4"] = { function() ui.nav_file(4) end, "which_key_ignore" },
    ["<leader>5"] = { function() ui.nav_file(5) end, "which_key_ignore" },
    ["<leader>6"] = { function() ui.nav_file(6) end, "which_key_ignore" },
    ["<leader>7"] = { function() ui.nav_file(7) end, "which_key_ignore" },
    ["<leader>8"] = { function() ui.nav_file(8) end, "which_key_ignore" },
    ["<leader>9"] = { function() ui.nav_file(9) end, "which_key_ignore" },
})
