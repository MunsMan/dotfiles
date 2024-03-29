return {
    "navarasu/onedark.nvim",
    lazy = false,
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
    },
    config = function(_, opts)
        require('onedark').setup(opts)
        vim.cmd([[colorscheme onedark]])
    end
}
