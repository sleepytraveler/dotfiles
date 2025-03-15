function hm-switch
    if test (count $argv) -eq 1
        pushd (pwd)
        cd ~/.config/nixpkgs
        home-manager switch --flake ".#$argv[1]"
        popd
    else
        echo "Invalid number of arguments"
    end
end
