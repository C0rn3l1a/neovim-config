local lsp = require('lsp-zero')
local wk = require("which-key")

lsp.preset('recommended')

-- defualt languages
lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'tailwindcss',
    'angularls',
    'html',
    'sqlls',
})

-- Stolen from Primeagen --
-- no sign icons
lsp.set_preferences({
    sign_icons = {}
})

-- remap autocompletion
local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

-- use these commands when lsp loaded in a buffer
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)

    wk.register({
        ["<leader>v"] = { name = "Vim Lsp" },
        ["<leader>vca"] = { function() vim.lsp.buf.code_action() end, "View Code Action" },
        ["<leader>vrr"] = { function() vim.lsp.buf.references() end, "View References" },
        ["<leader>vrn"] = { function() vim.lsp.buf.rename() end, "Rename" },
        ["<leader>vh"] = { function() vim.lsp.buf.signature_help() end, "Signature Help" },
        ["<leader>vws"] = { function() vim.lsp.buf.workspace_symbol() end, "View Workspace Symbol" },
        ["<leader>vf"] = { function() vim.lsp.buf.format() end, "Format" },
        ["<leader>vd"] = { function() vim.diagnostic.open_float() end, "View Diagnostic" },
    }, opts)
end)


lsp.setup()
