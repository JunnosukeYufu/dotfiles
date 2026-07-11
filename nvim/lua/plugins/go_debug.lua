return {
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dap-go").setup()

      local dap = require("dap")
      local keymap = vim.keymap.set

      keymap("n", "<Leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
      keymap("n", "<Leader>dc", dap.continue, { desc = "DAP: Continue" })
      keymap("n", "<Leader>di", dap.step_into, { desc = "DAP: Step into" })
      keymap("n", "<Leader>do", dap.step_over, { desc = "DAP: Step over" })
      keymap("n", "<Leader>dO", dap.step_out, { desc = "DAP: Step out" })
      keymap("n", "<Leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })
      keymap("n", "<Leader>dt", function()
        require("dap-go").debug_test()
      end, { desc = "DAP: Debug Go test" })
    end,
  },
}
