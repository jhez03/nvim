vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true -- YAML requires spaces, not tabs!
vim.opt.shiftwidth = 2 -- Most YAML style guides use 2 spaces
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
