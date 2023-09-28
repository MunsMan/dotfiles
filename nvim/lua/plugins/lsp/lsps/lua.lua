return {
    opts = {
        settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace"
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false,
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
                format = {
                    enable = true,
                    defaultConfig = {
                        indent_style = "space",
                        indent_size = "2",
                    },
                },
            }
    },
    setup = function (opts)
        require('lspconfig').lua_ls.setup(opts)
    end
}
