return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true
        },
        float = {
            padding = 10,
            win_options = {
                winblend = 5
            },
            border = "rounded"
        },
        preview = {
            width = 0.4
        }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>e", function() require('oil').toggle_float() end, desc = 'Open Oil', mode = { 'n', 'v' } }
    }
}
