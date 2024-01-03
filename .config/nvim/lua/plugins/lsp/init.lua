-- Configs for the Neovim LSP client
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "j-hui/fidget.nvim", opts = {} },
    },
    event = "VeryLazy",
    config = function()
        local on_attach = function(_, bufnr)
            -- Define specific keymaps for LSP related items
            local keymap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            local telescope = require("telescope.builtin")

            keymap("<leader>rn", vim.lsp.buf.rename, "Rename")
            keymap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
            keymap("gd", telescope.lsp_definitions, "Goto Definition")
            keymap("gr", telescope.lsp_references, "Goto References")
            keymap("gI", telescope.lsp_implementations, "Goto Implementation")
            keymap("<leader>D", telescope.lsp_type_definitions, "Type Definition")
            keymap("<leader>ds", telescope.lsp_document_symbols, "Document Symbols")
            keymap("K", vim.lsp.buf.hover, "Hover Documentation")
            keymap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
            keymap("gD", vim.lsp.buf.declaration, "Goto Declaration")

            -- Command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
                vim.lsp.buf.format()
            end, { desc = "Format current buffer with LSP" })
        end

        -- Change the Diagnostic symbols in the sign column
        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- sh/bash
        lspconfig.bashls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- Protobuf
        lspconfig.bufls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
                "bufls",
                "serve",
            },
            filetypes = { "proto" },
        })

        -- docker
        lspconfig.dockerls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- go
        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                gopls = {
                    gofumpt = true,
                    completeUnimported = true,
                    staticcheck = true,
                    usePlaceholders = true,
                    analyses = {
                        nilness = true,
                        useany = true,
                        unusedparams = true,
                    },
                    codelenses = {
                        gc_details = false,
                        generate = true,
                        run_govulncheck = true,
                        test = true,
                        tidy = true,
                        upgrade_dependency = true,
                        vendor = true,
                    },
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        constantValues = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            },
            flags = {
                debounce_text_changes = 150,
            },
        })

        -- htmx
        lspconfig.htmx.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        -- json
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "json", "jsonc" },
        })

        -- lua
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })

        -- python
        lspconfig.ruff_lsp.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "python" },
        })

        -- python
        lspconfig.pyright.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                pyright = {
                    disableOrganizeImports = false,
                    analysis = {
                        useLibraryCodeForTypes = true,
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        autoImportCompletions = true,
                    },
                },
            },
        })

        -- rust
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            cmd = {
                "rustup",
                "run",
                "stable",
                "rust-analyzer",
            },
        })

        -- yaml
        lspconfig.yamlls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "yaml", "yml" },
        })
    end,
}
