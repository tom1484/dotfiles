# local binary
export PATH=$PATH:~/.local/bin/
# library path
export LD_LIBRARY_PATH=/usr/local/lib
# golang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
# julia
export PATH=$PATH:/usr/local/julia/bin

# git-fuzzy
export PATH="/home/tom1484/.oh-my-zsh/plugins/git-fuzzy/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br
[ -f ~/.cargo/env ] && source ~/.cargo/env
