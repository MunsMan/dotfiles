return {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
    -- yes, you can use the opts field, just I'm showing the setup explicitly
    config = function()
        require("lspconfig").ltex.setup {
            on_attach = function(client, bufnr)
                require("ltex_extra").setup {
                    load_langs = { "en-US" },
                    init_check = true,
                    path = ".ltex",
                    log_level = "none",
                }
            end,
            settings = {
                ltex = {
                    language = "en-US",
                    additionalRules = {
                        enablePickyRules = true,
                    }
                }
            }
        }
    end
}
