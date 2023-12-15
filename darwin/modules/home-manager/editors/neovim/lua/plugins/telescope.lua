return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "Telescope",
    version = false,
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            mappings = {
                i = {
                    ["<C-i>"] = require("telescope.actions").select_vertical,
                    ["<C-h>"] = require("telescope.actions").select_horizontal,
                },
                n = {
                    ["<C-i>"] = require("telescope.actions").select_vertical,
                    ["<C-h>"] = require("telescope.actions").select_horizontal,
                    ["n"] = require("telescope.actions").move_selection_next,
                    ["e"] = require("telescope.actions").move_selection_previous,
                },
            },
        },
    },
    keys = {
        {
            "<leader>ff",
            function()
                require("telescope.builtin").find_files()
            end,
            desc = "Open File Fuzzy Finder",
            mode = { "n", "v" },
        },
        {
            "<leader>fp",
            function()
                require("telescope.builtin").git_files()
            end,
            desc = "Git Fuzzy Finder",
            mode = { "n", "v" },
        },
        {
            "<leader>fg",
            function()
                require("telescope.builtin").live_grep()
            end,
            desc = "Open Live Grep",
            mode = { "n", "v" },
        },
        {
            "<leader>fs",
            function()
                require("telescope.builtin").lsp_document_symbols()
            end,
            desc = "Telescope document symbols",
            mode = { "n", "v" },
        },
        {
            "<leader>fb",
            function()
                require("telescope.builtin").buffers()
            end,
            desc = "Telescope Buffers",
            mode = { "n", "v" },
        },
        {
            "<leader>fe",
            function()
                require("telescope.builtin").diagnostics()
            end,
            desc = "Telescope Errors",
            mode = { "n", "v" },
        },
    },
}
