#!/usr/bin/env bash

# Everforest colors for Tmux - Light, Hard

set -g mode-style "fg=#5c6a72,bg=#fff9e8"

set -g message-style "fg=#5c6a72,bg=#fff9e8"
set -g message-command-style "fg=#5c6a72,bg=#fff9e8"

set -g pane-border-style "fg=#fff9e8"
set -g pane-active-border-style "fg=#5c6a72"

set -g status "on"
set -g status-justify "left"

set -g status-style "fg=#5c6a72,bg=#323c41"

set -g status-left-length "100"
set -g status-right-length "100"

set -g status-left-style NONE
set -g status-right-style NONE

set -g status-left "#[fg=#3a454a,bg=#5c6a72,bold] #S #[fg=#5c6a72,bg=#323c41,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#323c41,bg=#323c41,nobold,nounderscore,noitalics]#[fg=#5c6a72,bg=#323c41] #{prefix_highlight} #[fg=#fff9e8,bg=#323c41,nobold,nounderscore,noitalics]#[fg=#5c6a72,bg=#fff9e8] %Y-%m-%d  %I:%M %p #[fg=#5c6a72,bg=#fff9e8,nobold,nounderscore,noitalics]#[fg=#1d202f,bg=#5c6a72,bold] #h "

setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#323c41"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#a9b1d6,bg=#323c41"
setw -g window-status-format "#[fg=#323c41,bg=#323c41,nobold,nounderscore,noitalics]#[default] #I  #W #F #[fg=#323c41,bg=#323c41,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#323c41,bg=#fff9e8,nobold,nounderscore,noitalics]#[fg=#5c6a72,bg=#fff9e8,bold] #I  #W #F #[fg=#fff9e8,bg=#323c41,nobold,nounderscore,noitalics]"
