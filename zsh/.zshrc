# ZSH History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# VIM Key bindings
bindkey -v

# Famous ZSH tab completion
autoload -Uz compinit
compinit

# Load colors
autoload -U colors
colors

# Load prompt
autoload -U promptinit
promptinit

# Set prompt
prompt off

# chruby from homebrew
if [[ -f "/usr/local/opt/chruby/share/chruby/chruby.sh" ]]; then
	source /usr/local/opt/chruby/share/chruby/chruby.sh
	source /usr/local/opt/chruby/share/chruby/auto.sh

	chruby ruby
fi

[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM

# Load extras
source $HOME/.zsh/config.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/functions.zsh
source $HOME/.zsh/completions.zsh
source $HOME/.zsh/prompt.zsh

# Android
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"

# The Almighty PATH(s)
export GOPATH="$HOME/Code/goworkspace"
export PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin:$GOPATH/bin"

# Docker
export DOCKER_HOST=localhost
