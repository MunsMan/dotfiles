return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = "<C-u>",
            },
        },
        panel = { enabled = true },
        filetypes = {
            markdown = true,
            yaml = true,
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
