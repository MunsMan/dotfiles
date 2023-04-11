vim.api.nvim_create_autocmd("FileType", {
 pattern = { "netrw" },
callback = function()
        vim.keymap.set("n", "n", "%:w<CR>:buffer #<CR>", {buffer = true, remap = true})
    end
})

