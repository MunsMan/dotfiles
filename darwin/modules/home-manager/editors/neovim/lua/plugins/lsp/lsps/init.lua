local function mergeTables(table1, table2)
    if table1 == nil and table2 == nil then
        return {}
    elseif table1 == nil then
        return table2
    elseif table2 == nil then
        return table1
    else
        local mergedTable = {}
        for key, value in pairs(table1) do
            mergedTable[key] = value
        end
        for key, value in pairs(table2) do
            mergedTable[key] = value
        end
        return mergedTable
    end
end

local function setup_default(opts)
    require("mason-lspconfig").setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup(opts)
        end,
    })
end

return {
    setup = function(opts)
        setup_default(opts)
        local configDir = "plugins.lsp.lsps."
        local files = vim.split(vim.fn.glob("~/.config/nvim/lua/plugins/lsp/lsps/*.lua"), "\n")
        for _, b in pairs(files) do
            for w in string.gmatch(b, "[^/]+%.lua") do
                local configName, _ = w:gsub("%.lua$", "")
                if configName == "init" then
                    goto continue
                end
                local config = require(configDir .. configName)
                config.setup(mergeTables(opts, config.opts))
                ::continue::
            end
        end
    end,
}
