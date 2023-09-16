return {
    'andrewferrier/wrapping.nvim',
    ft = { 'markdown' },
    opts = {
        auto_set_mode_filetype_allowlist = {
            'asciidoc',
            'gitcommit',
            'latex',
            'mail',
            'markdown',
            'rst',
            'tex',
            'text',
        },
        softener = { markdown = 1.6 },
        notify_on_switch = false,
        create_keymaps = false
    },
    config = function(_, opts)
        require('wrapping').setup(opts)
        vim.keymap.set({ 'n', 'v' }, 'n', 'gj')
        vim.keymap.set({ 'n', 'v' }, 'e', 'gk')
    end,
    keys = {
        {
            '<leader>cw',
            function() require('wrapping').toggle_wrap_mode() end,
            desc = 'Toggle Wrap Mode'
        }
    }
}
