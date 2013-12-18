# Functions

# Code directory completion
c() { cd ~/Code/$1 }
compctl -W ~/Code -/ c

# Quick Git command
function g {
	if [[ $# > 0 ]]; then
		git $@
	else
		git status
	fi
}

# Nasty git commits
function gc {
	git commit -m "$*"
}

# `ls` after we change director
function chpwd {
	ls -G
}
