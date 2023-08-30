return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        event = 'VeryLazy',
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
        event = 'VeryLazy',
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason-lspconfig.nvim' },
            {
                'williamboman/mason.nvim',
                keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
                build = ':MasonUpdate'
            },
        },
        config = function()
            local lsp = require('lsp-zero').preset({})

            -- then setup your lsp server as usual
            local lspconfig = require('lspconfig')

            -- example to setup lua_ls and enable call snippets
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        }
                    }
                }
            })
            lsp.ensure_installed({ 'tsserver', 'eslint', 'lua_ls', 'rust_analyzer', 'ltex' })
            lsp.configure('lua_ls', {
                settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
            })
            lsp.on_attach(function(_, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                vim.keymap.set('n', 'go', vim.diagnostic.open_float, { buffer = true, desc = 'Open Diagnostics' })
                vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = true, desc = 'Code Actions' })
                vim.keymap.set('n', '<C-r>', vim.lsp.buf.rename, { buffer = true, desc = 'Rename Symbole' })
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = true, desc = 'Jump to definition' })
                lsp.buffer_autoformat()
            end)
            lsp.set_sign_icons({
                error = '✘',
                warn = '▲',
                hint = '⚑',
                info = '»'
            })

            lsp.setup()
        end
    }
}
