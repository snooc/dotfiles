eval "$(starship init zsh)"

# Editor
export EDITOR="nvim"

# Teleport
export TELEPORT_PROXY="transporter.ic-ops.com:443"
export TELEPORT_CLUSTER="transporter.ic-ops.com"
export TELEPORT_USER="cody@immuta.com"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source <(pkgx --shellcode)  #docs.pkgx.sh/shellcode
source <(fzf --zsh)
