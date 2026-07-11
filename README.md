# dotfiles

自分用の dotfiles。主にクライアント PC 上の WSL2 に Neovim 開発環境を展開するためのもの。

## 想定環境

### ホスト

- Windows クライアント PC
- WSL2
- Ubuntu 22.04.5 LTS

### 基本ツール

- Git 2.34.1 以上
- Neovim v0.11.4
- Go
- Terraform

### Neovim 前提

- 設定ディレクトリは `~/.config/nvim`
- leader key は Space
- クリップボードは WSL2 から Windows の `clip.exe` / PowerShell を使う前提
- プラグインは `lazy.nvim` で管理
- プラグインの固定バージョンは `nvim/lazy-lock.json` で管理

## 構成要素

```text
nvim
├── init.lua
├── lazy-lock.json
├── lsp
│   ├── lua-language-server
│   │   └── bin/lua-language-server
│   └── terraform-ls
│       └── terraform-ls
└── lua
    ├── config
    │   ├── clipboard.lua
    │   ├── keymaps.lua
    │   ├── lazy.lua
    │   └── options.lua
    └── plugins
        ├── colorscheme.lua
        ├── go_debug.lua
        ├── lsp.lua
        └── telescope.lua
```

### 管理しているもの

- Neovim の基本設定
- lazy.nvim の設定
- Neovim プラグイン定義
- Neovim プラグインの lockfile
- Lua / Terraform / Go 用の LSP 設定
- Go 用の最小 DAP 設定

### 別途配置するもの

OS や CPU アーキテクチャに依存する実行ファイルは、必要な環境に配置して使う。

| 用途 | コマンド / バイナリ | 配置・参照方法 |
| --- | --- | --- |
| Lua LSP | `lua-language-server` | `~/.config/nvim/lsp/lua-language-server/bin/lua-language-server` |
| Terraform LSP | `terraform-ls` | `~/.config/nvim/lsp/terraform-ls/terraform-ls` |
| Go LSP | `gopls` | PATH 上に配置 |
| Go Debug | `dlv` | PATH 上に配置 |
| Terraform CLI | `terraform` | PATH 上に配置 |

`gopls` / `dlv` は、インストーラで入れる必要はない。クライアント PC ごとに取得済みバイナリを `~/.local/bin` などへ配置して PATH を通せばよい。

## クライアント PC への展開方法

### 1. dotfiles を配置する

任意の場所に clone する。

```bash
git clone <this-repository-url> ~/dotfiles
```

### 2. 既存 Neovim 設定を退避する

既存の `~/.config/nvim` がある場合だけ退避する。

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```

### 3. Neovim 設定をリンクする

```bash
mkdir -p ~/.config
ln -s ~/dotfiles/nvim ~/.config/nvim
```

### 4. 外部バイナリを配置する

固定パス参照のものを配置する。

```text
~/.config/nvim/lsp/lua-language-server/bin/lua-language-server
~/.config/nvim/lsp/terraform-ls/terraform-ls
```

PATH 参照のものを配置する。

```text
~/.local/bin/gopls
~/.local/bin/dlv
~/.local/bin/terraform
```

必要なら PATH を通す。

```bash
export PATH="$HOME/.local/bin:$PATH"
```

永続化する場合は、使用している shell の rc ファイルに追加する。

### 5. Neovim を起動する

初回起動時に `lazy.nvim` がなければ自動で clone される。

```bash
nvim
```

必要に応じて Neovim 内で同期する。

```vim
:Lazy sync
```

## 展開後の確認

### シェルで確認

```bash
nvim --version
git --version
gopls version
dlv version
terraform version
```

### Neovim で確認

```vim
:checkhealth
:LspInfo
```

Go ファイルで以下を確認する。

- `gd` で定義ジャンプできること
- `K` で hover が表示されること
- `<Leader>db` でブレークポイントを切り替えられること

## 注意点

- 初回の `lazy.nvim` / プラグイン取得にはネットワークが必要。
- 完全にオフラインで展開する場合は、Neovim の data ディレクトリ配下の `lazy.nvim` と各プラグイン実体も別途持ち運ぶ。
- この README は自分用の展開メモなので、各プラグインの詳細な使い方は記載しない。
- WSL2 以外で使う場合は、まず `nvim/lua/config/clipboard.lua` を見直す。
