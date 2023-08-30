return {
    "ThePrimeagen/harpoon",
    dependencies = "nvim-lua/plenary.nvim",
    lazy = true,
    opts = {
        global_settings = { mark_branch = true },
        width = vim.api.nvim_win_get_width(0) - 4,
    },
    keys = {
        {
            "<leader>s",
            function() require("harpoon.mark").add_file() end,
            desc = 'Mark as Harpoon Target',
            mode = "n"
        },
        { "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, desc = 'open harpoon menu', mode = "n" },
        { "<c-t>",     function() require("harpoon.ui").nav_file(1) end,         mode = "n" },
        { "<c-s>",     function() require("harpoon.ui").nav_file(2) end,         mode = "n" },
        { "<c-g>",     function() require("harpoon.ui").nav_file(4) end,         mode = "n" },
        { "<C-p>",     function() require("harpoon.ui").nav_file(3) end,         mode = "n" }
    }
}
