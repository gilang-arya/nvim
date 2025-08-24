return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason").setup()

            local lsp = {
                "lua_ls",
                "emmet_ls",
                "cssls",
                "ts_ls",
            }

            local tools = {
                "stylua",
                "prettier",
            }

            require("mason-lspconfig").setup({
                ensure_installed = lsp,
                automatic_installation = true,
            })

            require("mason-tool-installer").setup({
                ensure_installed = tools,
                auto_update = true,
                run_on_start = true,
            })

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local on_attach = function(client, bufnr)
                local map = function(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { silent = true, buffer = bufnr, desc = "LSP: " .. desc })
                end

                map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
                map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
                map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
                map("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
                map("n", "<C-k>", vim.lsp.buf.signature_help, "Signature Help")
                map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
                map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
                map("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "List Workspace Folders")
                map("n", "<leader>D", vim.lsp.buf.type_definition, "Go to Type Definition")
                map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
                map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
                map("n", "gr", vim.lsp.buf.references, "Go to References")
                map("n", "<leader>e", vim.diagnostic.open_float, "Show Line Diagnostics")
                map("n", "[d", vim.diagnostic.goto_prev, "Go to Previous Diagnostic")
                map("n", "]d", vim.diagnostic.goto_next, "Go to Next Diagnostic")
                map("n", "<leader>q", vim.diagnostic.setloclist, "Set Loclist")
            end

            for _, server_name in ipairs(lsp) do
                local opts = {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }

                if server_name == "lua_ls" then
                    opts.settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    }
                end

                lspconfig[server_name].setup(opts)
            end
        end,
    },

    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    html = { "prettier" },
                    css = { "prettier" },
                    json = { "prettier" },
                    yaml = { "prettier" },
                    markdown = { "prettier" },
                },
                format_on_save = {
                    lsp_fallback = true,
                    timeout_ms = 1000,
                },
            })
        end,
    },
}
