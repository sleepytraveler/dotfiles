#!/usr/bin/env bash
# Based on: https://github.com/catppuccin/tmux/blob/main/catppuccin-latte.tmuxtheme
# Catppuccin theme - Latte

set -g status "on"
set -g status-bg "#dce0e8"
set -g status-justify "left"
set -g status-left-length "100"
set -g status-right-length "100"

# messages
set -g message-style "fg=#179299,bg=#bcc0cc,align=centre"
set -g message-command-style "fg=#179299,bg=#bcc0cc,align=centre"

# panes
set -g pane-border-style "fg=#bcc0cc"
set -g pane-active-border-style "fg=#1e66f5"

# windows
setw -g window-status-activity-style "fg=#4c4f69,bg=#dce0e8,none"
setw -g window-status-separator ""
setw -g window-status-style "fg=#4c4f69,bg=#dce0e8,none"

# --------=== Statusline

set -g status-left ""
set -g status-right "#[fg=#8839ef,bg=#dce0e8,nobold,nounderscore,noitalics]#[fg=#4c4f69,bg=#8839ef,nobold,nounderscore,noitalics] #[fg=#4c4f69,bg=#bcc0cc] #W #{?client_prefix,#[fg=#d20f39],#[fg=#40a02b]}#[bg=#bcc0cc]#{?client_prefix,#[bg=#d20f39],#[bg=#40a02b]}#[fg=#dce0e8] #[fg=#4c4f69,bg=#bcc0cc] #S "

# current_dir
setw -g window-status-format "#[fg=#dce0e8,bg=#1e66f5] #I #[fg=#4c4f69,bg=#bcc0cc] #W #F "
setw -g window-status-current-format "#[fg=#dce0e8,bg=#fe640b] #I #[fg=#4c4f69,bg=#dce0e8] #{b:pane_current_path} "

# parent_dir/current_dir
# setw -g window-status-format "#[fg=colour232,bg=colour111] #I #[fg=colour222,bg=colour235] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "
# setw -g window-status-current-format "#[fg=colour232,bg=colour208] #I #[fg=colour255,bg=colour237] #(echo '#{pane_current_path}' | rev | cut -d'/' -f-2 | rev) "

# --------=== Modes
setw -g clock-mode-colour "#1e66f5"
setw -g mode-style "fg=#8839ef bg=#acb0be bold"
