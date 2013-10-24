ows() {
  WS=$(find . -name *.xcworkspace | head -1)
  open $WS
}
