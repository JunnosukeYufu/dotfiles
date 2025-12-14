# dotfiles

## neovim環境設定
### 想定環境
- WSL2(Ubuntu 22.04.5 LTS)
- Neovim v0.11.4
- Git 2.34.1

### 構成要素
Neovim 0.11 の新LSP API（`vim.lsp.config`）を使用。  
`lua-language-server` や `terraform-ls` などの LSP バイナリは、  
環境依存を避けるため `~/.config/nvim/lsp` 配下に手動配置。

なおterraform-lsなどの一部のLSPは外部CLIに依存する。
これらの補完機能を正しく使用するために、以下を導入。

- terraform


### ディレクトリ構成

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
    │   ├── clipboard.lua
    │   └── options.lua
    └── plugins                 
        ├── colorscheme.lua
        ├── lsp.lua
        └── telescope.lua
```
