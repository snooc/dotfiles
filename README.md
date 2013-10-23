DOTFILES
================================================================================

Installation
--------------------------------------------------------------------------------
1. Clone repository into `~/.dotfiles`
2. Install GNU Stow `brew install stow`
2. Run install script `bin/install`

About
--------------------------------------------------------------------------------
Dotfiles are setup to be symlinked using
[GNU Stow](http://www.gnu.org/software/stow/). Files are divided up into
packages and can be installed individually using `stow {package}`. To delete a
package, just run `stow --delete {package}`.
