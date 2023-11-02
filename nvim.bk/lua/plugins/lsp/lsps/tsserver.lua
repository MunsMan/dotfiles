return {
    opts = {},
    setup = function (opts)
        require('lspconfig').tsserver.setup(opts)
    end
}
