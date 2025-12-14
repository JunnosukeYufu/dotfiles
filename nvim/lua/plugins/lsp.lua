return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Use relative paths for configuration
    local nvim_config = vim.fn.stdpath("config")

    -- Lua language server (copied from the official documentation)
    vim.lsp.config['lua_ls'] = {
      cmd = { nvim_config .. "/lsp/lua-language-server/bin/lua-language-server"},
      filetypes = { 'lua' },
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    -- terraform-ls
    vim.lsp.config['terraformls'] = {
      cmd = { nvim_config .. "/lsp/terraform-ls/terraform-ls", "serve" },
      filetypes = { 'terraform' },
      root_markers = { ".terraform", ".git" },
    }

    --enable
    vim.lsp.enable('lua_ls')
    vim.lsp.enable("terraformls")
  end,
}

