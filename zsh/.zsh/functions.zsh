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

# cool dig
function diga {
	echo ">> A Records for $1"
	dig +noall +answer $1 a
}

function digmx {
	echo ">> MX Records for $1"
	dig +noall +answer $1 mx
}

function digc {
	echo ">> C Records for $1"
	dig +noall +answer $1 cname
}

function digtxt {
	echo ">> TXT Records for $1"
	dig +noall +answer $1 txt
}

function finddups {
	for i in $(find . -type f -exec openssl sha1 {} \+ | tee .hashes.tmp | sed 's/^.* //' | sort | uniq -d); do grep $i .hashes.tmp; echo; done;
}
