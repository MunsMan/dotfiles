local M = {}

M._keys = {
    {
        "go",
        vim.diagnostic.open_float,
        { desc = "Open Diagnostics" },
    },
    {
        "K",
        vim.lsp.buf.hover,
        { desc = "open documentation" },
    },
    {
        "<C-k>",
        vim.lsp.buf.signature_help,
        { desc = "signature help" },
    },
    {
        "<leader>a",
        vim.lsp.buf.code_action,
        { desc = "Code Actions" },
    },
    {
        "<C-r>",
        vim.lsp.buf.rename,
        { desc = "Rename Symbole" },
    },
    {
        "gd",
        function()
            require("telescope.builtin").lsp_definitions()
        end,
        { desc = "Jump to definition" },
    },
    {
        "gI",
        function()
            require("telescope.builtin").lsp_implementations()
        end,
        { desc = "Jump to Implementation" },
    },
    {
        "gr",
        vim.lsp.buf.references,
        { desc = "Show References" },
    },
    {
        "gD",
        vim.lsp.buf.declaration,
        { desc = "Jump to Declaration" },
    },
    {
        "gt",
        function()
            require("telescope.builtin").lsp_type_definitions()
        end,
        { desc = "Jump to Type Definition" },
    },
}

return M
