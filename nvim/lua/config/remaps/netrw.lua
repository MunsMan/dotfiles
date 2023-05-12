vim.api.nvim_create_autocmd("FileType", {
    pattern = { "netrw" },
    callback = function()
        vim.keymap.set("n", "f", "%:w<CR>", { buffer = true, remap = true })
        vim.keymap.set("n", "h", 'h', { buffer = true, remap = true })
        vim.keymap.set("n", "n", 'j', { buffer = true, remap = true })
        vim.keymap.set("n", "e", 'k', { buffer = true, remap = true })
        vim.keymap.set("n", "i", 'l', { buffer = true, remap = true })
    end
})
