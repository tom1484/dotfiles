fzf_configure_bindings --directory=\cf
fzf_configure_bindings --git_log=\cl
fzf_configure_bindings --git_status=\cs
fzf_configure_bindings --history=\ch
fzf_configure_bindings --processes=\cp
fzf_configure_bindings --variables=\cv

set -gx FZF_DEFAULT_OPTS --bind=tab:down,shift-tab:up --layout=reverse --height=50%
