eval "$(mise activate zsh)"
eval "$(starship init zsh)"

# Editor
export EDITOR="nvim"

# Homebrew auto-complete
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# Aliases
alias lnl="${HOME}/Code/cloud-ops/scripts/lnl"
alias ghv="gh repo view --web"
alias kctx="kubectx"
alias kns="kubens"
alias kc="kubectl"
alias zj="zellij"
alias tree="eza --tree"

setopt completealiases
function cdc() {
  cd ${HOME}/Code/$1
}

source <(fzf --zsh)
