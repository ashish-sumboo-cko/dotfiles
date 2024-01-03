-- Automated session manager
return {
    "rmagatti/auto-session",
    event = "VeryLazy",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Documents", "~/Desktop/" },
        })

        local map = require("core.utils").map

        map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
        map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
    end,
}
