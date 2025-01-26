set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

source ~/.config/fish/config/functions.fish

source_directory ~/.config/fish/config/envs

# Commands to run in interactive sessions can go here
if status is-interactive
    # set -g fish_greeting "Welcome to fish, the friendly interactive shell"
    set -g fish_greeting

    source ~/.config/fish/config/keymaps.fish
    source_directory ~/.config/fish/config/commands
    source_directory ~/.config/fish/config/plugins
    source_directory ~/.config/fish/config/envs/interactive

    starship init fish | source
    enable_transience
end
