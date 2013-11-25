# Open first .xcworkspace file found in folder
ows() {
  WS=$(find . -name *.xcworkspace | head -1)
  open $WS
}

# Open first .xcproject file found in folder
op() {
  P=$(find . -name *.xcodeproj | head -1)
  open $P
}

# `cd` into ~/Code with completion
c() {
  cd ~/Code/$1
}

_c() {
  local cur opts
  cur="${COMP_WORDS[COMP_CWORD]}"
  opts=$(cd ~/Code ; ls -d */. | sed 's|/./||')
  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F _c c

# Go projects
gnp() {
  mkdir src/github.com/$1
}

gvim() {
  vim src/github.com/$1
}
