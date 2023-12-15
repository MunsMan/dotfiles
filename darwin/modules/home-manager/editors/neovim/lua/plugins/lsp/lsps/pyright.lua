return {
    opts = {},
    setup = function (opts)
        require('lspconfig').pyright.setup(opts)
    end
}
