# Show Dirtty state
GIT_PS1_SHOWDIRTYSTATE="*"

bash_prompt() {
  PS1="$BGreen\u$BWhite:$BWhite\W$BRed\$(__git_ps1)$BWhite\$ $Color_Off"
}

bash_prompt
unset bash_prompt
