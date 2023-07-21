# Commands to run in interactive sessions can go here
source ~/.config/fish/config/envs.fish


if status is-interactive
    set -g fish_greeting "Welcome to fish, the friendly interactive shell"

    source ~/.config/fish/config/commands.fish
    source ~/.config/fish/config/keymap.fish

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f /home/tom1484/mambaforge/bin/conda
        eval /home/tom1484/mambaforge/bin/conda "shell.fish" "hook" $argv | source
    end

    if test -f "/home/tom1484/mambaforge/etc/fish/conf.d/mamba.fish"
        source "/home/tom1484/mambaforge/etc/fish/conf.d/mamba.fish"
    end
    # <<< conda initialize <<<

    starship init fish | source
    enable_transience
end


