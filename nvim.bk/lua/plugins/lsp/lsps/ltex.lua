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
    },
    setup = function(opts)
        opts.on_attach = function(_, bufnr)
            require("ltex_extra")
            opts.on_attach(_, bufnr)
        end
        require('lspconfig').ltex.setup(opts)
    end
}
