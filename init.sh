MYPATH=$(dirname $0)
echo $MYPATH
pushd $MYPATH
echo "install color-italic terminfo..."
tic -s ./init/xterm-256color-italic.terminfo
tic -s ./init/screen-256color-italic.terminfo
echo
popd
