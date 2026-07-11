# .zshrc
PROMPT="%F{green}%m%#%f "
alias ll="ls -lFa"

setopt hist_ignore_dups
setopt share_history 
setopt inc_append_history

export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

export PATH="$HOME/.local/bin:$PATH"

if [[ -n "$WSL_DISTRO_NAME" ]]; then
  cd ~
fi
export PATH=$PATH:/usr/local/go/bin
