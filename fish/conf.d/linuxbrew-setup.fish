# Add to PATH and other variables if linuxbrew directory is present
if test -d "$HOME/.linuxbrew"
	set PATH "$HOME/.linuxbrew/bin" $PATH
	set MANPATH "$HOME/.linuxbrew/share/man" $MANPATH
	set INFOPATH "$HOME/.linuxbrew/share/info" $INFOPATH
end

