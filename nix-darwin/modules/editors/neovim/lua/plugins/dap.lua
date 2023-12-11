return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
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
        local dap = require("dap")
        dap.adapters.cppdbg = {
            id = "cppdbg",
            type = "executable",
            command = "/Users/munsman/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
        }
        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopAtEntry = true,
            },
            {
                name = "Attach to gdbserver :1234",
                type = "cppdbg",
                request = "launch",
                MIMode = "gdb",
                miDebuggerServerAddress = "localhost:1234",
                miDebuggerPath = "/usr/bin/gdb",
                cwd = "${workspaceFolder}",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end,
    keys = {
        {
            "<leader>dr",
            function()
                require("dap").continue()
                require("dapui").open()
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
