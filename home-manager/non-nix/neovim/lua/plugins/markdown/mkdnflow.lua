return {
    "jakewvincent/mkdnflow.nvim",
    lazy = true,
    ft = "markdown",
    dependencies = { "starwing/luautf8" },
    config = function()
        require("mkdnflow").setup({
            modules = {
                bib = true,
                buffers = true,
                conceal = true,
                cursor = true,
                folds = true,
                links = true,
                lists = true,
                maps = true,
                paths = true,
                tables = true,
                yaml = false,
                cmp = true,
            },
            filetypes = { md = true, rmd = true, markdown = true },
            create_dirs = true,
            perspective = {
                priority = "first",
                fallback = "current",
                root_tell = false,
                nvim_wd_heel = false,
                update = false,
            },
            wrap = false,
            bib = {
                default_path = nil,
                find_in_root = true,
            },
            silent = false,
            links = {
                style = "wiki",
                name_is_source = false,
                conceal = true,
                context = 0,
                implicit_extension = nil,
                transform_implicit = false,
                transform_explicit = function(text)
                    text = text:gsub(" ", "-")
                    text = text:lower()
                    text = os.date("%Y-%m-%d_") .. text
                    return text
                end,
            },
            new_file_template = {
                use_template = false,
                placeholders = {
                    before = {
                        title = "link_title",
                        date = "os_date",
                    },
                    after = {},
                },
                template = "# {{ title }}",
            },
            to_do = {
                symbols = { " ", "-", "X" },
                update_parents = true,
                not_started = " ",
                in_progress = "-",
                complete = "X",
            },
            tables = {
                trim_whitespace = true,
                format_on_move = true,
                auto_extend_rows = false,
                auto_extend_cols = false,
            },
            yaml = {
                bib = { override = false },
            },
            mappings = {
                MkdnEnter = { { "n", "v" }, "<CR>" },
                MkdnTab = false,
                MkdnSTab = false,
                MkdnNextLink = { "n", "<Tab>" },
                MkdnPrevLink = { "n", "<S-Tab>" },
                MkdnNextHeading = { "n", "]]" },
                MkdnPrevHeading = { "n", "[[" },
                MkdnGoBack = false,
                MkdnGoForward = false,
                MkdnCreateLink = false, -- see MkdnEnter
                MkdnCreateLinkFromClipboard = false, -- see MkdnEnter
                MkdnFollowLink = false, -- see MkdnEnter
                MkdnDestroyLink = false,
                MkdnTagSpan = { "v", "<M-CR>" },
                MkdnMoveSource = { "n", "<C-R>" },
                MkdnYankAnchorLink = false,
                MkdnYankFileAnchorLink = false,
                MkdnIncreaseHeading = { "n", "+" },
                MkdnDecreaseHeading = { "n", "-" },
                MkdnToggleToDo = { { "n", "v" }, "<C-Space>" },
                MkdnNewListItem = false,
                MkdnNewListItemBelowInsert = { "n", "o" },
                MkdnNewListItemAboveInsert = { "n", "O" },
                MkdnExtendList = false,
                MkdnUpdateNumbering = false,
                MkdnTableNextCell = { "i", "<Tab>" },
                MkdnTablePrevCell = { "i", "<S-Tab>" },
                MkdnTableNextRow = false,
                MkdnTablePrevRow = false,
                MkdnTableNewRowBelow = false,
                MkdnTableNewRowAbove = false,
                MkdnTableNewColAfter = false,
                MkdnTableNewColBefore = false,
                MkdnFoldSection = false,
                MkdnUnfoldSection = false,
            },
        })
    end, -- ** DEFAULT SETTINGS; TO USE THESE, PASS NO ARGUMENTS TO THE SETUP FUNCTION **
}
