return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        config = function() require('lsp-zero.settings').preset({}) end,
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            { 'L3MON4D3/LuaSnip' }
        },
        config = function()
            -- Here is where you configure the autocompletion settings. The arguments for .extend() have the same shape as `manage_nvim_cmp`:
            -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
            require('lsp-zero.cmp').extend()
            local cmp = require('cmp')
            local cmp_action = require('lsp-zero.cmp').action()

            cmp.setup({
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                }
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
        },
        opts = {
            diagnostics = {
                virtual_text = false,
            }
        },
        config = function()
            local lsp = require('lsp-zero').preset({})
            lsp.ensure_installed({ 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer', 'ltex' })
            lsp.configure('lua_ls', {
                settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
            })
            lsp.configure({
                cmd = { "ltex-ls" },
                filetypes = { "bibtex", "context", "context.tex", "html", "latex", "markdown", "org", "restructuredtext",
                    "rsweave" },
                flags = { debounce_text_changes = 300 },
                settings = {
                    ltex = {
                        -- language = "en"
                        language = "de-DE"
                    }
                },
            })
            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { buffer = true })
                vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = true })
                vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, { buffer = true })
                lsp.buffer_autoformat()
            end)
            lsp.setup()
        end
    }
}
