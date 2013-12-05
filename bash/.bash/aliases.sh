# Pretty `ls`
alias ls="ls -GF"
alias lsa="ls -laGF"

# Promote bad behaviod
alias cd..="cd .."

# Quick Clear
alias cl="clear"

# Downloads
alias cdow="cd ~/Downloads"

# Postgres
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias pgstatus="pg_ctl -D /usr/local/var/postgres status"

# Git
alias g="git"
alias gs="git status"
alias ga="git add"
alias gaa="git add -A"
alias gmm="git commit"
alias gp="git push"
alias gm="git merge"
alias gr="git rebase"
alias glg="git lg"
alias gl="git ls-files"

# Quick editing files
alias evim="vim ~/.vimrc"
alias ebash="vim ~/.bash_profile"
alias ebalias="vim ~/.bash/aliases.sh"
alias ebfunctions="vim ~/.bash/functions.sh"
alias ebpath="vim ~/.bash/path.sh"
alias edot="vim ~/.dotfiles"

# Quick cd's
alias cdd="cd ~/.dotfiles"

# Put XCode on a diet!
alias xcdiet="rm -rf ~/Library/Developer/Xcode/DerivedData/"

# GO!
alias cgo="cd $GOPATH"

# Heroku
alias h="heroku"
