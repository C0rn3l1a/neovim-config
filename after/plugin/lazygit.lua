local wk = require("which-key")

wk.register({
    -- Lazy Git Group
--    ["<leader>g"] = { name = "Lazy Git" },
    -- Lazy Git Controls
    ["<leader>gg"] = { vim.cmd.LazyGit, "Open" },
    ["<leader>gc"] = { vim.cmd.LazyGitFilter, "Repo Commits" },
    ["<leader>gf"] = { vim.cmd.LazyGitFilterCurrentFile, "File Commits" },
})
