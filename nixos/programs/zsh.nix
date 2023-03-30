{
    enable = true;
    shellAliases = {
    "update" = "cd ~/configs/nixos && git pull && sudo nixos-rebuild switch --flake .#";
    "update-dirty" = "cd ~/configs/nixos && sudo nixos-rebuild switch --flake .#";
    "upgrade" = "cd ~/configs/nixos && git pull && nix flake update --commit-lock-file && sudo nixos-rebuild switch --flake .# && git push";
    "c" = "code .";
    "r" = "ranger --choosedir=$HOME/.rangerdir; cd \"$(cat $HOME/.rangerdir)\"; rm $HOME/.rangerdir";
    };
    history = {
    size = 200000;
    save = 200000;
    extended = true; # save timestamps
    };
    oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "stockly";
    };
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    initExtra = ''
    cdr() {
        cd "$HOME/stockly/Main/$@"
    }
    compdef '_files -W "$HOME/stockly/Main" -/' cdr
    '';
    plugins = [
    {
        name = "stockly";
        src = ../../plugins/ZshTheme;
        file = "stockly.zsh-theme";
    }
    ];
}