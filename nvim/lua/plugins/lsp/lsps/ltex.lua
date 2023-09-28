return {
    opts = {
        settings = {
            ltex = {
                settings = {
                    checkFrequency = 'save',
                    language = 'en-US',
                    additionalRules = {
                        enablePickyRules = true,
                        motherTongue = 'de-DE',
                    },
                }
            }
        },
        filetypes = { 'bib', 'markdown', 'org', 'plaintex', 'rst', 'rnoweb', 'tex' },
        ltex_extra = {
                    load_langs = { "en-US", 'de-DE' },
                    init_check = true,
                    path = ".ltex",
                    log_level = "none",
                }
    },
    setup = function (opts)
        opts.on_attach = function(_, bufnr)
                require("ltex_extra").setup(opts.ltex_extra)
                opts.on_attach(_, bufnr)
            end
        opts.ltex_extra = nil
        require('lspconfig').ltex.setup(opts)
    end
}
