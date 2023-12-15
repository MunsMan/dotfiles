return {
    opts = {
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
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
