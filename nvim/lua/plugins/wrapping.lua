return {
    "andrewferrier/wrapping.nvim",
    ft = { 'markdown' },
    opts = {
        auto_set_mode_filetype_allowlist = {
            "asciidoc",
            "gitcommit",
            "latex",
            "mail",
            "markdown",
            "rst",
            "tex",
            "text",
        },
        softener = { markdown = 1.3 },
    },
    keys = {
        {
            '<leader>cw',
            function() require('wrapping').toggle_wrap_mode() end,
            desc = "Toggle Wrap Mode"
        }
    }
}
