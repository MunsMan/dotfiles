return {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {},
    config = function(_, opts)
        require("smart-splits").setup(opts)
        vim.keymap.set("n", "<CS-H>", require("smart-splits").resize_left)
        vim.keymap.set("n", "<CS-N>", require("smart-splits").resize_down)
        vim.keymap.set("n", "<CS-E>", require("smart-splits").resize_up)
        vim.keymap.set("n", "<CS-I>", require("smart-splits").resize_right)
        -- moving between splits
        vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
        vim.keymap.set("n", "<C-n>", require("smart-splits").move_cursor_down)
        vim.keymap.set("n", "<C-e>", require("smart-splits").move_cursor_up)
        vim.keymap.set("n", "<C-i>", require("smart-splits").move_cursor_right)
    end,
}
