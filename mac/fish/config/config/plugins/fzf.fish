fzf_configure_bindings --directory=\cF
fzf_configure_bindings --git_log=\cL
fzf_configure_bindings --git_status=\cS
fzf_configure_bindings --history=\cH
fzf_configure_bindings --processes=\cP
fzf_configure_bindings --variables=\cV

set -gx FZF_DEFAULT_OPTS --bind=tab:down,shift-tab:up
