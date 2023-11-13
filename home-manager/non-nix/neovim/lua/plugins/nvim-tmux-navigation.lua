return {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    enabled = false,
    config = function()
        require("nvim-tmux-navigation").setup({
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = "<C-h>",
                down = "<C-n>",
                up = "<C-e>",
                right = "<C-l>",
                last_active = "<C-\\>",
            },
        })
    end,
}
