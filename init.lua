require("config.lazy")

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.g.VimuxOrientation = "h"
vim.g.VimuxHeight = "40%"

vim.keymap.set({ "n", "v" }, "n", "nzzzv", { desc = "Center when searching", remap = true })
vim.keymap.set({ "n", "v" }, "N", "Nzzzv", { desc = "Center when searching", remap = true })

vim.keymap.set("n", "<C-k>", "<cmd>cp<CR>", { remap = true, desc = "Go to previous quickfix entry" })
vim.keymap.set("n", "<C-j>", "<cmd>cn<CR>", { remap = true, desc = "Go to next quickfix entry" })
vim.keymap.set("n", "<C-x>", "<cmd>cclose<CR>", { remap = true, desc = "Close quickfix list" })

vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz", { desc = "Go down a page and center", remap = true })
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz", { desc = "Go up a page and center", remap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>s1", "<cmd>silent !tmux-sessionizer wh<CR>")
vim.keymap.set("n", "<leader>s2", "<cmd>silent !tmux-sessionizer squire<CR>")
vim.keymap.set("n", "<leader>s3", "<cmd>silent !tmux-sessionizer .config<CR>")

vim.cmd("autocmd FileType ruby setlocal indentkeys-=.")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',

  callback = function()
    vim.highlight.on_yank()
  end,
})
