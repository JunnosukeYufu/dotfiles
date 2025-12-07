return {
  "neovim/nvim-lspconfig",
  config = function()
    -- 相対パスで書くために設定
    local nvim_config = vim.fn.stdpath("config")

    -- LSPサーバ追加(公式コピペ)
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

    -- terraform-ls追加
    vim.lsp.config['terraformls'] = {
      cmd = { nvim_config .. "/lsp/terraform-ls/terraform-ls", "serve" },
      filetypes = { 'terraform' },
    }

    --enable許可
    vim.lsp.enable('lua_ls')
    vim.lsp.enable("terraformls")
  end,
}

