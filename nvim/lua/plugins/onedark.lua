return {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000, -- Ensure it loads first
    opts = {
        transparent = true,
        style = "deep",
        lualine = {
            transparent = true
        },
        diagnostics = {
            background = false
        }
    }
}
