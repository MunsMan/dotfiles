return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        local lazy_status = require("lazy.status")
        return {
            options = {
                theme = "onedark",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = {
                    { "branch", icons_enabled = true, icon = "󰘬 " },
                    { "diff" },
                    "diagnostics",
                },
                lualine_c = { "filename" },
                lualine_x = {
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        }
    end,
}
