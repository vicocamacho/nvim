return {
  {
    "tpope/vim-rails",
    config = function()
      vim.keymap.set("n", "<leader>ra", ":A<CR>")
    end
  }
}
