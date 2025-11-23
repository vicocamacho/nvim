return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
    config = function()
      require("oil").setup({
        skip_confirm_for_simple_edits = true
      })
      vim.keymap.set("n", "<leader>f", "<cmd>Oil<CR>")
    end
  }
}
