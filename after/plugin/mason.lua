local mason = require("mason")

local mason_tool_installer = require("mason-tool-installer")

-- enable mason and configure icons
mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

mason_tool_installer.setup({
    ensure_installed = {
        "standardrb",
        "prettier",
        "prettierd",
        "ktlint",
        "eslint_d",
        "htmlbeautifier",
        "beautysh",
        "rustfmt",
        "yamlfix",
        "angular-language-server",
    },
})