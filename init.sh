MYPATH=$(dirname $0)
echo $MYPATH
pushd $MYPATH
echo "install color-italic terminfo..."
tic -s ./init/xterm-256color-italic.terminfo
tic -s ./init/screen-256color-italic.terminfo

echo "Installing iterm2 profile..."
# Replaces the working directory based on user account
cat ./init/iterm2.profile.tmpl| jq ".[\"Working Directory\"] = \"$HOME\""  > ~/Library/Application\ Support/iTerm2/DynamicProfiles/falcon

echo
popd
