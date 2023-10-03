return {
    'neovim/nvim-lspconfig',
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            "folke/neoconf.nvim",
            cmd = "Neoconf",
            config = false,
            dependencies = {
                "nvim-lspconfig" }
        },
        {
            "folke/neodev.nvim",
            event = { 'BufReadPre /Users/munsman/.config/**', 'BufNewFile /Users/munsman/.config/**' },
            opts = {}
        },
        { "williamboman/mason.nvim" },
        { 'nvim-telescope/telescope.nvim' },
        { "hrsh7th/cmp-nvim-lsp" },
    },
    opts = {
        diagnostics = {
            underline = true,
            update_in_insert = false,
            virtual_text = {
                spacing = 4,
                source = "if_many",
                prefix = "●",
                -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                -- prefix = "icons",
            },
            severity_sort = true,
            icons = {
                Error = " ",
                Warn = " ",
                Hint = " ",
                Info = " ",
            }
        },
        format = {
            autoformat = true,
            force = true,
            async = false
        }
    },
    config = function(_, opts)
        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()


        for name, icon in pairs(opts.diagnostics.icons) do
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
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                on_attach(_, ev.buf)
            end
        })

        require('plugins/lsp/lsps').setup({
            capabilities = capabilities,
            on_attach = on_attach
        })

    end,
}
