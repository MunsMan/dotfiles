return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                keys = { ["f"] = "t", ["F"] = "T", ["t"] = "<leader>t", ["T"] = "<leader>T" },
            },
        },
    },
}
