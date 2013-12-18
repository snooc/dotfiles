# ZSH History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# VIM Key bindings
bindkey -v

# Famous ZSH tab completion
autoload -Uz compinit
compinit

# Load prompt
autoload -U promptinit
promptinit

# Set prompt
prompt adam1

# Homebrew completions
fpath=(/usr/local/share/zsh-completions $fpath)

# chruby from homebrew
if [[ -f "/usr/local/opt/chruby/share/chruby/chruby.sh" ]]; then
	source /usr/local/opt/chruby/share/chruby/chruby.sh
	source /usr/local/opt/chruby/share/chruby/auto.sh

	chruby ruby
fi

# Load extras
source $HOME/.zsh/config.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/completions.zsh

# The Almighty PATH
PATH="$PATH:/usr/local/bin:./bin"
