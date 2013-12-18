# Aliases

# Pretty `ls`
platform=`uname`
if [[ $platform == "Linux" ]]; then
	alias l="ls -lrth --color"
elif [[ $platform == "Darwin" ]]; then
	alias l="ls -lrthG"
fi

# Git Alliases
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gm="git commit"
alias gs="git status"
alias gp="git push"
alias gls="git ls-files"

# Directory Stack
alias dh="dirs -v"

# Quick clear
alias cl="clear"

# Rails
alias r="rails"
alias rg="rails generate"
alias rd="rails destroy"
alias rs="rails server"
alias rdc="rake db:create"
alias rdm="rake db:migrate"
alias rflip="rake db:drop && rake db:create && rake db:migrate"
