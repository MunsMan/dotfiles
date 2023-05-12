-- colemak dh
vim.keymap.set("n", "n", "j")
vim.keymap.set("v", "n", "j")
vim.keymap.set("n", "e", "k")
vim.keymap.set("v", "e", "k")
vim.keymap.set("n", "i", "l")
vim.keymap.set("v", "i", "l")
vim.keymap.set("n", "h", "h")
vim.keymap.set("v", "h", "h")

-- keeping the next in the same position
-- vim.keymap.set("n", "h", "n")
-- vim.keymap.set("n", "H", "N")
-- mapping insert to m


vim.keymap.set("n", "m", "i")
vim.keymap.set("n", "M", "I")
vim.keymap.set("n", "l", "o")
vim.keymap.set("n", "L", "O")


vim.keymap.set("n", "f", "e")
vim.keymap.set("v", "f", "e")

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)


vim.keymap.set("n", "U", "<C-r>", {})

vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, {})
vim.keymap.set("n", "C-p", function() require("telescope.builtin").git_files() end, {})
vim.keymap.set("n", "<leader>fs", function() require("telescope.builtin").live_grep() end, {})


vim.keymap.set("n", "<leader>s", function() require("harpoon.mark").add_file() end, {})
vim.keymap.set("n", "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, {})
vim.keymap.set("n", "<C-t>", function() require("harpoon.ui").nav_file(1) end, {})
vim.keymap.set("n", "<C-s>", function() require("harpoon.ui").nav_file(2) end, {})
vim.keymap.set("n", "<C-p>", function() require("harpoon.ui").nav_file(3) end, {})
vim.keymap.set("n", "<C-g>", function() require("harpoon.ui").nav_file(4) end, {})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")

vim.keymap.set("v", "N", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "E", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "gi", "g_")
vim.keymap.set({ "n", "v" }, "gh", "^", { remap = true })

-- vim.keymap.set("i", "<Esc>u", "ü")
-- vim.keymap.set("i", "<Esc>a", "ä")
-- vim.keymap.set("i", "<Esc>o", "ö")


vim.g.tmux_navigator_no_mappings = 1


require("config.remaps.netrw")
