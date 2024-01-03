-- Displays a popup with possible pending keybindings
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    config = function()
        local wk = require("which-key")

        wk.register({
            ["<leader>B"] = { name = "Breakpoint", _ = "which_key_ignore" },
            ["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
            ["<leader>d"] = { name = "Document", _ = "which_key_ignore" },
            ["<leader>e"] = { name = "Explore", _ = "which_key_ignore" },
            ["<leader>f"] = { name = "Find", _ = "which_key_ignore" },
            ["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
            ["<leader>h"] = { name = "Harpoon", _ = "which_key_ignore" },
            ["<leader>r"] = { name = "Rename", _ = "which_key_ignore" },
            ["<leader>s"] = { name = "Split", _ = "which_key_ignore" },
            ["<leader>t"] = { name = "Tab", _ = "which_key_ignore" },
            ["<leader>w"] = { name = "Session", _ = "which_key_ignore" },
        })
    end,
}
