# Aliases

# Pretty `ls`
platform=`uname`
if [[ $platform == "Linux" ]]; then
	alias l="ls -lrth --color"
	alias ls="ls --color"
elif [[ $platform == "Darwin" ]]; then
	alias l="ls -lrthG"
	alias ls="ls -G"
fi
unset platform

# Unix Commands
alias p="pwd"
alias cd.="cd .."
alias cd..="cd .."
alias cd...="cd .."

# Directory Stack
alias d="dirs -v"

# Quick clear
alias cl="clear"

# Git Alliases
# alias g="git" - Moved to a function for cool status messages
alias ga="git add"
alias gaa="git add --all"
alias gm="git commit"
alias gs="git status"
alias gp="git push"
alias gls="git ls-files"

# Rails
alias r="rails"
alias rg="rails generate"
alias rd="rails destroy"
alias rs="rails server"
alias rdc="rake db:create"
alias rdm="rake db:migrate"
alias rflip="rake db:drop && rake db:create && rake db:migrate"

# Go
alias cgo="cd ~/Code/goworkspace"
alias cgs="cd ~/Code/goworkspace/src"
