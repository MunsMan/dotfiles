return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    opts = {
        linters_by_ft = {
            typescript = { "eslint_d" },
            svelte = { "eslint_d" },
            python = { "pylint" },
        },
    },
    setup = function(_, opts)
        local lint = require("lint")
        lint.setup(opts)

        local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_group,
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
