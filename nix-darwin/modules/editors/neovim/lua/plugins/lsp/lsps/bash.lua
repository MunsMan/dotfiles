return {
    opts = {},
    setup = function(opts)
        require('lspconfig').bashls.setup(opts)
    end
}
