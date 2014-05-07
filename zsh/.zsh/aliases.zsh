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
alias tr="tree -I 'node_modules'"

alias cs="cd $HOME/.ssh"
alias essh="vim $HOME/.ssh/config"

# Downloads folder
alias cdo="cd ~/Downloads"

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
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcm="git checkout master"
alias gv="vim +Gcommit"

alias gcccize='git config user.name "Cody Coons" && git config user.email "cody@codycoons.com"'
alias gcffize='git config user.name "Cody Coons" && git config user.email "cody@forefrontweb.com"'

# Rails
alias r="rails"
alias rg="rails generate"
alias rd="rails destroy"
alias rs="rails server"
alias rdc="rake db:create"
alias rdm="rake db:migrate"
alias rflip="echo '* Dropping Database\n' && rake db:drop && echo '* Creating Database\n' && rake db:create && echo '* Executing Migrations\n' && rake db:migrate"

# Tmux
alias t="tmux"
alias tl="tmux list-sessions"
alias tls="tmux list-sessions"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tn="tmux new -s"
alias td="tmux detach"

# Go
alias cgo="cd ~/Code/goworkspace"
alias cgs="cd ~/Code/goworkspace/src"

# Vim
alias vupdate="vim +BundleUpdate +qall"
alias vinstall="vim +BundleInstall +qall"

# Quick edits
alias evim="vim ~/.vimrc"
alias ezsh="vim ~/.zshrc"
alias ezshd="vim ~/.zsh"
alias ezsha="vim ~/.zsh/aliases.zsh"
alias etmux="vim ~/.tmux.conf"

# CURL
alias cu="curl -sSNL"

# Node
alias n="node"
alias nh="node --harmony"

# Vagrant
alias v="vagrant"
alias vup="vagrant up"
alias vp="vagrant provision"
alias vd="vagrant destroy"
alias vr="vagrant reload"
alias vh="vagrant halt"
alias vs="vagrant ssh"
alias vst="vagrant status"

# PHP
alias psp="php -S localhost:8000 -t public"

# Docker
alias d="docker"
alias dup="boot2docker up"
alias dh="boot2docker halt"
alias dcnr="docker ps -a | grep 'Exit' | awk '{print $1}' | xargs docker rm"
alias dcui="docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi"
