# Check if the shell is interactive
if status --is-interactive
    # Ensure we're not already inside a tmux session
    and not set -q TMUX
    # Check if the session is initiated via SSH
    and set -q SSH_CONNECTION
        # Attempt to attach to the 'default' session; create it if it doesn't exist
        tmux new-session -A -s default
end

set -gx LANG "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

source ~/.config/fish/config/functions.fish

source_directory ~/.config/fish/config/envs
source_directory ~/.config/fish/config/commands

# Commands to run in interactive sessions can go here
if status is-interactive
    # set -g fish_greeting "Welcome to fish, the friendly interactive shell"
    set -g fish_greeting

    source ~/.config/fish/config/keymaps.fish
    source_directory ~/.config/fish/config/plugins
    source_directory ~/.config/fish/config/envs/interactive

    starship init fish | source
    enable_transience
end
