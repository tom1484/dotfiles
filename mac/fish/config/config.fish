# Commands to run in interactive sessions can go here
source ~/.config/fish/config/envs.fish


if status is-interactive
    set -g fish_greeting "Welcome to fish, the friendly interactive shell"

    source ~/.config/fish/config/commands.fish
    source ~/.config/fish/config/keymap.fish
    source ~/.config/fish/config/plugins.fish

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f /Users/tom1484/miniforge3/bin/conda
        eval /Users/tom1484/miniforge3/bin/conda "shell.fish" "hook" $argv | source
    end
    # <<< conda initialize <<<

    starship init fish | source
    enable_transience
end

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# fzf
fzf_configure_bindings --git_status=\cs --processes=\cp --directory=\cf --git_log=\cl

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# usdview
set -gx PYTHONPATH /opt/local/USD/lib/python
set --export PATH /opt/local/USD/bin $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tom1484/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/tom1484/Downloads/google-cloud-sdk/path.fish.inc'; end
