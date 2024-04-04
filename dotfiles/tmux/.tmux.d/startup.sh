#!/bin/bash
session="workspace"

# Check if the session exists, discarding output
# We can check $? for the exit status (zero for success, non-zero for failure)
tmux has-session -t $session 2>/dev/null

if [ $? != 0 ]; then
	tmux new-session -s $session
	tmux attach-session -t $session
fi
