return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "ldelossa/nvim-dap-projects" },
    lazy = true,
    opts = {
        controls = {
            icons = {
                disconnect = "",
                pause = "",
                play = "",
                run_last = "",
                step_back = "",
                step_into = "",
                step_out = "",
                step_over = "",
                terminate = "",
            },
        },
    },
    config = function(_, opts)
        require("dapui").setup(opts)
    end,
    keys = {
        {
            "<leader>dr",
            function()
                require("dap").continue()
                require("dapui").open()
                require("nvim-dap-projects").search_project_config()
            end,
            desc = "Start Debugger",
        },
        {
            "<leader>dp",
            function()
                require("dap").pause()
            end,
            desc = "Pause Debugger",
        },
        {
            "<leader>ds",
            function()
                require("dap").step_into()
            end,
            desc = "step into - DAP",
        },
        {
            "<leader>dl",
            function()
                require("dap").step_out()
            end,
            desc = "step out - DAP",
        },
        {
            "<leader>do",
            function()
                require("dap").step_over()
            end,
            desc = "step over - DAP",
        },
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "toggle Breakpoint - DAP",
        },
        {
            "<leader>dh",
            function()
                local telescope = require("telescope")
                telescope.load_extension("dap")
                telescope.extensions.dap.commands({})
            end,
            desc = "Search DAP Commands",
        },
        {
            "<leader>dc",
            function()
                local dap = require("dap")
                require("dapui").close()
                dap.terminate()
                dap.repl.close()
            end,
            desc = "close DAP",
        },
    },
}
