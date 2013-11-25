# Setup 256 colors
source ~/.bash/lib/base16-ocean.dark.sh

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# default ruby version
chruby ruby

# Homebrew Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# bash git completion
source ~/.bash/lib/git-prompt.sh

# customizations
source ~/.bash/path.sh
source ~/.bash/variables.sh
source ~/.bash/colors.sh
source ~/.bash/functions.sh
source ~/.bash/aliases.sh
source ~/.bash/prompt.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
