return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        modes = {
            char = {
                keys = {
                    ["f"] = "t",
                    ["t"] = "T",
                    ["F"] = "<leader>t",
                    ["T"] = "<leader>T",
                    [";"] = "I",
                    [","] = "H",
                },
                char_actions = function()
                    return {
                        [";"] = "right",
                        [","] = "left",
                    }
                end,
            },
        },
        jump = {
            nohlsearch = true,
            autojump = true,
        },
    },
}
