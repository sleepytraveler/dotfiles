# Set SSH_AUTH_SOCK to a file
test -e $HOME/.ssh/rc
set -x SSH_AUTH_SOCK $HOME/.ssh/ssh_auth_sock
