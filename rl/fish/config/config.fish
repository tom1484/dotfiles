# Commands to run in interactive sessions can go here
source ~/.config/fish/config/envs.fish


if status is-interactive
    set -g fish_greeting "Welcome to fish, the friendly interactive shell"

    source ~/.config/fish/config/commands.fish
    source ~/.config/fish/config/keymap.fish

    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    if test -f $HOME/mambaforge/bin/conda
        eval $HOME/mambaforge/bin/conda "shell.fish" "hook" $argv | source
    end
    # <<< conda initialize <<<

    starship init fish | source
    enable_transience

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
    # fzf_configure_bindings --git_log=\cg --processes=\cp --directory=\cf --git_log=\cl
    
    # cmake
    # set --export PATH $HOME/.local/applications/cmake/bin $PATH
end
