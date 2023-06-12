return {
    'stevearc/oil.nvim',
    opts = {
        skip_confirm_for_simple_edits = true,
        view_options = {
            show_hidden = true
        },
        float = {
            padding = 10,
            win_options = {
                winblend = 5
            }
        }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
