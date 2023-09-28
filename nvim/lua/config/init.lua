local M = {}

M.did_init = false

function M.setup()
    if not M.did_init then
        M.load('options')

        -- check if a file gets opened
        if vim.fn.argc(-1) == 0 then
            -- autocmds and keymaps can wait to load
            vim.api.nvim_create_autocmd("User", {
                group = vim.api.nvim_create_augroup("NeoVimSetup", { clear = true }),
                pattern = "VeryLazy",
                callback = function()
                    M.load("autocmds")
                    M.load("keymaps")
                end,
            })
        else
            -- load them now so they affect the opened buffers
            M.load("autocmds")
            M.load("keymaps")
        end
        M.load('lazy')
    end
end

function M.load(name)
    require('config.' .. name)
end

return M
