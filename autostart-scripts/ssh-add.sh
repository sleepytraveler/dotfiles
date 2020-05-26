#!/bin/sh

if [ -f "$HOME/.ssh/github/sleepytraveler" ]
	ssh-add -q ~/.ssh/github/sleepytraveler < /dev/null
fi

if [ -f "$HOME/.ssh/gitlab/vkonda_ampere" ]
	ssh-add -q ~/.ssh/gitlab/vkonda_ampere < /dev/null
fi

if [ -f "$HOME/.ssh/ampere/vkonda" ]
	ssh-add -q ~/.ssh/ampere/vkonda < /dev/null
fi
