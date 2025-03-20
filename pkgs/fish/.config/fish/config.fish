# Abbreviations
abbr --add -- g git
abbr --add -- ga 'git add'
abbr --add -- gau 'git add -u'
abbr --add -- gcm 'git commit'
abbr --add -- gcma 'git commit --amend'
abbr --add -- gcms 'git commit --signoff'
abbr --add -- gd 'git diff'
abbr --add -- gds 'git diff --staged'
abbr --add -- gf 'git fetch --prune'
abbr --add -- gp 'git pull --rebase --prune'
abbr --add -- gs 'git status --short'
abbr --add -- gss 'git status -uno'

# Aliases
alias cat bat
alias cls clear
alias df duf
alias diff 'delta -s'
alias du dust
alias less bat
alias ll 'eza -l'
alias lll 'eza -la'
alias ls eza
alias lt 'eza -T'
alias rg 'rg --smart-case'
alias vim nvim
alias vimdiff 'nvim -d'
alias zj zellij

set -x EDITOR nvim

if test "$TERM" != dumb
    $HOME/.nix-profile/bin/starship init fish | source
    # Initialize zoxide
    $HOME/.nix-profile/bin/zoxide init fish | source
end

set -l plugin_dir $HOME/.config/fish/

# Set paths to import plugin components
if test -d $plugin_dir/functions
    set fish_function_path $fish_function_path[1] $plugin_dir/functions $fish_function_path[2..-1]
end

if test -d $plugin_dir/completions
    set fish_complete_path $fish_complete_path[1] $plugin_dir/completions $fish_complete_path[2..-1]
end

# Source initialization code if it exists.
if test -d $plugin_dir/conf.d
    for f in $plugin_dir/conf.d/*.fish
        source $f
    end
end

if test -f $plugin_dir/key_bindings.fish
    source $plugin_dir/key_bindings.fish
end

if test -f $plugin_dir/init.fish
    source $plugin_dir/init.fish
end
