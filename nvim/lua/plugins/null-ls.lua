return {
    "jose-elias-alvarez/null-ls.nvim",
    lazy = true,
    opts = function(_, _opts)
        local nls = require("null-ls")
        nls.setup({
            sources = {
                nls.builtins.formatting.prettier.with({ "javascript", "typescript", "css", "scss", "html", "json",
                    "yaml",
                    "markdown", "graphql", "md", "txt", }),
            }
        })
    end,
}
