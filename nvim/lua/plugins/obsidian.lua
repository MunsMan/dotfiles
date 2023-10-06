return {
    "epwalsh/obsidian.nvim",
    -- dir = '/Users/munsman/Code/obsidian.nvim/worktree/dailyTemplate/',
    -- name = 'obsidian.nvim',
    -- docs: https://github.com/epwalsh/obsidian.nvim
    lazy = true,
    event = {
        "BufReadPre **/obsidian/second-brain/**.md",
        "BufNewFile **/obsidian/second-brain/**.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        dir = "/Users/munsman/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain",

        daily_notes = {
            folder = "daily",
            template = "daily.md",
        },
        completion = {
            nvim_cmp = true,
            min_chars = 1,
            new_notes_location = "current_dir",
            prepend_note_id = true,
        },
        templates = {
            subdir = "templates",
            date_format = "%Y-%m-%d",
            substitutions = {
                yesterday = function()
                    return os.date("%Y-%m-%d", os.time() - 86400)
                end,
            },
        },
        mappings = {},
        open_notes_in = "current",
        note_id_func = function(title)
            local suffix = ""
            if title ~= nil then
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.date("%Y%m%d%M")) .. "-" .. suffix
        end,
        note_frontmatter_func = function(note)
            local out = { id = note.id, aliases = note.aliases, tags = note.tags, date = note.date }
            if
                note.metadata ~= nil
                and require("obsidian").util.table_length(note.metadata) > 0
            then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end
            return out
        end,
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            vim.fn.jobstart({ "open", url }) -- Mac OS
            -- vim.fn.jobstart({"xdg-open", url})  -- linux
        end,
    },
    setup = function(_, opts)
        require("obsidian").setup(opts)
        vim.keymap.set("n", "gf", function()
            if require("obsidian").util.cursor_on_markdown_link() then
                return "<cmd>ObsidianFollowLink<CR>"
            else
                return "gf"
            end
        end, { noremap = false, expr = true })
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "markdown", "markdown_inline" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
        })
    end,
    keys = {
        {
            "<leader>nn",
            function()
                vim.ui.input({ prompt = "Title: ", completion = "file" }, function(title)
                    if not title then
                        vim.cmd(":ObsidianNew")
                    else
                        vim.cmd(":ObsidianNew " .. title)
                    end
                end)
            end,
            desc = "open new note",
        },
        { "<leader>nd", "<cmd>ObsidianToday<cr>", desc = "open today's note" },
        { "<leader>ns", "<cmd>ObsidianSearch<cr>", desc = "note text search" },
        {
            "<leader>nl",
            "<cmd>ObsidianFollowLink<cr>",
            desc = "open link",
            mode = { "v", "n" },
        },
        { "<leader>nb", "<cmd>ObsidianBacklinks<cr>", desc = "note text search" },
        { "<leader>no", "<cmd>ObsidianOpen<cr>", desc = "open note in obsidian" },
        { "<leader>nf", "<cmd>ObsidianQuickSwitch<cr>", desc = "open note" },
        {
            "<leader>nc",
            "<cmd>ObsidianLinkNew<cr>",
            desc = "create new link",
            mode = { "v", "n" },
        },
    },
    cmd = { "ObsidianToday" },
}
