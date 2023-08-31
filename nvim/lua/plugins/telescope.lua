return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    -- or                              , branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    version = false,
    opts = {
        defaults = {
            prompt_prefix = ' ',
            selection_caret = ' ',
        }
    },
    keys = {
        {
            '<leader>ff',
            function() require('telescope.builtin').find_files() end,
            desc = 'Open File Fuzzy Finder',
            mode = { 'n', 'v' }
        },
        {
            '<leader>fp',
            function() require('telescope.builtin').git_files() end,
            desc = 'Git Fuzzy Finder',
            mode = { 'n', 'v' }
        },
        {
            '<leader>fs',
            function() require('telescope.builtin').live_grep() end,
            desc = 'Open Live Grep',
            mode = { 'n', 'v' }
        },
        {
            '<leader>fb',
            function() require('telescope.builtin').buffers() end,
            desc = 'Telescope Buffers',
            mode = { 'n', 'v' }
        },
        {
            'gI',
            function() require('telescope.builtin').lsp_implementations({ reuse_win = true }) end,
            desc = 'Goto Implementation'
        },
        {
            'gt',
            function() require('telescope.builtin').lsp_type_definitions({ reuse_win = true }) end,
            desc = 'Goto T[y]pe Definition'
        },
    }
}
