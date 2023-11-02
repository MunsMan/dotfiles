local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = "\\"
g.markdown_recommended_style = 0

opt.backup = false
opt.cmdheight = 0
opt.expandtab = true
opt.hlsearch = false
opt.incsearch = true
opt.isfname:append("@-@")
opt.laststatus = 3
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 4
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 4
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 50
opt.wrap = false
