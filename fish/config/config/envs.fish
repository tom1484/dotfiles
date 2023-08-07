# local binary
fish_add_path ~/.local/bin/
# # library path
fish_add_path /usr/local/lib
# golang
set -Ux GOPATH $HOME/go
fish_add_path /usr/local/go/bin
fish_add_path $GOPATH/bin
# julia
fish_add_path /usr/local/julia/bin

# CharGPT key
set -Ux OPENAI_API_KEY "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"

# nvm
set -Ux nvm_default_version v18.14.2
