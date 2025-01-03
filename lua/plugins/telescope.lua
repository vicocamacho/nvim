return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {}
      }
    }

    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')

    vim.keymap.set("n", "<leader><leader>", builtin.find_files)
    vim.keymap.set("n", "gr", builtin.lsp_references)
    vim.keymap.set("n", "gd", builtin.lsp_definitions)

    require "plugins.telescope.multigrep".setup()
  end
}
