# Setup mbysnc alias
if test -e "$HOME/.config/mbsync/config"
    abbr --add -- mbsync "mbsync --config $HOME/.config/mbsync/config"
end
