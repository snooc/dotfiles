# Open first .xcworkspace file found in folder
ows() {
  WS=$(find . -name *.xcworkspace | head -1)
  open $WS
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
