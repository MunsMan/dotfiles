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
                jump_labels = true,
            },
        },
        jump = {
            nohlsearch = true,
            autojump = true,
        },
    },
}
