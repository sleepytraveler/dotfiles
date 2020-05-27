#!/bin/sh

if [ -f "$HOME/.ssh/github/sleepytraveler" ]; then
	ssh-add -q ~/.ssh/github/sleepytraveler < /dev/null
fi

if [ -f "$HOME/.ssh/gitlab/vkonda_ampere" ]; then
	ssh-add -q ~/.ssh/gitlab/vkonda_ampere < /dev/null
fi

if [ -f "$HOME/.ssh/ampere/vkonda" ]; then
	ssh-add -q ~/.ssh/ampere/vkonda < /dev/null
fi
