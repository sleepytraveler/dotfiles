# Set SSH_AUTH_SOCK to a file
if test -e $HOME/.ssh/agent/ssh-agent.sock
    set -x SSH_AUTH_SOCK $HOME/.ssh/agent/ssh-agent.sock
end
