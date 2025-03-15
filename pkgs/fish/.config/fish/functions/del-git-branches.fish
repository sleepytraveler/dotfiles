function del-git-branches
    function del-git-branches
        git branch |
            grep --invert-match '\*' |
            cut -c 3- |
            fzf --multi --layout=reverse --preview="git log {} -n 15 --pretty=format:'%s (%an)' --" |
            xargs --no-run-if-empty git branch --delete --force
    end
end
