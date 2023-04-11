return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    },
    opts = {
        diagnostics = {
            virtual_text = false,
        }
    },
    config = function()
        local lsp = require('lsp-zero').preset({})
        lsp.ensure_installed({'tsserver', 'eslint', 'lua_ls', 'rust_analyzer'})
        lsp.configure('lua_ls', {
                settings = {Lua = { diagnostics = { globals = {'vim'}}}}
            })
        lsp.on_attach(function(_, bufnr)
            lsp.default_keymaps({buffer=bufnr})
        end)
        lsp.setup()
    end
}
