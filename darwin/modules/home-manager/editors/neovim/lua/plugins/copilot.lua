return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = "<C-u>",
            },
        },
    },
    keys = {
        {
            "<leader>cc",
            function()
                require("copilot.suggestion").toggle_auto_trigger()
            end,
        },
    },
}
