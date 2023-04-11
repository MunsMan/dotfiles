vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

vim.keymap.set("n", "U", "<C-r>", {})

vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, {})
vim.keymap.set("n", "C-p", function() require("telescope.builtin").git_files() end, {})
vim.keymap.set("n", "<leader>fs", function() require("telescope.builtin").live_grep() end, {})


vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, {})
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, {})
vim.keymap.set("n", "<C-n>", function() require("harpoon.ui").nav_file(1) end, {})
vim.keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(2) end, {})
vim.keymap.set("n", "<C-m>", function() require("harpoon.ui").nav_file(3) end, {})
vim.keymap.set("n", "<C-s>", function() require("harpoon.ui").nav_file(4) end, {})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({"n", "v"}, "gl", "g_")
vim.keymap.set({"n", "v"}, "gh", "^", { remap = true })

-- vim.keymap.set("i", "<Esc>u", "ü")
-- vim.keymap.set("i", "<Esc>a", "ä")
-- vim.keymap.set("i", "<Esc>o", "ö")

require("config.remaps.netrw")
