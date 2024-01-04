-- Package manager that installs and manages
-- LSP servers, DAP servers, linters and formatters
return {
    "williamboman/mason.nvim",
    events = "VeryLazy",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        -- Enable Mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        -- List of LSP servers to install
        mason_lspconfig.setup({
            ensure_installed = {
                "bashls",
                "bufls",
                "csharp_ls",
                "dockerls",
                "gopls",
                "htmx",
                "jsonls",
                "lua_ls",
                "pyright",
                "ruff_lsp",
                "rust_analyzer",
                "yamlls",
            },
            -- auto-install configured servers
            automatic_installation = true,
        })

        -- List of formatters/linters to install
        mason_tool_installer.setup({
            ensure_installed = {
                "gofumpt", -- Stricter Go formatter (gofmt)
                "goimports", -- Formatter for Go imports
                "prettier", -- Opiniated code formatter,
                "ruff", -- Python linter and formatter
                "shfmt", -- Shell formatter
                "stylua", -- Opiniated Lua formatter
            },
        })
    end,
}
