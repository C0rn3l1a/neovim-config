-- use space as <leader> key
vim.g.mapleader = " "

-- Explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Explorer" })

-- save
vim.keymap.set("n", "<C-s>", ":update<CR>", { desc = "" })
vim.keymap.set("i", "<C-s>", "<Esc>:update<CR>l ", { desc = "" })
vim.keymap.set("v", "<C-s>", "<Esc>:update<CR> ", { desc = "" })

-- exit from insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit from insert mode" })

-- keep cursor in the same place for actions
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append next line to current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Long down jump" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Long up jump" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev" })

-- Move between panels with Ctrl + [hjkl]
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down panel" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left panel" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up panel" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right panel" })

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move selected line up" })

-- move between buffers
vim.keymap.set("n", "<C-n>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-p>", ":bprevious<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })

-- split windows
vim.keymap.set("n", "<C-\\>", ":vsplit<CR>", { desc = "Split vertically" })
vim.keymap.set("n", "<C-->", ":hsplit<CR>", { desc = "Split horizontally" })

-- Replace word under cursor across entire buffer
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word under cursor" })

-- Tests
vim.keymap.set("n", "<leader>t", "<cmd>lua require('neotest').run.run()<CR>", { desc = "Run Test" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
  { desc = "Run Test File" })
vim.keymap.set("n", "<leader>td", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<CR>",
  { desc = "Run Current Test Directory" })
vim.keymap.set("n", "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<CR>",
  { desc = "Toggle Test Output Panel" })
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", { desc = "Run Last Test" })
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", { desc = "Toggle Test Summary" })

