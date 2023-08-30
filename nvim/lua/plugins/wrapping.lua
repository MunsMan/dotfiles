return {
    "andrewferrier/wrapping.nvim",
    config = function()
        require("wrapping").setup()
    end,
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
    keys = { 'cw', '<cmd>ToggleWrapMode<cr>' }
}
