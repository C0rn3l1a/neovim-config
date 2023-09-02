local wk = require("which-key")

wk.register({
    -- Project group
    ["<leader>p"] = { name = "Project" },
    -- Project controls
    ["<leader>pv"] = { vim.cmd.Ex, "File Explorer" },
    -- copy helpers
    ["<leader>y"] = { "\"+y", "Shared Copy" },
    ["<leader>y"] = { "\"+y", "Shared Copy", mode = "v" },
    ["<leader>Y"] = { "\"+Y", "Shared Copy Line" },
    -- move between splits
})

-- move stuff up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- keep cursor in the same place for actions
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- save
vim.keymap.set("n", "<C-s>", ":update<CR>")
vim.keymap.set("i", "<C-s>", "<Esc>:update<CR>l ")
vim.keymap.set("v", "<C-s>", "<Esc>:update<CR> ")

vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
