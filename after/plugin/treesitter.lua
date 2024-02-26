require("nvim-treesitter").setup({
    ensure_installed = { "javascript", "typescript", "scss", "sql", "json", "html", "dockerfile", "toml", "lua", "vim", "vimdoc", "query", "rust"},
    sync_install = false,
    highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
    }
})
