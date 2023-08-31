return {
    "andrewferrier/wrapping.nvim",
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
    },
    keys = {
        {
            '<leader>cw',
            function() require('wrapping').toggle_wrap_mode() end,
            desc = "Toggle Wrap Mode"
        }
    }
}
