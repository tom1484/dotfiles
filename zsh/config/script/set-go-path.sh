[[ ! -d $(readlink -f $1) ]] || export GOPATH=$(readlink -f $1); export GOBIN=$GOPATH/bin
