#!/bin/bash

SESSIONNAME="7drl"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
then
  tmux new-session -s $SESSIONNAME -n script -d
  tmux send-keys -t $SESSIONNAME "cd ~/projects/7dayrl2019" C-m 
  tmux send-keys -t $SESSIONNAME "vim src/game.ts" C-m 
  tmux split-window -v -l 3 -t $SESSIONNAME
  tmux send-keys -t $SESSIONNAME "cd ~/projects/7dayrl2019" C-m 
  tmux split-window -h -t $SESSIONNAME
  tmux send-keys -t $SESSIONNAME "cd ~/projects/7dayrl2019" C-m 
  tmux send-keys -t $SESSIONNAME "npm start" C-m 
  
  # tmux send-keys -t $SESSIONNAME ls
  # split horizontal, split vertical
  # tmux send-prefix -t $SESSIONNAME C-m
  # tmux send-keys -t $SESSIONNAME C-b % C-m
 # C-m
fi

tmux attach -t $SESSIONNAME
