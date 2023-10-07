# local binary
fish_add_path ~/.local/bin/
# # library path
fish_add_path /usr/local/lib
# golang
set -x GOPATH $HOME/go
fish_add_path /usr/local/go/bin
fish_add_path $GOPATH/bin
# julia
fish_add_path /usr/local/julia/bin

# CharGPT key
set -x OPENAI_API_KEY "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"

# nvm
set -x nvm_default_version v18.14.2

# Iris
set -x LD_PRELOAD /usr/lib/x86_64-linux-gnu/libstdc++.so.6

set -x LD_LIBRARY_PATH /usr/local/lib

# Java
fish_add_path /usr/java/jre/bin
