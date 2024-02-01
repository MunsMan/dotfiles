local util = require("lspconfig/util")

return {
    opts = {
        filetype = { "rust" },
        root_dir = util.root_pattern("Cargo.toml"),
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                },
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    allFeatures = true,
                    buildScripts = {
                        enable = true,
                    },
                },
                diagnostics = {
                    disabled = { "unresolved-proc-macro" },
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    },
    setup = function(opts)
        require("lspconfig").rust_analyzer.setup(opts)
    end,
}
