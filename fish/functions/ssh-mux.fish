function ssh-mux
	ssh $argv[1] -t 'tmux attach'
end
