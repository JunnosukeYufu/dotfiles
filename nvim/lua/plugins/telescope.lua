return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup()

    -- キーマップもここで設定可能
    local keymap = vim.keymap.set
    keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { silent = true })
    keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>',  { silent = true })
    keymap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>',    { silent = true })
    keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>',  { silent = true })
  end,
}

