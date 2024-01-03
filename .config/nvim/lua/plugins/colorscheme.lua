-- Catppuccin theme with mocha as the default flavor
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin]])
        end,
        opts = {
            integrations = {
                alpha = true,
                cmp = true,
                dap = true,
                dap_ui = true,
                gitsigns = true,
                harpoon = true,
                indent_blankline = { enabled = true },
                lualine = true,
                lsp_trouble = true,
                mason = true,
                native_lsp = {
                    enabled = true,
                    underlines = {
                        errors = { "undercurl" },
                        hints = { "undercurl" },
                        warnings = { "undercurl" },
                        information = { "undercurl" },
                    },
                },
                nvimtree = true,
                semantic_tokens = true,
                telescope = true,
                treesitter = true,
                which_key = true,
            },
        },
    },
}
