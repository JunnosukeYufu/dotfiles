# dotfiles

## 前提環境
- WSL2(Ubuntu 22.04.5 LTS)
- Neovim v0.11.4
- Git 2.34.1

## ディレクトリ構成
Neovim 0.11 の新LSP API（`vim.lsp.config`）を使用。  
`lua-language-server` や `terraform-ls` などの LSP バイナリは、  
環境依存を避けるため `~/.config/nvim/lsp` 配下に手動配置する。

```
~/.config/nvim
├── init.lua
├── lazy-lock.json
├── lsp
│   ├── lua-language-server
│   │   ├── LICENSE
│   │   ├── bin/
│   │   └── ...
│   ├── terraform-ls
│   └── ...
│
└── lua
    ├── config                  
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins                 
        ├── colorscheme.lua
        ├── lsp.lua
        └── telescope.lua
```
