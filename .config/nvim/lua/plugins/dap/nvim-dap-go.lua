-- Extension for nvim-dap for launching the go debugger
return {
    "leoluz/nvim-dap-go",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    ft = "go",
    config = function()
        require("dap-go").setup({
            dap_configurations = {
                {
                    type = "go",
                    name = "Attach remote",
                    mode = "remote",
                    request = "attach",
                },
            },
            delve = {
                path = "~/.local/share/nvim/mason/packages/delve/dlv",
            },
        })
    end,
}
