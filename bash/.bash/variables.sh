# Android SDK
export ANDROID_HOME=/usr/local/opt/android-sdk

# GOROOT
GOVERSION=$(brew list go | head -n 1 | cut -d '/' -f 6)
export HOMEBREW_GO_PATH=$(brew --prefix)/Cellar/go/$GOVERSION

# GOPATH
export GOPATH=$HOME/Code/goworkspace
