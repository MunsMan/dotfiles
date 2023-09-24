return {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp", "williamboman/mason.nvim", 'nvim-telescope/telescope.nvim' },
    opts = {
        diagnostics = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
        },
    },
    config = function(_, opts)
        local lspconfig = require('lspconfig')
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()


        for name, icon in pairs(opts.diagnostics) do
            name = "DiagnosticSign" .. name
            vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
        end

        local on_attach = function(_, bufnr)
            vim.keymap.set('n', 'go', vim.diagnostic.open_float, { buffer = bufnr, desc = 'Open Diagnostics' })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'open documentation' })
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'signature help' })
            vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Actions' })
            vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename Symbole' })
            vim.keymap.set('n', 'gd', function()
                    require('telescope.builtin').lsp_definitions()
                end,
                { buffer = bufnr, desc = 'Jump to definition' })
            vim.keymap.set('n', 'gI', function()
                    require('telescope.builtin').lsp_implementations()
                end,
                { buffer = bufnr, desc = 'Jump to Implementation' })
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = 'Show References' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Jump to Declaration' })
            vim.keymap.set('n', 'gt', function()
                    require('telescope.builtin').lsp_type_definitions()
                end,
                { buffer = bufnr, desc = 'Jump to Type Definition' })
            vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end,
                { buffer = bufnr, desc = 'format document' })

            -- auto format buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { async = true }
                end
            })
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                on_attach(nil, ev.buf)
            end
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
                format = {
                    enable = true,
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "2",
                    },
                },
            }
        })


        lspconfig["tsserver"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                on_attach(client, bufnr)

                vim.api.nvim_create_autocmd("BufWritePost", {
                    pattern = { "*.js", "*.ts" },
                    callback = function(ctx)
                        if client.name == "svelte" then
                            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
                        end
                    end,
                })
            end,
        })

        lspconfig["pyright"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end
}
